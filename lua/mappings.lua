require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--

map("n", "<leader>tf", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  print("Autoformat: " .. (vim.g.disable_autoformat and "OFF" or "ON"))
end, { desc = "Toggle Autoformat on Save" })

map("n", "<leader>tt", function()
  if vim.opt.expandtab:get() then
    vim.opt.tabstop = 8
    vim.opt.shiftwidth = 8
    vim.opt.expandtab = false
    print("Tabs: 8 (Hard Tabs)")
  else
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    print("Tabs: 2 (Spaces)")
  end
end, { desc = "Toggle Tabs vs Spaces" })


autocmd("FileType", {
  pattern = { "c", "cpp", ".h" },
  callback = function()
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.expandtab = false
  end,
})
