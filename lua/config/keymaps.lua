-- Telescope keys
local builtin = require('telescope.builtin')
vim.keymap.set(
  'n', '<space>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set(
  'n', '<space>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set(
  'n', '<space>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set(
  'n', '<space>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set(
  'n', '<space>ft', ':TodoTelescope<CR>', { desc = 'Telescope Find TODOs' })

-- Call Neotree
vim.keymap.set(
  'n', '<F10>', ':Neotree<CR>', { desc = "Neotree" })
vim.keymap.set(
  'i', '<F10>', '<esc>:Neotree<CR>', { desc = "Neotree" })

-- Open terminal
vim.keymap.set(
  'n', '<F3>', ':below term<CR>', { desc = "Below terminal" })
vim.keymap.set(
  'i', '<F3>', '<esc>:below term<CR>', { desc = "Below terminal" })
vim.keymap.set(
  't', '<F3>', [[<C-\><C-n>]], { noremap = true })

-- Avoid displaying numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt.relativenumber = false
    vim.cmd("startinsert")
  end,
})

-- Lsp keymaps
vim.keymap.set(
  { 'n', 'v' }, 'K', vim.lsp.buf.hover, { desc = "Lsp hover" })
vim.keymap.set(
  { 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set(
  { 'n', 'v' }, 'gd', vim.lsp.buf.definition, { desc = "definition" })
vim.keymap.set(
  'n', '<space>gf', vim.lsp.buf.format, { desc = "Formatter" })

-- Keymaps separated by FileType
local run = {
  python = function() return "<esc>:term python3 %<CR>" end,
  javascript = function() return "<esc>:term node %<CR>" end,
  rust = function() return "<esc>:term cargo run<CR>" end,
  sh = function() return "<esc>:term chmod +x %; ./%<CR>" end,
  c = function() return "<esc>:term gcc -o %:r %; ./%:r<CR>" end,
  cpp = function() return "<esc>:term g++ --std=c++20 % -Wall -fsanitize=address,undefined; ./a.out<CR>" end,
  php = function() return "<esc>:term php %<CR>" end,
  arduino = function() return "<esc>:term arduino-cli compile -b arduin:avr:uno %<CR>" end,
  java = function() return "<esc>:term javac % -d ./ -cp ./; java -cp ./ %:r<CR>" end,
}
local command = run[vim.bo.filetype] or function()
  return "<esc>:lua print('No run command for this filetype')"
end
vim.keymap.set({'n', 'i'}, "<F5>", command(), {})
