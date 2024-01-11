return {
	'thePrimeagen/harpoon',
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
    end,
  },
	'tpope/vim-rhubarb',
	'mfussenegger/nvim-ansible',
}
