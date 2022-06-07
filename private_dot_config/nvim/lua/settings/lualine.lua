-- https://github.com/nvim-lualine/lualine.nvim
-- Time-stamp: <2021-12-04 16:23:46 gentoosiast>

require'lualine'.setup({
	options = {
		theme = 'everforest',
		section_separators = { left = '', right = ''},
		component_separators = { left = '｜', right = '｜'},
        globalstatus = true
	},
	sections = {
		lualine_a = {
			{'mode', fmt = function(str) return str:sub(1, 1) end}
		}
	}
})

