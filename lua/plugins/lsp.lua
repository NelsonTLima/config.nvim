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
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({capabilities = capabilities})
      lspconfig.pyright.setup({capabilities = capabilities})
      lspconfig.pylsp.setup({capabilities = capabilities})
      lspconfig.rust_analyzer.setup({capabilities = capabilities})
      lspconfig.ansiblels.setup({capabilities = capabilities})
      lspconfig.ts_ls.setup({capabilities = capabilities})
      lspconfig.eslint.setup({capabilities = capabilities})
      lspconfig.volar.setup({ capabilities = capabilities})
      lspconfig.dockerls.setup({ capabilities = capabilities})
      lspconfig.dartls.setup({ capabilities = capabilities})

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = function()
          if not next(vim.lsp.get_active_clients()) then
            vim.cmd("LspStart")
          end
        end
      })
    end
  },
  {
    vim.diagnostic.config({
      virtual_text = false,
      signs = false, -- It conflicts with signify
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
