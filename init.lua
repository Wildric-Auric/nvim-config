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
