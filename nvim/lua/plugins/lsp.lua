return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "gopls",   -- Go
        "lua_ls",  -- Lua
        "pyright", -- Python
        "vtsls",   -- TypeScript / JavaScript
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config["lua_ls"] = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      }
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufopts = { buffer = args.buf }
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", bufopts, { desc = desc }))
          end
          map("n", "K", vim.lsp.buf.hover, "Hover")
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
          map("n", "gr", vim.lsp.buf.references, "References")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map({ "n", "x" }, "<leader>rn", vim.lsp.buf.rename, "Rename")
          map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Prev diagnostic")
          map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
          map("n", "gl", vim.diagnostic.open_float, "Line diagnostic")
        end,
      })
    end,
  },
}

