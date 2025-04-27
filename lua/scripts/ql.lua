
local defaultCol = "retrobox"
local pref = vim.fn.stdpath('cache') .. "/ql"
if vim.fn.isdirectory(pref) == 0 then
    vim.fn.mkdir(pref)
end
local QLdefColPath = pref .. "/qlDefCol"

function QLReadDefCol()
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
    return col
end

function QLFetchDefaultCol()
    vim.cmd.colorscheme(QLReadDefCol())
end

function QLSaveDefaultCol(c)
    local file = io.open(QLdefColPath, "w+")
    io.output(file)
    io.write(c)
    io.close()
end

function QLGetDefCol()
    vim.print(QLReadDefCol())
end

function PrintHex(num)
    local dec = tonumber(num)
    if dec == nil then
        print("Invalid argument; provide a number")
        return
    end
    print(string.format("0x%X",dec))
end

vim.api.nvim_create_user_command("QLsetDefCol",
function(opts)
    QLSaveDefaultCol(opts.args)
end, {
    nargs = 1,
    complete = "color"
})

vim.api.nvim_create_user_command("QLgetDefCol",
function()
    QLGetDefCol()
end, {}
)

vim.api.nvim_create_user_command("QLHex",
function(opts)
    PrintHex(opts.args)
end, {
    nargs = 1
}
)

QLFetchDefaultCol()
