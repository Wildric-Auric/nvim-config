local harpoon = require("harpoon")
-- basic telescope configuration
local conf = require("telescope.config").values

local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

local maxWhales = 3
local function restricted_add()
    local l = harpoon:list()
    local len = #l.items
    if len < maxWhales then
        l:add()
    else
        for i = 2, len do
            l.items[i-1] = l.items[i]
        end
        l:remove_at(len)
        l:add()
    end
end

harpoon:setup()
vim.keymap.set("n", "<leader>ha", function() restricted_add() end)
vim.keymap.set("n", "<leader>hfa", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end)


vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-N>", function() harpoon:list():next() end)

vim.keymap.set("n", "<leader>fh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--vim.keymap.set("n", "<leader>fh", function() toggle_telescope(harpoon:list()) end,
--{ desc = "Open harpoon window" })
