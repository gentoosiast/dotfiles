-- https://github.com/folke/which-key.nvim

local wk = require'which-key'

wk.setup{}

-- <leader> mappings
wk.register({
    t = {
        name = '🔭 telescope',
        d = { '<CMD>Telescope diagnostics<CR>', 'diagnostics' },
        f = { '<CMD>Telescope find_files<CR>',  'find files' },
        r = { '<CMD>Telescope live_grep<CR>',   'ripgrep' },
        m = { '<CMD>Telescope man_pages sections=ALL<CR>',   'manpages' }
    },
    ["'"] = { '<CMD>HopChar1<CR>', 'Hop Char' },
    ['$'] = { '<CMD>set list!<CR>', 'toggle list mode' },
    b = { '<CMD>Telescope buffers ignore_current_buffer=true sort_mru=true<CR>', 'switch buffers' },
    e = { '<CMD>Neotree toggle<CR>', 'Toggle Neo-tree' }
}, { prefix = '<leader>' })

wk.register({
    ['[d'] = { vim.diagnostic.goto_prev,    'Move to the previous diagnostic' },
    [']d'] = { vim.diagnostic.goto_next,    'Move to the next diagnostic' }
})
