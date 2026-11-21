return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = {
      current_line_blame_opts = { delay = 500 },
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
        end

        -- Navigation (falls back to ]c/[c in diff mode)
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev hunk")
        map("n", "]H", function() gs.nav_hunk("last") end, "Last hunk")
        map("n", "[H", function() gs.nav_hunk("first") end, "First hunk")
        map("n", "<leader>ghq", function() gs.setqflist("all") end, "All hunks to quickfix")

        -- Stage / reset (visual mode acts on the selected lines)
        map({ "n", "x" }, "<leader>ghs", ":Gitsigns stage_hunk<cr>", "Toggle staged hunk")
        map({ "n", "x" }, "<leader>ghr", ":Gitsigns reset_hunk<cr>", "Reset hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset buffer")

        -- Inspect
        map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview hunk inline")
        map("n", "<leader>ghw", gs.toggle_word_diff, "Toggle word diff")
        map("n", "<leader>ghd", gs.diffthis, "Diff against index")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff against last commit")

        -- Blame
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame line")
        map("n", "<leader>ghB", gs.blame, "Blame buffer")
        map("n", "<leader>ght", gs.toggle_current_line_blame, "Toggle line blame")

        -- Text object
        map({ "o", "x" }, "ih", ":<C-u>Gitsigns select_hunk<cr>", "Hunk")
      end,
    },
  },
}
