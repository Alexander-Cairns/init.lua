local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup({
	'thePrimeagen/harpoon',
	'mbbill/undotree',
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Autocompletion
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua',

			-- Snippets
			'L3MON4D3/LuaSnip',
			-- Snippet Collection (Optional)
			'rafamadriz/friendly-snippets',
		}
	},
  'norcalli/nvim-colorizer.lua',
  {'Mofiqul/dracula.nvim', name = 'dracula'},
},{})

