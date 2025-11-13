
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

function QLclangFmt()
    local f = vim.fn.expand("%:p")
    vim.fn.system({'clang-format', '-i', f})
    vim.cmd('e')
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

vim.api.nvim_create_user_command("QLclangFmt",
function()
    QLclangFmt()
end, {
    nargs = 0
}
)

QLFetchDefaultCol()

vim.api.nvim_create_user_command("QLgetCurDef",
function()
        local ts = vim.treesitter
        local utils = require("nvim-treesitter.ts_utils")
        local node = utils.get_node_at_cursor()
        if node == nil then return end
        while node and (node:type() ~= "function_definition" or node:type() ~= "function_declaration") do
          node = node:parent()
        end
        if not node then return end
        local body = node:field("body")[1]
        local a,b,_,_   = node:range()
        local e,f,_,_   = body:range()
        local cnt  = vim.api.nvim_buf_get_lines(0, a, e+1, false)
        cnt[1]    = cnt[1]:sub(b+1)
        cnt[#cnt] = cnt[#cnt]:sub(1, f-1)
        print(table.concat(cnt,"\n"))
end, {nargs = 0}
)


function GetAllDefs()
    local ts = vim.treesitter
    local lang = vim.bo.filetype
    local root = ts.get_parser(0, lang):parse()[1]:root()
    local q = ts.query.parse(lang, "(function_definition) @fn")
    local fns = {}
    for id, node in q:iter_captures(root, 0) do
      if q.captures[id] == "fn" then
        local body      = node:field("body")[1]
        local a,b,_,_   = node:range()
        local e,f,_,_   = body:range()
        fns[#fns+1] = {range = {a,b,e,f}}
      end
    end
    local txt = ""
    for _, fn in ipairs(fns) do
        local unp = table.unpack or unpack
        local a,b,e,f = unp(fn.range)
        local cnt = vim.api.nvim_buf_get_lines(0, a, e+1, false)
        cnt[1]    = cnt[1]:sub(b+1)
        cnt[#cnt] = cnt[#cnt]:sub(1, f-1)
        txt = txt .. table.concat(cnt,"\n") .. ";\n"
    end
    return txt
end


vim.api.nvim_create_user_command("QLgetDefs",
function()
    local txt = GetAllDefs()
    if (txt == nil or txt == "") then return end
    print(txt)
    vim.fn.setreg('"', txt,'v')
end, {nargs = 0}
)
