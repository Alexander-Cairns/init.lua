vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)

-- move text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste over selected text without overriting paste buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>gb", vim.cmd.GBrowse)
vim.keymap.set("n", "<leader>gb", ":'<,'> GBrowse")

vim.keymap.set("n", "<A-j>", ":cnext<CR>")
vim.keymap.set("n", "<A-k>", ":cprev<CR>")
