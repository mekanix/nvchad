require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "svelte", "ruff", "pyright", "cmake", "jinja_lsp", "yamlls", "rust_analyzer", "terraformls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
