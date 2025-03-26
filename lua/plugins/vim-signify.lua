return {
  {
    'mhinz/vim-signify',
    lazy = false, -- Carregar imediatamente
    config = function()
      vim.g.signify_sign_add = "+"
      vim.g.signify_sign_change = "~"
      vim.g.signify_sign_delete = "-"
    end
  }
}
