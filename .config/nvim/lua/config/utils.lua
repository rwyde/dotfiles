vim.api.nvim_create_user_command('FixVerses', function()
  -- make the section names into second level headers
  vim.cmd([[%s/^\([a-zA-Z<][^0-9]*\(\<\w\+\>\s\{-}\)\{,8\}\)$/\r## \1/]])
  -- wrap verse numbers with sup tag
  vim.cmd([[%s/\d\+/<sup>&<\/sup>/g]])
  -- Replace non-standard single quotes with straight single quotes
  vim.cmd([[%s/[‘’]/'/g]])
  -- Replace non-standard double quotes with straight double quotes
  vim.cmd([[%s/[“”]/"/g]])
  -- Wrap lines starting with <, any letter, or quotation mark in asterisks
  vim.cmd([[%s/^[<a-zA-Z"'].*/\*&\*/g]])
end, { desc = "Fix formatting issues in verses" })

local function safe_cmd(cmd)
    -- Executes a command safely, suppressing errors if the pattern isn't found
    local success, err = pcall(vim.cmd, cmd)
    if not success then
        vim.notify("Command failed: " .. err, vim.log.levels.WARN)
    end
end

vim.api.nvim_create_user_command('FixVersesSafe', function()
    -- Make the section names into second-level headers
    safe_cmd([[%s/^\([a-zA-Z<][^0-9]*\(\<\w\+\>\s\{-}\)\{,8\}\)$/\r## \1/]])

    -- Wrap verse numbers with <sup> tags
    safe_cmd([[%s/\d\+/<sup>&<\/sup>/g]])

    -- Replace non-standard single quotes with straight single quotes
    safe_cmd([[%s/[‘’]/'/g]])

    -- Replace non-standard double quotes with straight double quotes
    safe_cmd([[%s/[“”]/"/g]])

    -- Wrap lines starting with <, any letter, or quotation mark in asterisks
    safe_cmd([[%s/^[<a-zA-Z"'].*/\*&\*/g]])
end, { desc = "Fix formatting issues in verses" })
