local M = {}

function M.mappings()
  -- Check if zellij_navigator_no_default_mappings exists and is equal to 1
  if vim.g.zellij_navigator_no_default_mappings and vim.g.zellij_navigator_no_default_mappings == 1 then
    return
  end

  vim.g.zellij_navigator_no_default_mappings = 0

  -- Key mappings
  vim.api.nvim_set_keymap("n", "<leader>zh", ":ZellijNavigateLeft<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<leader>zj", ":ZellijNavigateDown<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<leader>zk", ":ZellijNavigateUp<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<leader>zl", ":ZellijNavigateRight<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<leader>zn", ":ZellijNewPane<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<leader>zs", ":ZellijNewPaneSplit<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<leader>zv", ":ZellijNewPaneVSplit<CR>", { silent = true })
end

return M
