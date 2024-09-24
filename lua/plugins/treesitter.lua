return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- extend the default parsers
    vim.list_extend(opts.ensure_installed, {
      "css",
      "html",
      "javascript",
      "scss",
      "tsx",
      "typescript",
      "xml",
    })
  end,
}
