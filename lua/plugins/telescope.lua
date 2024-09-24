local Path = require("utils.path")

local function find_files_from_project_git_root()
  local opts = {}
  if Path.is_git_repo() then
    opts = {
      cwd = Path.get_git_root(),
    }
  end
  require("telescope.builtin").find_files(opts)
end

local function find_in_current_buffer()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = true,
  }))
end

local function get_buffers()
  require("telescope.builtin").buffers({
    sort_mru = true,
    ignore_current_buffer = true,
    show_all_buffers = true,
  })
end

local function live_grep_from_project_git_root()
  local opts = {}

  if Path.is_git_repo() then
    opts = {
      cwd = Path.get_git_root(),
    }
  end

  require("telescope.builtin").live_grep(opts)
end

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = "   ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<A-a>"] = require("telescope.actions").close,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
    },
    keys = {
      -- add <leader>fa to find all, including hidden files
      {
        "<C-p>",
        "<cmd> Telescope find_files follow=true hidden=true <CR>",
        desc = "Find All Files (including hidden)",
      },
      -- add <leader>fl to live grep from git root
      {
        "<C-S-f>",
        function()
          live_grep_from_project_git_root()
        end,
        desc = "Live Grep From Project Git Root",
      },
      {
        "<C-tab>",
        function()
          get_buffers()
        end,
        desc = "Search Recent Buffers",
      },
      -- {
      --   "<C-f>",
      --   function()
      --     find_in_current_buffer()
      --   end,
      --   desc = "Search Recent Buffers",
      -- },
      {
        "<leader><leader>",
        false,
      },
      -- add <leader>fg to find files from project git root
    },
  },
}
