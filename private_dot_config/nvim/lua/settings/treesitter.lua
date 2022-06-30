-- https://github.com/nvim-treesitter/nvim-treesitter

require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'bash', 'c', 'cmake', 'comment', 'cpp', 'css', 'hjson', 'html', 'javascript', 'jsdoc', 'json',
'json5', 'jsonc', 'llvm', 'lua', 'make', 'org', 'python', 'regex', 'rust', 'scss', 'toml', 'typescript', 'vim', 'yaml' },
	highlight = {
		enable = true,
        disable = { 'html', 'org' },
        additional_vim_regex_highlighting = { 'org' }  -- Required since TS highlighter doesn't support all syntax features (conceal)
	},
    rainbow = {
        enable = true
    }
}

