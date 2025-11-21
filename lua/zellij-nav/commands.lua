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

  -- Zellij Pane Commands
  ucmd("ZellijNewPane", function(opts)
    nav.new_pane(opts)
  end, { nargs = "*" })
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
  ucmd("ZellijTogglePaneFullscreen", function()
    nav.toggle_pane_fullscreen()
  end, {})
  ucmd("ZellijRenamePane", function(opts)
    nav.rename_pane(opts)
  end, { nargs = "?" })
  ucmd("ZellijResizePane", function(opts)
    nav.resize_pane(opts)
  end, { nargs = "?" })
  ucmd("ZellijMovePane", function(opts)
    nav.move_pane(opts)
  end, { nargs = 1 })

  -- Zellij Tab Commands
  ucmd("ZellijNewTab", function()
    nav.new_tab()
  end, {})
  ucmd("ZellijCloseTab", function()
    nav.close_tab()
  end, {})
  ucmd("ZellijRenameTab", function(opts)
    nav.rename_tab(opts)
  end, { nargs = "?" })
  ucmd("ZellijMoveTab", function(opts)
    nav.move_tab(opts)
  end, { nargs = 1 })

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
