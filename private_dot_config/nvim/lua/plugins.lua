-- Time-stamp: <2021-12-04 20:23:17 gentoosiast>
local setup_plugin = function(fname)
   return string.format('require("settings.%s")', fname)
end

vim.api.nvim_create_augroup('packer_user_config', {})
vim.api.nvim_create_autocmd('BufWritePost', {
    group = 'packer_user_config',
    pattern = 'plugins.lua',
    callback = 'source <afile> | PackerCompile'
})

-- bootstrapping
-- https://github.com/wbthomason/packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
   packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.api.nvim_command('packadd packer.nvim')

return require('packer').startup(function(use)
      -- Packer can manage itself
      use 'wbthomason/packer.nvim'
      use {
          -- NOTE: VimScript
          'alker0/chezmoi.vim'
      }
      use {
	      'nvim-lualine/lualine.nvim',
	      requires = {'kyazdani42/nvim-web-devicons', opt = true},
	      config = setup_plugin('lualine'),
          disable = true
      }
      -- requires patched nerdfont
      use {
          'kyazdani42/nvim-web-devicons',
          config = setup_plugin('nvim-web-devicons'),
      }
      use {
          'rebelot/heirline.nvim',
	      requires = {'kyazdani42/nvim-web-devicons', opt = true},
          after = { 'everforest', 'nvim-web-devicons', 'gitsigns.nvim', 'lsp-status.nvim', 'nvim-gps' },
          config = setup_plugin('heirline')
      }
      use 'nvim-lua/lsp-status.nvim'
      use {
          -- NOTE: VimScript
	      'sainnhe/everforest',
	      config = setup_plugin('everforest_theme'),
	      -- after = 'lualine.nvim'
      }
      use {
          -- NOTE: nvim 0.6.0 or later recommended when using TreeSitter
          'nvim-treesitter/nvim-treesitter',
          -- TODO: disabled TSUpdate for now, produces an error on bootstrap
          -- run = ':TSUpdate',
          config = setup_plugin('treesitter')
      }
      use {
          'code-biscuits/nvim-biscuits',
          requires = 'nvim-treesitter/nvim-treesitter',
          after = 'nvim-treesitter',
          config = setup_plugin('nvim-biscuits')
      }
      -- docstrings
      use {
          "danymat/neogen",
          requires = "nvim-treesitter/nvim-treesitter",
          config = setup_plugin('neogen')
      }
      use {
          'SmiteshP/nvim-gps',
          requires = 'nvim-treesitter/nvim-treesitter',
          config = setup_plugin('nvim-gps')
      }
      use {
          'windwp/nvim-ts-autotag',
          config = setup_plugin('nvim-ts-autotag')
      }
      -- config in settings/treesitter.lua
      use {
          'p00f/nvim-ts-rainbow'
      }
      use 'rebelot/kanagawa.nvim'
      use 'gpanders/editorconfig.nvim'
      use {
	      'neovim/nvim-lspconfig',
	      config = setup_plugin('lspconfig'),
          after = { 'cmp-nvim-lsp', 'schemastore.nvim' }
      }
      use {
          'j-hui/fidget.nvim',
          config = setup_plugin('fidget')
      }
      use "b0o/schemastore.nvim"
      use {
          'ray-x/lsp_signature.nvim',
          config = setup_plugin('lsp_signature')
      }
      use {
          'jose-elias-alvarez/null-ls.nvim',
          requires = {'nvim-lua/plenary.nvim'},
          config = setup_plugin('null-ls')
      }
      use {
	      'folke/which-key.nvim',
	      config = setup_plugin('whichkey')
      }
      use {
	      'phaazon/hop.nvim',
	      config = setup_plugin('hop')
      }
      use {
          'norcalli/nvim-colorizer.lua',
          config = setup_plugin('colorizer')
      }
      use {
          'ziontee113/color-picker.nvim',
          config = setup_plugin('color-picker')
      }
      use {
          -- NOTE: nvim 0.6.0 or later required
          'nvim-telescope/telescope.nvim',
          requires = {'nvim-lua/plenary.nvim'},
          config = setup_plugin('telescope')
      }
      use {
          -- requires 'make' and C compiler
          'nvim-telescope/telescope-fzf-native.nvim',
          run = 'make',
          after = 'telescope.nvim',
          config = setup_plugin('telescope-fzf-native')
      }
      use {
          'ethanholz/nvim-lastplace',
          config = setup_plugin('lastplace')
      }
      use {
          'kyazdani42/nvim-tree.lua',
          requires = {'kyazdani42/nvim-web-devicons'},
          config = setup_plugin('tree'),
          disable = true
      }
      use {
          'nvim-neo-tree/neo-tree.nvim',
          branch = "v2.x",
          requires = {
              "nvim-lua/plenary.nvim",
              "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
              "MunifTanjim/nui.nvim",
          },
          config = setup_plugin('neo-tree')
      }
      use {
          'Pocco81/TrueZen.nvim',
          config = setup_plugin('truezen')
      }
      use 'nyngwang/NeoZoom.lua'

      use {
          'hrsh7th/nvim-cmp',
          config = setup_plugin('cmp')
      }
      use 'onsails/lspkind-nvim'
      use 'hrsh7th/cmp-buffer'
      use 'hrsh7th/cmp-nvim-lsp'
      use 'hrsh7th/cmp-cmdline'
      use 'hrsh7th/cmp-path'
      use 'hrsh7th/cmp-nvim-lua'
      use 'hrsh7th/cmp-emoji'
      use {
          'dmitmel/cmp-digraphs',
          branch = 'master'
      }
      use {
          'L3MON4D3/LuaSnip',
          config = setup_plugin('luasnip')
      }
      use 'saadparwaiz1/cmp_luasnip'

      -- indentation guides
      use {
          'lukas-reineke/indent-blankline.nvim',
          after = 'everforest',
          config = setup_plugin('indent-blankline')
      }

      use {
          "numToStr/Comment.nvim",
          config = setup_plugin('comment')
      }

      use {
          'lewis6991/gitsigns.nvim',
          requires = 'nvim-lua/plenary.nvim',
          config = setup_plugin('gitsigns')
      }

      use {
          'p00f/cphelper.nvim',
          requires = 'nvim-lua/plenary.nvim'
      }

      use {
          'xeluxee/competitest.nvim',
          requires = 'MunifTanjim/nui.nvim',
          config = setup_plugin('competitest')
      }

      use 'rktjmp/paperplanes.nvim'
      
      use {
          'simrat39/rust-tools.nvim',
          after = 'nvim-lspconfig',
          config = setup_plugin('rust-tools')
      }

      use 'mfussenegger/nvim-dap'

      use {
          'nvim-orgmode/orgmode',
          config = setup_plugin('orgmode')
      }

      use {
          'mickael-menu/zk-nvim',
          config = setup_plugin('zk')
      }

      use {
          'tpope/vim-fugitive'
      }

      use {
          'KabbAmine/zeavim.vim',
          config = setup_plugin('zeavim')
      }

      use {
          'catppuccin/nvim',
          as = 'catppuccin'
      }

      use 'tpope/vim-surround'

      use {
          'kevinhwang91/nvim-ufo',
          requires = 'kevinhwang91/promise-async',
          config = setup_plugin('nvim-ufo')
      }

      use {
          'anuvyklack/hydra.nvim',
          requires = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
      }

      -- https://github.com/p00f/clangd_extensions.nvim
      -- simrat39/rust-tools.nvim
      -- some plugin which updates timestamp at the beginning of document at every save

      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
      if packer_bootstrap then
         require('packer').sync()
      end
end)
