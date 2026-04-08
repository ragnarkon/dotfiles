vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('trim_whitespaces', { clear = true }),
  desc = 'Trim trailing white spaces',
  pattern = 'bash,c,cpp,lua,java,go,php,javascript,make,python,rust,perl,sql,markdown',
  callback = function()
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '<buffer>',
      callback = function()
        local cursorpos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, cursorpos)
      end,
    })
  end,
})

-- Telescope fzf native
-- FIXME: This doesn't seem to work for whatever reason
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
      vim.system(
        { 'make' },
        { cwd = ev.data.path }
      ):wait()
    end
  end,
})
