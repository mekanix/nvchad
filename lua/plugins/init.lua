return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = {
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    },
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
    config = function()
      -- Preuzmi standardne NvChad on_attach funkcije (za gd, gi, itd.)
      local on_attach = require("nvchad.configs.lspconfig").on_attach

      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            -- Aktiviraj standardne NvChad prečice
            on_attach(client, bufnr)

            -- Dodaj Rust specifične prečice
            local map = vim.keymap.set
            map("n", "<leader>ra", "<cmd>RustLsp codeAction<cr>", { buffer = bufnr, desc = "Rust Code Action" })
            map("n", "<leader>rr", "<cmd>RustLsp runnables<cr>", { buffer = bufnr, desc = "Rust Run" })
            map("n", "<leader>rd", "<cmd>RustLsp debuggables<cr>", { buffer = bufnr, desc = "Rust Debug" })
            map("n", "<leader>rm", "<cmd>RustLsp expandMacro<cr>", { buffer = bufnr, desc = "Rust Expand Macro" })

          end,
        },
      }
    end,
  },
}
