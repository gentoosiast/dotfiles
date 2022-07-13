-- https://github.com/sainnhe/everforest
-- Time-stamp: <2021-12-04 14:51:50 gentoosiast>

vim.cmd 'packadd! everforest'
vim.cmd 'colorscheme everforest'

-- used by 'ray-x/lsp_signature.nvim'
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { underline = true })

-- nvim-ts-rainbow
vim.cmd('hi link rainbowcol1 Red')
vim.cmd('hi link rainbowcol2 Blue')
vim.cmd('hi link rainbowcol3 Yellow')
vim.cmd('hi link rainbowcol4 Green')
vim.cmd('hi link rainbowcol5 Orange')
vim.cmd('hi link rainbowcol6 Aqua')
vim.cmd('hi link rainbowcol7 Purple')
