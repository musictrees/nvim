-- autocompletion
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

