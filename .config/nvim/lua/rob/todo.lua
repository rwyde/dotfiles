local M = {}

local todo_file_path = "/home/rob/doc/todo.md"
local todo_buf = vim.fn.bufadd(todo_file_path)

function M.toggle_todo()
    local currentLine = vim.api.nvim_get_current_line()
    local r = unpack(vim.api.nvim_win_get_cursor(0))
    if (string.find(currentLine, '- %[ %]') ~= nil)
    then
        vim.api.nvim_buf_set_lines(0, r - 1, r, false, { (string.gsub(currentLine, '- %[ %]', '- [x]', 1)) })
    else
        vim.api.nvim_buf_set_lines(0, r - 1, r, false, { (string.gsub(currentLine, '- %[x%]', '- [ ]', 1)) })
    end
end

function M.new_todo()
    vim.ui.input({ prompt = 'New todo: ' },
        function(input)
            vim.api.nvim_buf_set_lines(todo_buf, -1, -1, false, {string.format('- [ ] %s', input)})
        end)
end

vim.keymap.set('n', '<leader>td', M.toggle_todo)
vim.keymap.set('n', '<leader>tf', function() vim.api.nvim_command(string.format(':e %s', todo_file_path)) end)
vim.keymap.set('n', '<leader>ts', function() vim.api.nvim_command(string.format(':sp %s', todo_file_path)) end)
vim.keymap.set('n', '<leader>tn', M.new_todo)

return M
