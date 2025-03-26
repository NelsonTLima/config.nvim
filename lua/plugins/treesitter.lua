return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local config = require('nvim-treesitter.configs')
    config.setup({
      ensure_installed = {
        'arduino', 'bash', 'c', 'c_sharp', 'cmake', 'cpp', 'css',
        'csv', 'dockerfile', 'git_config', 'git_rebase', 'gitattributes',
        'gitcommit', 'gitignore', 'html', 'java', 'javascript', 'json',
        'latex', 'lua', 'nginx', 'passwd', 'php','python', 'r', 'ruby',
        'rust', 'sql', 'ssh_config','typescript', 'vim', 'xml','vue', 'yaml', 
      },
      auto_install = true,
      highlight = {enable = true},
      indent = {enable = true},
      incremental_selection = {enable = true}
    })
  end
}
