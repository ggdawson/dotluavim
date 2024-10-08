-- GitHub Copilot plugin

return {
  'github/copilot.vim',
  config = function()
    -- Disable the default tab key mapping
    vim.g.copilot_no_tab_map = true

    -- Map Copilot accept to Ctrl-J
    vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
    vim.g.copilot_no_tab_map = true

    -- Additional configurations
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_tab_fallback = ''
    vim.g.copilot_workspace_folders = {
      -- '~/repos',
      '~/repos/dog-nose',
      '~/repos/openmat-be',
      '~/repos/redux-saga-try-catch',
    }

    vim.g.copilot_filetypes = {
      markdown = false,
    }

    -- only runs in single-file mode
    -- @see https://stackoverflow.com/questions/77482352/github-copilot-running-in-single-file-mode
    -- @see https://github.com/github/copilot.vim/blob/release/lua/_copilot.lua#L12
  end,
}
