
vim.api.nvim_create_autocmd({"BufRead", "BufEnter"}, {
    pattern = {"*.vert","*.frag","*.tesc","*.tese","*.geom","*.comp","*.shader","*.program"},
    callback = function()
        vim.cmd("set filetype=glsl")
    end
})

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
