local M = {}

function M.commands(nav)
  local ucmd = vim.api.nvim_create_user_command
  local acmd = vim.api.nvim_create_autocmd
  -- User commands
  ucmd("ZellijNavigateUp", function()
    nav.up()
  end, {})
  ucmd("ZellijNavigateDown", function()
    nav.down()
  end, {})
  ucmd("ZellijNavigateLeft", function()
    nav.left()
  end, {})
  ucmd("ZellijNavigateRight", function()
    nav.right()
  end, {})

  -- Lock and unlock zellij
  ucmd("ZellijLock", function()
    nav.lock()
  end, {})
  ucmd("ZellijUnlock", function()
    nav.unlock()
  end, {})

  ucmd("ZellijNewPane", function()
    nav.new_pane()
  end, {})
  ucmd("ZellijNewPaneSplit", function()
    nav.new_pane("down")
  end, {})
  ucmd("ZellijNewPaneVSplit", function()
    nav.new_pane("right")
  end, {})
  ucmd("ZellijToggleFloatingPanes", function()
    nav.toggle_floating_panes()
  end, {})
  ucmd("ZellijClosePane", function()
    nav.close_pane()
  end, {})

  ucmd("ZellijNewTab", function()
    nav.new_tab()
  end, {})

  -- Autocommands
  acmd("VimEnter", {
    pattern = "*",
    command = "ZellijLock",
  })

  acmd("VimLeavePre", {
    pattern = "*",
    command = "ZellijUnlock",
  })

  -- Additional commands can be added as needed
end

return M
