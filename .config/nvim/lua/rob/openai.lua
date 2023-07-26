local openai = require("openai")

openai.api_key = "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"

local function generate_text()
  local text = vim.api.nvim_get_current_buf()
  local prompt = [[
    generate text
  ]]
  local params = {
    prompt = prompt,
    temperature = 0.7,
    engine = "text-davinci-002",
    max_tokens = 1028
  }
  local result = openai.completions(params)
  local response = result.choices[1].text
  vim.api.nvim_command("new")
  vim.api.nvim_insert(response, "append")
end

vim.api.nvim_command("command! -nargs=0 Generate lua require('your_module_name').generate_text()")
