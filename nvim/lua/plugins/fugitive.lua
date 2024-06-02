-- fugitive.lua

return {
  "tpope/vim-fugitive",
  cmd = {
    "G",
    "Git",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "GMove",
    "GDelete",
    "GBrowse",
    "GRemove",
    "GRename",
    "Glgrep",
    "Gedit",
  },
  ft = { "fugitive" },
  config = function()
    vim.cmd([[
      nnoremap <silent> <leader>gs :tab G<CR>
      nnoremap <silent> <leader>gd :Gdiffsplit<CR>
      nnoremap <silent> <leader>gc :Git commit<CR>
      nnoremap <silent> <leader>gb :Git blame<CR>
      nnoremap <silent> <leader>gl :Gclog<CR>
      nnoremap <silent> <leader>gp :Git push<CR>
      nnoremap <silent> <leader>gr :Gread<CR>
      nnoremap <silent> <leader>gw :Gwrite<CR>
      nnoremap <silent> <leader>gsd :Gsdiff<CR>
      nnoremap <silent> <leader>gx :cexpr system('git rev-parse --show-toplevel \| tr -d "\\n"')<CR>

      augroup fugitive_conf
        autocmd!
        autocmd User FugitiveChanged,FugitiveEnteringCommit,FugitiveExecuteCommand nested
              \ if &buftype ==# 'nofile' || &filetype =~# 'fugitive\|gitrebase' | set bufhidden=delete | endif
        autocmd BufReadPost fugitive://* set bufhidden=delete
      augroup END
    ]])
  end,
}
