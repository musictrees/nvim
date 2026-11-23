-- blink
local cmp = require('blink.cmp')
cmp.build():pwait() -- compiles the Rust matcher; the first run can take a minute
cmp.setup({
    keymap = { preset = 'default' }, -- or 'super-tab' / 'enter'
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- lets lazydev feed `vim.*` completions into blink in Lua files
        per_filetype = { lua = { inherit_defaults = true, 'lazydev' } },
        providers = {
            lazydev = {
                name = 'LazyDev',
                module = 'lazydev.integrations.blink',
                score_offset = 100,
            },
        },
    },
})

-- makes LSP know vim global variable on init.lua
require('lazydev').setup({
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
})

-- auto install LSP language servers
require('mason').setup()
require('mason-tool-installer').setup({
    ensure_installed = {
        'vtsls',
        'lua-language-server',
        'clangd',
        'eslint-lsp',
        'tailwindcss-language-server',
        'css-lsp',
        'html-lsp',
        'json-lsp',
        -- formatters for conform
        'prettier',
        'stylua',
        'clang-format',
    },
})

require('nvim-treesitter').install({ 'lua', 'vim', 'vimdoc', 'javascript', 'typescript', 'tsx', 'c', 'cpp', })

vim.api.nvim_create_autocmd('FileType', {
    callback = function() pcall(vim.treesitter.start) end,
})

------- improving LSP behavior -------
vim.diagnostic.config({ virtual_text = true, update_in_insert = true })
vim.opt.signcolumn = 'yes'
-- this makes the update only happens on ESC while keeping the LETTERS on the left side always rendered

local orig = vim.lsp.handlers['textDocument/publishDiagnostics']
local pending = {}

vim.lsp.handlers['textDocument/publishDiagnostics'] = function(err, result, ctx, config)
    if vim.fn.mode():sub(1, 1) == 'i' and result then
        pending[ctx.client_id .. ':' .. result.uri] = { err, result, ctx, config }
        return
    end
    return orig(err, result, ctx, config)
end

vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
        for key, args in pairs(pending) do
            pending[key] = nil
            orig(unpack(args))
        end
    end,
})

-- Use default LSP configurations from nvim-lspconfig
vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
})

-- Use default LSP configurations from nvim-lspconfig
vim.lsp.enable({'rust_analyzer', 'clangd', 'vtsls', 'eslint','tailwindcss', 'cssls', 'html', 'jsonls', 'lua_ls'})
