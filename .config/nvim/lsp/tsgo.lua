return {
  on_attach = function(client, bufnr)
    local original_notify = vim.notify
    vim.notify = function(msg, level, opts)
      if msg:match("tsgo: %-32603") then
        return                          -- Silently ignore this specific message
      end
      original_notify(msg, level, opts) -- Call the original notify for other messages
    end
  end,
}
