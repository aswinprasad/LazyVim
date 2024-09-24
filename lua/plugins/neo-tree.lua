return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<C-b>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    { "<C-e>", "<cmd>Neotree focus<cr>", desc = "Neotree focus" },
  },
  opts = {
    window = {
      width = 30,
      mappings = {
        ["o"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        ["Z"] = "system_open",
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        -- Windows: Without removing the file from the path, it opens in code.exe instead of explorer.exe
        local p
        local lastSlashIndex = path:match("^.+()\\[^\\]*$") -- Match the last slash and everything before it
        if lastSlashIndex then
          p = path:sub(1, lastSlashIndex - 1) -- Extract substring before the last slash
        else
          p = path -- If no slash found, return original path
        end
        vim.cmd("silent !start explorer " .. p)
      end,
    },
  },
  filesystem = {
    window = {
      mappings = {},
    },
  },
}
