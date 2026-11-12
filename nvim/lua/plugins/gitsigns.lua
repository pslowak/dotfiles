return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = {
      current_line_blame = true,
      current_line_blame_opts = { delay = 500 },
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        vim.keymap.set("n", "]h", function() gs.nav_hunk("next") end, { buffer = bufnr, desc = "Next hunk" })
        vim.keymap.set("n", "[h", function() gs.nav_hunk("prev") end, { buffer = bufnr, desc = "Prev hunk" })
        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Toggle staged hunk" })
        vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
        vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>hb", gs.blame_line, { buffer = bufnr, desc = "Blame line" })
        vim.keymap.set("n", "<leader>hd", function() gs.diffthis("HEAD") end, { buffer = bufnr, desc = "Diff against last commit" })
      end,
    },
  },
}
