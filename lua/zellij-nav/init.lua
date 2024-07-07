local M = {}

function M.setup()
  local nav = require("zellij-nav.utils").zellij_navigate
  local sys = vim.fn.system

  function M.up()
    nav("k", "up")
  end

  function M.down()
    nav("j", "down")
  end

  function M.left()
    nav("h", "left")
  end

  function M.right()
    nav("l", "right")
  end

  function M.lock()
    sys("zellij action switch-mode locked")
  end

  function M.unlock()
    sys("zellij action switch-mode normal")
  end

  function M.new_pane(direction)
    direction = direction or ""
    M.zellij_unlock() -- Ensure we are in normal mode
    local l_direction
    if direction ~= "" then
      l_direction = " --direction " .. direction
    else
      l_direction = " --floating"
    end
    sys(
      "zellij action new-pane "
        .. l_direction
        .. ' --close-on-exit --cwd "'
        .. vim.fn.getcwd()
        .. '" -- '
        .. vim.env.SHELL
    )
  end
end
require("zellij-nav.commands").commands(M)
require("zellij-nav.mappings").mappings()

return M
