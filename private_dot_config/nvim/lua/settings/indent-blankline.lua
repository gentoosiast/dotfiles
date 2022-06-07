-- https://github.com/lukas-reineke/indent-blankline.nvim

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#5b4348 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#485448 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#575348 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#3d5254 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#564955 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#3e544c gui=nocombine]]

require("indent_blankline").setup {
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6"
    }
}

