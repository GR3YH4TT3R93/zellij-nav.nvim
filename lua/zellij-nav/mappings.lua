local M = {}

function M.mappings()
  local map = vim.api.nvim_set_keymap
  -- Check if zellij_navigator_no_default_mappings exists and is equal to 1
  if vim.g.zellij_nav_default_mappings == false then
    return
  else
    -- Keymaps
    map("n", "<A-h>", "<cmd>ZellijUnlock<CR><cmd>ZellijNavigateLeft<CR>", { silent = true })
    map("n", "<A-j>", "<cmd>ZellijUnlock<CR><cmd>ZellijNavigateDown<CR>", { silent = true })
    map("n", "<A-k>", "<cmd>ZellijUnlock<CR><cmd>ZellijNavigateUp<CR>", { silent = true })
    map("n", "<A-l>", "<cmd>ZellijUnlock<CR><cmd>ZellijNavigateRight<CR>", { silent = true })
    map("n", "<A-n>", "<cmd>ZellijUnlock<CR><cmd>ZellijNewPane<CR>", { silent = true })
    map("n", "<A-s>", "<cmd>ZellijUnlock<CR><cmd>ZellijNewPaneSplit<CR>", { silent = true })
    map("n", "<A-v>", "<cmd>ZellijUnlock<CR><cmd>ZellijNewPaneVSplit<CR>", { silent = true })
    map("n", "<A-x>", "<cmd>ZellijUnlock<CR><cmd>ZellijClosePane<CR>", { silent = true })
    map("n", "<A-t>", "<cmd>ZellijUnlock<CR><cmd>ZellijNewTab<CR>", { silent = true })
  end
end

return M
