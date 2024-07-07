vim.keymap.set("n", "<leader>pd", vim.cmd.Ex)
--Tabs
vim.keymap.set("n", "<leader>to", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnext)
vim.keymap.set("n", "<leader>tp", vim.cmd.tabprevious)
vim.keymap.set("n", "<leader>tq", vim.cmd.tabonly)

vim.keymap.set("x", "<leader>cc", ":s/^/\\/\\/<CR>") --Comment selected lines

vim.keymap.set("n", "<left>",  "i")
vim.keymap.set("n", "<right>", "a")
vim.keymap.set("n", "<up>",    "i")
vim.keymap.set("n", "<down>",  "a")
