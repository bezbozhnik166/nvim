-- Global diagnostics config
local diagnostics_active = true

vim.diagnostic.config({
  virtual_text = diagnostics_active,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Toggle diagnostics with <leader>td
vim.keymap.set('n', '<leader>td', function()
  diagnostics_active = not diagnostics_active
  vim.diagnostic.config({
    virtual_text = diagnostics_active,
    signs = diagnostics_active,
    underline = diagnostics_active,
    update_in_insert = diagnostics_active,
  })
  print("Diagnostics " .. (diagnostics_active and "enabled" or "disabled"))
end, { desc = "Toggle LSP diagnostics" })


-- Show error popup on cursor hover
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})


-- Cmp highlight config (keep as is)
vim.api.nvim_set_hl(0, "CmpItemAbbr", { link = "Pmenu" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { link = "Keyword" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "Keyword" })
vim.api.nvim_set_hl(0, "CmpItemKind", { link = "Type" })
vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "Comment" })
