require "nvchad.mappings"
local telescope = require("telescope.builtin")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- To search files tracked by git
map("n", "<C-p>", telescope.git_files, {})
map("n", "<leader>ps", function()
    telescope.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- To move blocks of text up/down in visual mode using Shift+k/j
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

-- The default of Shift+j puts the line below at the end of the current line adding a space
-- Here we say that the cursor should stay where it is (instead of moving to the end of the current line)
map("n", "J", "mzJ`z")

-- To keep the cursor in the middle while moving and searching
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- For debugging
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
map("n", "<leader>dbp", require("dap-python").test_method)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
