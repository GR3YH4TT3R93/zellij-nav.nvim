local M = {}

function M.commands()
  -- User commands
  vim.api.nvim_create_user_command("ZellijNavigateUp", function()
    require("zellij-nav").zellij_nav_up()
  end, {})
  vim.api.nvim_create_user_command("ZellijNavigateDown", function()
    require("zellij-nav").zellij_nav_down()
  end, {})
  vim.api.nvim_create_user_command("ZellijNavigateLeft", function()
    require("zellij-nav").zellij_nav_left()
  end, {})
  vim.api.nvim_create_user_command("ZellijNavigateRight", function()
    require("zellij-nav").zellij_nav_right()
  end, {})

  -- Lock and unlock zellij
  vim.api.nvim_create_user_command("ZellijLock", function()
    require("zellij-nav").zellij_lock()
  end, { force = true })

  vim.api.nvim_create_user_command("ZellijUnlock", function()
    require("zellij-nav").zellij_unlock()
  end, { force = true })

  vim.api.nvim_create_user_command("ZellijNewPane", function()
    require("zellij-nav").zellij_new_pane()
  end, {})
  vim.api.nvim_create_user_command("ZellijNewPaneSplit", function()
    require("zellij-nav").zellij_new_pane("down")
  end, {})
  vim.api.nvim_create_user_command("ZellijNewPaneVSplit", function()
    require("zellij-nav").zellij_new_pane("right")
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
