return {
  filetypes = { "astro", "css", "graphql", "javascript", "javascriptreact", "json", "jsonc", "svelte", "typescript", "typescript.tsx", "typescriptreact", "vue" },
  on_attach = function(client, bufnr)
    local original_notify = vim.notify
    vim.notify = function(msg, level, opts)
      if msg == 'No code actions available' then
        return                          -- Silently ignore this specific message
      end
      original_notify(msg, level, opts) -- Call the original notify for other messages
    end
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
        vim.lsp.buf.code_action({
          apply = true,
          context = { only = { "source.fixAll.biome" } },
        })
      end,
    })
  end,
}
