-- lazy packet manager
require("config.lazy")

-- relative number
vim.cmd('set number relativenumber')

-- <leader> key
vim.g.mapleader = ' '

-- cut
vim.cmd('nmap <leader>c "+d')

-- save
vim.cmd('nmap <leader>s :w<cr>')

-- close
vim.cmd('nmap <leader>w :q<cr>')

-- use blackhole register for action
vim.cmd('nmap <leader>f "_')

-- get file name
vim.cmd('nmap <leader>n :let @+ = expand(\'%:t\')<CR>')

-- go to definition
vim.keymap.set('n', '<leader>d', 'gd')

-- paste without overwriting
vim.keymap.set('v', 'p', 'P')

-- clear search highlighting
vim.keymap.set('n', '<Esc>', ':nohlsearch<cr>')

-- skip folds (down, up)
vim.cmd('nmap j gj')
vim.cmd('nmap k gk')

-- search ignoring case
vim.opt.ignorecase = true

-- disable "ignorecase" option if the search pattern contains upper case characters
vim.opt.smartcase = true

-- firenvim extension
vim.g.firenvim_config = {
    globalSettings = { alt = "all" },
    localSettings = {
        [".*"] = {
            cmdline  = "neovim",
            content  = "text",
            priority = 0,
            selector = "textarea",
            takeover = "never"
        }
    }
}

-- keep clean cmd after use
vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
        vim.defer_fn(function()
            vim.cmd("echo ''")
        end, 10)
    end,
})

-- smart yank
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true, expr = true }
  
  -- Map clipboard operations if no register is specified
  for _, mode in ipairs({ 'n', 'v', 'x' }) do
      for _, key in ipairs({ 'y', 'Y', 'p', 'P' }) do
          map(mode, key, string.format([[v:register == '"' ? '"+%s' : '%s']], key, key), opts)
      end
  end
  
  -- Highlight on yank
  vim.api.nvim_create_autocmd("TextYankPost", {
      group = vim.api.nvim_create_augroup("GlobalYankClipboard", { clear = true }),
      pattern = "*",
      callback = function()
          vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
      end,
  })

-- Vim-easy-align
vim.cmd('xmap ga <Plug>(EasyAlign)')

vim.cmd('nmap ga <Plug>(EasyAlign)')
