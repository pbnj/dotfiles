local tsconfigs = require'nvim-treesitter.configs'

tsconfigs.setup {
    ensure_installed = "all",
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}
