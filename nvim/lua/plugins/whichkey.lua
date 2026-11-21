return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>g", group = "git" },
      { "<leader>gh", group = "hunks" },
    },
  },
}
