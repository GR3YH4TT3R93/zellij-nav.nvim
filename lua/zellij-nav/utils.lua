local M = {}

function M.zellij_navigate(short_direction, direction)
  -- Get current window number
  local cur_winnr = vim.fn.winnr()

  -- Attempt to switch window using short_direction
  vim.cmd("wincmd " .. short_direction)

  -- Check if window number changed
  if cur_winnr == vim.fn.winnr() then
    -- If window didn't switch, use zellij action to move focus
    vim.fn.system("zellij action move-focus " .. direction)
  end
end

return M
