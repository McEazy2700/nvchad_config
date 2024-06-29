require "nvchad.mappings"
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "[b", function()
  require("nvchad.tabufline").prev()
end, { desc = "Previous Buffers" })
map("n", "]b", function()
  require("nvchad.tabufline").next()
end, { desc = "Next Buffers" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
map({ "n", "t" }, "<M-f>", "<cmd>2 ToggleTerm direction=float<cr>", { desc = "Toggle floating term" })
map({ "n", "t" }, "<M-v>", "<cmd>3 ToggleTerm direction=vertical size=100<cr>", { desc = "Toggle vertical term" })
