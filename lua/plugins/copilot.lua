return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""

      vim.cmd([[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]])
      vim.cmd([[let g:copilot_no_maps = v:true]])
    end,
  },
} -- add the copilot.vim plugin
