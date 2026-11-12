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
          local map = function(mode, lhs, rhs, desc, opts)
            vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", bufopts, { desc = desc }, opts or {}))
          end
          map("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, "Hover")
          map("n", "gK", function() vim.lsp.buf.signature_help({ border = "rounded" }) end, "Signature help")
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          map("n", "gI", vim.lsp.buf.implementation, "Go to implementation")
          map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
          map("n", "gr", vim.lsp.buf.references, "References", { nowait = true })
          map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map({ "n", "x" }, "<leader>cr", vim.lsp.buf.rename, "Rename")
          map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Prev diagnostic")
          map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
          map("n", "[e", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, "Prev error")
          map("n", "]e", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end, "Next error")
          map("n", "[w", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN }) end, "Prev warning")
          map("n", "]w", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN }) end, "Next warning")
          map("n", "<leader>cd", vim.diagnostic.open_float, "Line diagnostic")
        end,
      })
    end,
  },
}

