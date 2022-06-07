-- https://github.com/sainnhe/everforest
-- Time-stamp: <2021-12-04 14:51:50 gentoosiast>

vim.cmd 'packadd! everforest'
vim.cmd 'colorscheme everforest'

-- used by 'ray-x/lsp_signature.nvim'
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { underline = true })
