vim.keymap.set("n", "<leader>pd", vim.cmd.Ex)
--Tabs
vim.keymap.set("n", "<leader>to", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose)
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnext)
vim.keymap.set("n", "<leader>tp", vim.cmd.tabprevious)
vim.keymap.set("n", "<leader>tq", vim.cmd.tabonly)

vim.keymap.set("x", "<leader>cc", ":s/^/\\/\\/<CR>") --Comment selected lines

vim.keymap.set("n", "<C-h>",  "<C-w>h")
vim.keymap.set("n", "<C-k>",  "<C-w>k")
vim.keymap.set("n", "<C-l>",  "<C-w>l")
vim.keymap.set("n", "<C-j>",  "<C-w>j")
vim.keymap.set("n", "<C-s>",  "<C-w>w")

vim.keymap.set("n", "<leader>tv",  ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>tt",  ":Oil<CR>")
vim.keymap.set("t", "<C-o>", [[<C-\><C-n>]])
--copy using the clipboard
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<C-_>", "<C-^>", { noremap = true })
--Lsp diagnostic
vim.keymap.set("n","<down>", function() vim.diagnostic.jump({count=1,  float=true}) end);
vim.keymap.set("n","<up>", function() vim.diagnostic.jump({count=-1, float=true}) end);
--Window
vim.keymap.set("n","<M-k>", ":resize +2<CR>", {silent = true});
vim.keymap.set("n","<M-j>", ":resize -2<CR>", {silent = true});
vim.keymap.set("n","<M-l>", ":vertical resize +2<CR>", {silent = true});
vim.keymap.set("n","<M-h>", ":vertical resize -2<CR>", {silent = true});
