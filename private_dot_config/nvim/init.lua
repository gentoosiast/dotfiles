-- Time-stamp: <2021-12-04 13:07:50 gentoosiast>

-- use newer filetype.lua
-- https://www.reddit.com/r/neovim/comments/rvwsl3/introducing_filetypelua_and_a_call_for_help/
-- TODO: breaks chezmoi template highlighting if enabled
-- vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 0

-- Neovide requires that a font be set in init.vim otherwise errors might be
-- encountered
vim.opt.guifont = 'Hack Nerd Font:h10'

require('plugins')
require('options')
require('mappings')
require('misc')

