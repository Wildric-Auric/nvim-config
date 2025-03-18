vim.keymap.set("n", "<leader>pd", vim.cmd.Ex)
--Tabs
vim.keymap.set("n", "<leader>to", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnext)
vim.keymap.set("n", "<leader>tp", vim.cmd.tabprevious)
vim.keymap.set("n", "<leader>tq", vim.cmd.tabonly)
vim.keymap.set("n", "<leader>h",  "<C-w>h")
vim.keymap.set("n", "<leader>k",  "<C-w>k")
vim.keymap.set("n", "<leader>l",  "<C-w>l")
vim.keymap.set("n", "<leader>j",  "<C-w>j")
vim.keymap.set("n", "<leader>w",  "<C-w>w")

vim.keymap.set("x", "<leader>cc", ":s/^/\\/\\/<CR>") --Comment selected lines

vim.keymap.set("n", "<left>",  "i")
vim.keymap.set("n", "<right>", "a")
vim.keymap.set("n", "<up>",    "i")
vim.keymap.set("n", "<down>",  "a")
