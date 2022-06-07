-- https://github.com/jose-elias-alvarez/null-ls.nvim

local nls = require('null-ls')
nls.setup({
    sources = {
        nls.builtins.code_actions.eslint_d,
        nls.builtins.diagnostics.cppcheck,
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.tidy,
        nls.builtins.diagnostics.yamllint,
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.taplo
    }
})

