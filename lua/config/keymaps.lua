-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Silent keymap option
local opts = { silent = true }

-- Select all
vim.keymap.set({ "n", "v" }, "<C-a>", "ggVG", { noremap = true })

-- Redo
vim.keymap.set("n", "<S-u>", "<C-r>", { noremap = true })

-- Save all buffers
-- vim.keymap.set("n", "<C-S>", "<cmd>wa<CR>", { noremap = true })

-- Better copy and paste in visual mode
vim.keymap.set("v", "p", '"_dP', { noremap = true })

-- Don't yank newline when using $
vim.keymap.set("v", "$", "g_", { noremap = true })

-- Escape insert mode with jk
vim.keymap.set({ "n", "v", "i" }, "<A-a>", "<ESC>", { noremap = true })

-- Move to the beginning of the line
vim.keymap.set({ "n", "v" }, "H", "^", { noremap = true })

-- Move to the end of the line
vim.keymap.set({ "n", "v" }, "L", "$", { noremap = true })

-- Scroll Up & Center
vim.keymap.set("n", "K", "<C-u>zz", { noremap = true, desc = "Scroll Up & Center" })

-- Scroll Down & Center
vim.keymap.set("n", "J", "<C-d>zz", { noremap = true, desc = "Scroll Down & Center" })

-- Displays hover information about the symbol under the cursor in a floating
-- vim.keymap.set("n", "gh", vim.lsp.buf.hover, { noremap = true, desc = "LSP: Hover" })

-- Increase vertical split
vim.keymap.set("n", "<C-l>", "<cmd> vertical resize +5 <CR>", { noremap = true, desc = "Increase vertical split" })

-- Decrease vertical split
vim.keymap.set("n", "<C-h>", "<cmd> vertical resize -5 <CR>", { noremap = true, desc = "Decrease vertical split" })

-- Increase horizontal split
vim.keymap.set("n", "<C-k>", "<cmd> horizontal resize -5 <CR>", { noremap = true, desc = "Decrease horizontal split" })

-- Decrease horizontal split
vim.keymap.set("n", "<C-j>", "<cmd> horizontal resize +5 <CR>", { noremap = true, desc = "Increase horizontal split" })

-- Move to left pane
vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, desc = "Move to left pane" })

-- Move to below pane
vim.keymap.set("n", "<leader>j", "<C-w>j", { noremap = true, desc = "Move to below pane" })

-- Move to top pane
vim.keymap.set("n", "<leader>k", "<C-w>k", { noremap = true, desc = "Move to top pane" })

-- Move to right pane
vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap = true, desc = "Move to right pane" })

-- Close current pane
vim.keymap.set("n", "<A-W>", "<C-w>q", { noremap = true, desc = "Close pane" })

-- Split window vertically
vim.keymap.set("n", "<leader>v", "<cmd> vsp <CR>", { noremap = true, desc = "Split Vertical" })

-- Split window horizontally
vim.keymap.set("n", "<leader>w", "<cmd> sp <CR>", { noremap = true, desc = "Split Horizontal" })

-- Close buffer
vim.keymap.set("n", "<C-w>", "<cmd> bd <CR>", { noremap = true, desc = "Close Buffer" })

-- Paste in insert mode
vim.keymap.set("i", "<C-v>", "<c-r>+", { noremap = true, desc = "Paste in insert mode" })

-- Redraw / Clear hlsearch / Diff Update
vim.keymap.set(
  "n",
  "<leader>/",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { noremap = true, desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- Save without format
vim.keymap.set({ "n", "x", "s" }, "<leader>s", "<cmd>noa w<CR>", { noremap = true, desc = "Save without format" })

-- Search current buffer
vim.keymap.set(
  "n",
  "<C-f>",
  "<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<cr>",
  { desc = "Find in Current Buffer" }
)

-- Resume Telescope search
vim.keymap.set("n", "<leader>f", "<cmd>Telescope resume<cr>", { noremap = true, desc = "Resume Telescope search" })

-- Lspsaga
-- LSP finder - Find the symbol's definition
vim.keymap.set("n", "gR", "<cmd>Lspsaga finder ref<CR>", { noremap = true, desc = "LSP: Find references" })

-- Code action
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
-- vim.keymap.set("n", "cr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
-- vim.keymap.set("n", "cR", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to type definition
vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

-- Diagnostic jump can use `<c-o>` to jump back
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
vim.keymap.set("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)

vim.keymap.set("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle Outline
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Pressing the key twice will enter the hover window
vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>")

-- Substitute
vim.keymap.set("n", "gr", require("substitute").operator, { noremap = true, desc = "Substitute" })
vim.keymap.set("n", "grr", require("substitute").line, { noremap = true, desc = "Substitute line" })
vim.keymap.set("n", "grS", require("substitute").eol, { noremap = true, desc = "Substitute to end of line" })
vim.keymap.set("x", "gr", require("substitute").visual, { noremap = true, desc = "Substitute visual" })

-- remap % to ctrl m for matching pairs like (), [], {} and html tags
vim.keymap.set("n", "<C-m>", "%", { noremap = true, desc = "Match pairs" })
--
-- Disable `q` for macro recording as default
-- Set initial state for 'q'
vim.g.q_record_macro = false
vim.keymap.set("n", "q", "<Nop>", { noremap = true })

-- Function to toggle 'q' functionality
function _G.toggle_q_macro()
  if vim.g.q_record_macro then
    -- If currently set for recording macros, make 'q' do nothing
    vim.keymap.set("n", "q", "<Nop>", { noremap = true })
    vim.g.q_record_macro = false
    vim.print("Macro recording disabled")
  else
    -- If currently set to do nothing, make 'q' record macros
    vim.keymap.set("n", "q", "q", { noremap = true })
    vim.g.q_record_macro = true
    vim.print("Macro recording enabled")
  end
end

vim.keymap.set(
  "n",
  "<leader>uq",
  "<cmd>lua _G.toggle_q_macro()<CR>",
  { noremap = true, silent = true, desc = "Toggle 'q' Functionality" }
)
