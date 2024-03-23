vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    "tribela/vim-transparent",
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {'nvim-tree/nvim-web-devicons', lazy = true},
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            local configs = require('lualine')
            configs.setup {
                options = {
                    theme = "catppuccin"
                }
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
          local configs = require("nvim-treesitter.configs")
          configs.setup({
              ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },
            })
        end
    },
    "nvim-treesitter/nvim-treesitter-context",
    {
        "rcarriga/nvim-notify",
        config = function ()
            require("notify").setup({
                background_colour = "#000000",
            })
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
          -- add any options here
        },
        dependencies = {
          -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
          "MunifTanjim/nui.nvim",
          "rcarriga/nvim-notify",
          }
      },
      {
        'akinsho/bufferline.nvim', 
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require("bufferline").setup{
                options = {
                    mode = 'tabs',
                }
            }
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("wk")
        end,
        opts = {
            mode = "n", -- NORMAL mode
            prefix = "<leader>",
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = false, -- use `nowait` when creating keymaps
            expr = false, -- use `expr` when creating keymaps
        }
    },
    {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
    },
    --"wfxr/minimap.vim",
}

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.ruler = true
vim.opt.autoindent = true
vim.opt.cursorline = true

vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true

vim.opt.list = true
vim.opt.listchars = {
	eol = "↲",
	tab = "▸ ",
	trail = "·",
}

vim.keymap.set('n', '<leader>rp', ':w<CR>:vert ter python "%"<CR>', {desc = "run python code"})
vim.keymap.set('n', '<leader>n', ':w<CR>:bNext<CR>', {desc = "next tab"})

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

vim.g.minimap_width = 10
vim.g.minimap_auto_start = 1
vim.g.minimap_auto_start_win_enter = 1

vim.cmd([[
    iabbr <expr> __time strftime("%Y-%m-%d %H:%M:%S")
    iabbr <expr> __date strftime("%Y-%m-%d")

    nmap <c-h> <c-w>h
    nmap <c-j> <c-w>j
    nmap <c-k> <c-w>k
    nmap <c-l> <c-w>l

    ino <Esc> <Esc><Cmd>silent exec "!open -g hammerspoon://changeEnglish"<CR>
]])

require("lazy").setup(plugins)

vim.cmd.colorscheme("catppuccin-latte")
