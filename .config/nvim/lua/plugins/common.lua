return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
    opts = {
      rocks = { 'lua-resty-aws', 'lua-cjson' }
    }
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = true,
    opts = {
      contrast = 'hard' }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'make'
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end)
      require('telescope').load_extension('fzf')
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'gruvbox',
        component_separators = '|',
        section_separators = ''
      }
    },
    config = function() require('lualine').setup(opts) end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        -- A list of parser names, or "all"
        ensure_installed = { "vimdoc", "javascript", "typescript", "python", "c", "lua", "rust", "bash",
          "markdown",
          "yaml" },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        highlight = {
          -- `false` will disable the whole extension
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },
  { 'nvim-treesitter/playground' },
  {
    'mbbill/undotree',
    config = function() vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle) end
  },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
    end
  },
  { 'voldikss/vim-floaterm' },
  { 'tpope/vim-dadbod' },
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('octo').setup({
        default_to_projects_v2 = true
      })
    end
  },
  { 'prichrd/netrw.nvim', opts = {} },
  {
    "dgox16/devicon-colorscheme.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require('devicon-colorscheme').setup({
        colors = {
          blue = "#458588",
          cyan = "#689d6a",
          green = "#98971a",
          magenta = "#b16286",
          orange = "#d65d0e",
          purple = "#b16286",
          red = "#cc241d",
          white = "#fbf1c7",
          yellow = "#d79921",
          bright_blue = "#83a598",
          bright_cyan = "#8ec07c",
          bright_green = "#b8bb26",
          bright_magenta = "#d3869b",
          bright_orange = "#fe8019",
          bright_purple = "#d3869b",
          bright_red = "#fb4934",
          bright_yellow = "#fabd2f",
        }
      })
    end
  }
}
