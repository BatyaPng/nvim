-- lazy packet manager
require("config.lazy")

-- relative number
vim.cmd('set number relativenumber')

-- <leader> key
vim.g.mapleader = ' '

-- open config
vim.cmd('nmap <leader>c :e ~/.config/nvim/init.lua<cr>')

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

-- sync system clipboard
vim.opt.clipboard = 'unnamedplus'

-- search ignoring case
vim.opt.ignorecase = true

-- disable "ignorecase" option if the search pattern contains upper case characters
vim.opt.smartcase = true

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
