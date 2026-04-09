-- Nvim-treesitter
-- TODO: Add the autocmd for treesitter, assuming it's not going un-archived

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
