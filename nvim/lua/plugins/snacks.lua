return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
  },
  keys = {
    { "<leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit" },
  },
}
