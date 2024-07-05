local M = {}

function M.setup()
  local nav = require("zellij-nav.utils").zellij_navigate
  function M.zellij_nav_up()
    nav("k", "up")
  end

  function M.zellij_nav_down()
    nav("j", "down")
  end

  function M.zellij_nav_left()
    nav("h", "left")
  end

  function M.zellij_nav_right()
    nav("l", "right")
  end

  function M.zellij_lock()
    vim.fn.system("zellij action switch-mode locked")
  end

  function M.zellij_unlock()
    vim.fn.system("zellij action switch-mode normal")
  end

  function M.zellij_new_pane(direction)
    direction = direction or ""
    M.zellij_unlock() -- Ensure we are in normal mode
    local l_direction
    if direction ~= "" then
      l_direction = " --direction " .. direction
    else
      l_direction = " --floating"
    end
    vim.fn.system(
      "zellij action new-pane "
        .. l_direction
        .. ' --close-on-exit --cwd "'
        .. vim.fn.getcwd()
        .. '" -- '
        .. vim.env.SHELL
    )
  end
end
require("zellij-nav.commands").commands()
require("zellij-nav.mappings").mappings()

return M
