return {
  'nvim-lua/plenary.nvim',
  config = function()
    -- function PrintLspHandlersDetails()
    --   for name, handler in pairs(vim.lsp.handlers) do
    --     print('Handler name: ' .. name)
    --     local info = debug.getinfo(handler)
    --     if info.what == 'Lua' then
    --       local source_lines = {}
    --       for i = info.linedefined, info.lastlinedefined do
    --         table.insert(source_lines, debug.getinfo(handler, 'S').source:sub(i, i))
    --       end
    --       print('Source code:\n' .. table.concat(source_lines, '\n'))
    --     else
    --       print 'No Lua source available for this handler.'
    --     end
    --     print '-----------'
    --   end
    -- end
    --
    -- vim.api.nvim_set_keymap('n', '<leader>lh', ':lua PrintLspHandlersDetails()<CR>', { noremap = true, silent = true })
  end,
}
