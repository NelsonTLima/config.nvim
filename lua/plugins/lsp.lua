return {
  {
    "williamboman/mason.nvim",
    opts = {ensure_installed = {"ansible-lint"} },
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",  -- lua
          "pyright", "pylsp", -- Python
          "rust_analyzer", -- Rust
          "ansiblels", -- ansiblels
          "ts_ls", "eslint", -- TypeScript Javascript
          "dockerls",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      vim.lsp.config("*", {capabilities = capabilities})
    end
  },
  {
    vim.diagnostic.config({
      virtual_text = true,
      signs = true, -- Conflicts with signify
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        show_header = true,
        source = "if_many",
        border = "rounded",
      },
    });
    vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
  },
}
