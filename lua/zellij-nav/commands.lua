local M = {}

function M.commands(nav)
  -- User commands
  vim.api.nvim_create_user_command("ZellijNavigateUp", function()
    nav.up()
  end, {})
  vim.api.nvim_create_user_command("ZellijNavigateDown", function()
    nav.down()
  end, {})
  vim.api.nvim_create_user_command("ZellijNavigateLeft", function()
    nav.left()
  end, {})
  vim.api.nvim_create_user_command("ZellijNavigateRight", function()
    nav.right()
  end, {})

  -- Lock and unlock zellij
  vim.api.nvim_create_user_command("ZellijLock", function()
    nav.lock()
  end, {})

  vim.api.nvim_create_user_command("ZellijUnlock", function()
    nav.unlock()
  end, {})

  vim.api.nvim_create_user_command("ZellijNewPane", function()
    nav.new_pane()
  end, {})
  vim.api.nvim_create_user_command("ZellijNewPaneSplit", function()
    nav.new_pane("down")
  end, {})
  vim.api.nvim_create_user_command("ZellijNewPaneVSplit", function()
    nav.new_pane("right")
  end, {})

  -- Autocommands
  vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    command = "ZellijLock",
  })

  vim.api.nvim_create_autocmd("VimLeavePre", {
    pattern = "*",
    command = "ZellijUnlock",
  })

  -- Additional commands can be added as needed
end

return M
