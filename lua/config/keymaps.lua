-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("craftzdog.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Create splits
keymap.set("n", "th", ":split<CR>")
keymap.set("n", "tv", ":vsplit<CR>")
-- Move to previous buffer
keymap.set("n", "tr", ":bp<CR>")
-- Close splits and others
keymap.set("n", "tt", ":q<CR>")
-- Delete a buffer
keymap.set("n", "td", ":bd<CR>")

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-Left>", "<C-w><")
keymap.set("n", "<C-Right>", "<C-w>>")
keymap.set("n", "<C-Up>", "<C-w>+")
keymap.set("n", "<C-Down>", "<C-w>-")

-- Save
keymap.set("n", "<leader>w", "<CMD>update<CR>")
-- Quit
keymap.set("n", "<leader>q", "<CMD>q<CR>")
-- Buffer
keymap.set("n", "<TAB>", "<CMD>bnext<CR>")
keymap.set("n", "<S-TAB>", "<CMD>bprevious<CR>")
-- Markdown Preview
keymap.set("n", "<leader>m", "<CMD>MarkdownPreview<CR>")
keymap.set("n", "<leader>mn", "<CMD>MarkdownPreviewStop<CR>")

-- VScode shortcut keys session
--
-- Remap Ctrl+z to undo
keymap.set("n", "<C-z>", "u")

-- Remap Ctrl+y to redo
keymap.set("n", "<C-y>", "<C-r>")

-- Remap Alt + Down Arrow to copy and paste a line below
keymap.set("n", "<M-Down>", "yyjP")

-- Remap Ctrl + N to Ctrl + D for multiple selections
keymap.set("n", "<C-d>", "<C-n>")

-- Remap Alt + Up Arrow to move the current line up
keymap.set("n", "<A-Up>", ":m-2<CR>==")

-- Remap Alt + Down Arrow to move the current line down
keymap.set("n", "<A-Down>", ":m+<CR>==")

-- Remap Ctrl + ; to toggle commenting
keymap.set("n", "<leader>;", ":CommentToggle<CR>")
keymap.set("v", "<leader>;", ":CommentToggle<CR>")

-- down = j, up = k to down = k, up = j
keymap.set("n", "k", "j")
keymap.set("n", "j", "k")

-- down = j, up = k to down = k, up = j
keymap.set("v", "k", "j")
keymap.set("v", "j", "k")

keymap.set("n", "P", ":!npx prettier -- --write %<CR>")
keymap.set("n", "L", ":!npx eslint -- --fix %<CR>")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
  require("craftzdog.utils").replaceHexWithHSL()
end)