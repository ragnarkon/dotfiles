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

-- Nvim-lint
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()

    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint()

    -- You can call `try_lint` with a linter name or a list of names to always
    -- run specific linters, independent of the `linters_by_ft` configuration
    -- require("lint").try_lint("cspell")
  end,
})
