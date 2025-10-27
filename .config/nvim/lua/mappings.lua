require "nvchad.mappings"

-- add yours here
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>v")
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- See `:help telescope.builtin`
local builtin = require "telescope.builtin"
map({ "n", "v" }, "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
map({ "n", "v" }, "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
map({ "n", "v" }, "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
map({ "n", "v" }, "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
map({ "n", "v" }, "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
map({ "n", "v" }, "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
map({ "n", "v" }, "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
map({ "n", "v" }, "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld files" })
map({ "n", "v" }, "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
map("n", "<leader>f/", function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  }
end, { desc = "[S]earch [/] in Open Files" })

-- Set to true if you have a Nerd Font installed and selected in the terminal. Required: https://www.nerdfonts.com/
vim.g.have_nerd_font = true

-- Make line numbers default
vim.o.number = true
-- Relative jumping. Will try later.
-- vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"
--
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the
-- search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 20

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- lsp mappings
map("n", "K", vim.lsp.buf.hover, { desc = "Hover?" })
map("n", "gu", vim.lsp.buf.references, { desc = "[G]o to [R]eferences" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "[G]o to [I]mplementation" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
map("n", "<leader>cn", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })

local gitsigns = require "gitsigns"

--    Navigation
map("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal { "]c", bang = true }
  else
    gitsigns.nav_hunk "next"
  end
end, { desc = "Jump to next git [c]hange" })

map("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal { "[c", bang = true }
  else
    gitsigns.nav_hunk "prev"
  end
end, { desc = "Jump to previous git [c]hange" })

-- Actions
-- visual mode
map("v", "<leader>hs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "git [s]tage hunk" })
map("v", "<leader>hr", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "git [r]eset hunk" })
-- normal mode
map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })
map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
map("n", "<leader>hu", gitsigns.stage_hunk, { desc = "git [u]ndo stage hunk" })
map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
map("n", "<leader>hb", gitsigns.blame_line, { desc = "git [b]lame line" })
map("n", "<leader>hd", gitsigns.diffthis, { desc = "git [d]iff against index" })
map("n", "<leader>hD", function()
  gitsigns.diffthis "@"
end, { desc = "git [D]iff against last commit" })
-- Toggles
map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
map("n", "<leader>tD", gitsigns.preview_hunk_inline, { desc = "[T]oggle git show [D]eleted" })

-- Git mappings
-- map("n", "<leader>gt", )
map("n", "<leader>gb", builtin.git_branches, { desc = "[G]it [B]ranches" })
map("n", "<leader>gl", builtin.git_bcommits, { desc = "[G]it [L]og" })

-- dap mappings
local dap = require "dap"

map("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle breakpoint" })
map("n", "<leader>dc", dap.continue, { desc = "[D]ebug [C]ontinue" })
map("n", "<leader>dl", dap.run_last, { desc = "[D]ebug Run [L]ast" })
map("n", "<leader>dr", dap.repl.open, { desc = "[D]ebug [R]epl Open" })
map("n", "<F10>", dap.step_over, { desc = "Debug Step Over" })
map("n", "<F11>", dap.step_into, { desc = "Debug Step Into" })
map("n", "<F12>", dap.step_out, { desc = "Debug Step Out" })

-- test mappings
-- local neotest = require "neotest"
-- map("n", "<leader>dT", neotest.run({ strategy = "dap" }, { desc = "[D]ebug nearest [T]est" }))
--
-- can't delete terminal binding
