-- Open file in vscode, for WCA and GPT stuff
vim.api.nvim_create_user_command('OpenInVSCode', function()
  -- Using vim.fn.expand('%') to get the current file path
  local filepath = vim.fn.expand '%:p' -- ':p' expands to full path
  -- The command to open VS Code with the current file
  os.execute('code ' .. filepath)
end, { desc = 'Open the current file in Visual Studio Code' })

vim.diagnostic.config {
  severity_sort = true,
  virtual_text = {
    source = false,
    prefix = '●',
    format = function()
      return ''
    end,
  },
  float = {
    source = 'if_many',
    format = function(diagnostic)
      if diagnostic.source == 'eslint' then
        return string.format('%s [%s]', diagnostic.message, diagnostic.user_data.lsp.code)
      end

      return string.format('%s [%s]', diagnostic.message, diagnostic.source)
    end,
  },
}

local signs = { Error = '✗', Warn = '⚠', Hint = '➤', Info = 'i' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  -- vim.diagnostic.handlers.sign(hl, { text = icon, texthl = hl, numhl = hl })
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

function PrintLspHandlersDetails()
  for name, handler in pairs(vim.lsp.handlers) do
    print('Handler name: ' .. name)
    local info = debug.getinfo(handler)
    for key, value in pairs(info) do
      print(key .. ': ' .. tostring(value))
    end
    if type(handler) == 'function' then
      local source = debug.getinfo(handler).source
      if source:sub(1, 1) == '@' then
        local file = io.open(source:sub(2), 'r')
        if file then
          local lines = file:read '*all'
          file:close()
          print('Source code:\n' .. lines)
        end
      else
        print 'Handler is a built-in or embedded function.'
      end
    else
      print 'Handler is not a Lua function.'
    end
    print '-----------'
  end
end

vim.api.nvim_set_keymap('n', '<leader>lh', ':lua PrintLspHandlersDetails()<CR>', { noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et
