return {
  "mg979/vim-visual-multi",
  branch = "master",
  enabled = true,
  lazy = false,
  config = function() end,
  init = function()
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",
      ["Find Subword Under"] = "<C-d>",
      ["Skip Region"] = "<C-n>",
      ["Exit"] = "<A-a>",
    }
  end,
}
