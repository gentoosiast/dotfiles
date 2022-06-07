-- https://github.com/hrsh7th/nvim-cmp/
-- https://github.com/onsails/lspkind-nvim

local cmp = require'cmp'
local lspkind = require'lspkind'
local luasnip = require'luasnip'

cmp.setup({
    snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body)
        end
    },
    mapping = {
        ['<C-G>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- ['<C-J>'] = cmp.mapping.select_next_item(),
        -- ['<C-K>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
                luasnip.change_choice(-1)
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<C-k>'] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            elseif cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<C-F>'] = cmp.mapping.scroll_docs(4),
        ['<C-B>'] = cmp.mapping.scroll_docs(-4),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Y>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' })
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'emoji' },
        { name = 'buffer' },
        { name = 'digraphs' }
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            menu = ({
                buffer = '[buf]',
                path = '[path]',
                nvim_lsp = '[LSP]',
                luasnip = '[snip]',
                nvim_lua = '[lua]',
                emoji = '[emoji]',
                digraphs = '[dgr]'
            })
        })
    },
    experimental = {
        ghost_text = true
    }
})

cmp.setup.cmdline(':', {
    sources = {
        { name = 'cmdline', keyword_length = 3 }
    }
})

