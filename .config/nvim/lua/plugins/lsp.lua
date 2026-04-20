return {
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'williamboman/mason.nvim', version = '^1.0.0', config = function() require('mason').setup() end },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
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
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          -- Defaults
          enable_close = true,         -- Auto close tags
          enable_rename = true,        -- Auto rename pairs of tags
          enable_close_on_slash = true -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        -- per_filetype = {
        --   ["html"] = {
        --     enable_close = false
        --   }
        -- }
      })
    end
  },
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {
      bind = true,
      -- doc_lines = 4,
      floating_window = false,
      floating_window_above_cur_line = true,
      hint_enable = true,
      fix_pos = false,
      -- floating_window_above_first = true,
      handler_opts = {
        border = "rounded", -- "shadow", --{"╭", "─" ,"╮", "│", "╯", "─", "╰", "│" },
      },
      max_height = 4,
      -- toggle_key = [[<M-x>]],           -- toggle signature on and off in insert mode,  e.g. '<M-x>'
      -- select_signature_key = [[<M-n>]], -- toggle signature on and off in insert mode,  e.g. '<M-x>'
      -- select_signature_key = [[<M-c>]], -- toggle signature on and off in insert mode,  e.g. '<M-x>'
    },
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
  { 'ray-x/go.nvim' },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function(plugin)
        -- Define commands
        local install_cmd = { "npx", "--yes", "yarn", "install" }
        local restore_cmd = { "git", "restore", "package.json", "yarn.lock" } -- Add restore command
        -- Potentially add yarn.lock if it's also modified:
        -- local restore_cmd = { "git", "restore", "package.json", "yarn.lock" }
        local app_dir = plugin.dir .. "/app"
        local plugin_dir = plugin.dir -- Plugin root directory for git restore

        -- Run install command
        if vim.fn.executable("npx") == 1 then
            vim.system(install_cmd, { cwd = app_dir }, function(res)
                if res.code ~= 0 then
                    vim.notify("markdown-preview.nvim: yarn install failed", vim.log.levels.ERROR)
                else
                    -- Run restore command AFTER successful install
                    vim.system(restore_cmd, { cwd = plugin_dir }, function(restore_res)
                        if restore_res.code ~= 0 then
                            vim.notify(
                                "markdown-preview.nvim: git restore failed for package.json",
                                vim.log.levels.WARN
                            )
                        end
                    end)
                end
            end)
        else
            -- Fallback install method
            vim.fn["mkdp#util#install"]()
            -- Also run restore command after fallback install
            vim.system(restore_cmd, { cwd = plugin_dir }, function(restore_res)
                if restore_res.code ~= 0 then
                    vim.notify("markdown-preview.nvim: git restore failed for package.json", vim.log.levels.WARN)
                end
            end)
        end
    end
  }
}
