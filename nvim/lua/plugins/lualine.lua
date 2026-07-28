return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "nord",
      icons_enabled = true,
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { { "filename", file_icon = true } },
      lualine_x = { "diagnostics", "searchcount", "selectioncount", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}

