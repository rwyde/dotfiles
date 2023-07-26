-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use { "ellisonleao/gruvbox.nvim" }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            -- Snippet Collection (Optional)
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use({
        'ray-x/lsp_signature.nvim',
        opt = true,
        config = function()
            require("lsp_signature").setup({
                bind = true,
                -- doc_lines = 4,
                floating_window = true,
                floating_window_above_cur_line = true,
                hint_enable = true,
                fix_pos = false,
                -- floating_window_above_first = true,
                handler_opts = {
                    border = "rounded", -- "shadow", --{"╭", "─" ,"╮", "│", "╯", "─", "╰", "│" },
                },
                max_height = 4,
                toggle_key = [[<M-x>]],           -- toggle signature on and off in insert mode,  e.g. '<M-x>'
                -- select_signature_key = [[<M-n>]], -- toggle signature on and off in insert mode,  e.g. '<M-x>'
                select_signature_key = [[<M-c>]], -- toggle signature on and off in insert mode,  e.g. '<M-x>'
            })
        end,
    })

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })

    use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })

    use { 'MunifTanjim/eslint.nvim', requires = {
        { 'jose-elias-alvarez/null-ls.nvim' }
    }
    }

    use('MunifTanjim/prettier.nvim')

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use({'voldikss/vim-floaterm'})
end)
