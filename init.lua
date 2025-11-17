require("scripts.set")
require("scripts.remap")
require("scripts.lazy")
require("scripts.ql")

vim.cmd([[
augroup _glsl 
autocmd!
autocmd BufRead,BufEnter *.{vert,frag,tesc,tese,geom,comp,shader,program} set filetype=glsl
augroup end
]])

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.indentexpr = ""
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {"*.bin", "*.exe", "*.dat", "*.o", "*.img"},  -- binary file extensions
    callback = function()
        vim.cmd("%!xxd")             -- convert buffer to hex
        vim.cmd("setlocal binary")   -- treat as binary
        vim.cmd("setlocal readonly") -- make buffer read-only
        vim.cmd("setlocal nowrap")   -- optional: no line wrapping
    end
})

