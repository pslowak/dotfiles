return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "bash",
      "css",
      "diff",
      "dockerfile",
      "gitignore",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "python",
      "regex",
      "toml",
      "typescript",
      "yaml",
    })
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
