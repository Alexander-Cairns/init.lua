return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function() 
    require("telescope").setup()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    ---vim.keymap.set('n', '<leader>fs', function()
    ---builtin.grep_string({search = vim.fn.input("Grep > ")});
    ---end)
    vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>fr', builtin.resume, {})
  end,

}