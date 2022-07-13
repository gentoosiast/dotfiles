-- https://github.com/anuvyklack/hydra.nvim

local Hydra = require'hydra'

Hydra({
    name = 'Window management',
    hint = [[
    <C-h> Move to the left window   <C-l> Move to the right window
    <C-j> Move to the down window   <C-k> Move to the up window
    Q - close current window
    ]],
    mode = 'n',
    body = '<leader>w',
    heads = {
        { '<C-h>', '<C-w>h' },
        { '<C-j>', '<C-w>j' },
        { '<C-k>', '<C-w>k' },
        { '<C-l>', '<C-w>l' },
        { 'Q', '<C-w>q' }
    }
})
