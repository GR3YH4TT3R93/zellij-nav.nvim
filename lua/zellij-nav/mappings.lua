local M = {}

function M.mappings()
  local map = vim.api.nvim_set_keymap
  -- Check if zellij_navigator_no_default_mappings exists and is equal to 1
  if vim.g.zellij_nav_default_mappings == false then
    return
  else
    -- 'Alt Key' Shortcut Pane Keymaps
    map("n", "<A-h>", "<cmd>ZellijNavigateLeft<CR>", { silent = true })
    map("n", "<A-j>", "<cmd>ZellijNavigateDown<CR>", { silent = true })
    map("n", "<A-k>", "<cmd>ZellijNavigateUp<CR>", { silent = true })
    map("n", "<A-l>", "<cmd>ZellijNavigateRight<CR>", { silent = true })
    map("n", "<A-n>", "<cmd>ZellijNewPane<CR>", { silent = true })
    map("n", "<A-s>", "<cmd>ZellijNewPaneSplit<CR>", { silent = true })
    map("n", "<A-v>", "<cmd>ZellijNewPaneVSplit<CR>", { silent = true })
    map("n", "<A-f>", "<cmd>ZellijToggleFloatingPanes<CR>", { silent = true })
    map("n", "<A-x>", "<cmd>ZellijClosePane<CR>", { silent = true })
    map("n", "<A-t>", "<cmd>ZellijNewTab<CR>", { silent = true })
  end
end

return M
