
local defaultCol = "retrobox"
local pref = vim.fn.stdpath('cache') .. "/ql"
if vim.fn.isdirectory(pref) == 0 then
    vim.fn.mkdir(pref)
end
local QLdefColPath = pref .. "/qlDefCol"

function QLFetchDefaultCol()
    local file = io.open(QLdefColPath, "r")
    local col = defaultCol
    if file ~= nil then
        io.input(file)
        local line = io.read("*line")
        if line then
            col = line
        end
    col = col:gsub("%s+", "")
    io.close(file)
    end
    vim.cmd.colorscheme(col)
end


QLFetchDefaultCol()

function QLSaveDefaultCol(c)
    local file = io.open(QLdefColPath, "w+")
    io.output(file)
    io.write(c)
    io.close()
end
vim.api.nvim_create_user_command("QLsetDefCol",
function(opts)
    QLSaveDefaultCol(opts.args)
end, {
    nargs = 1,
    complete = "color"
})
