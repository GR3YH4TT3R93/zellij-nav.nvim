# zellij-nav.nvim 🖥️

A Lua rewrite of the [`zellij.vim`](https://github.com/fresh2dev/zellij.vim) plugin, enabling seamless integration between Neovim and the Zellij terminal multiplexer.

## Features ✨

- 📂 Open new Zellij panes and tabs from within Neovim.
- 🔄 Navigate between Neovim and Zellij seamlessly.

## Installation 📦

Use the [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager to install `zellij-nav.nvim`.

```lua
{
  "GR3YH4TT3R93/zellij-nav.nvim",
  cond = os.getenv("ZELLIJ") == "0", -- Only load plugin if in active Zellij instance
  event = "VeryLazy", -- Lazy load plugin for improved startup times
  init = function() -- Only needed if you want to override default keymaps otherwise just call opts = {}
    vim.g.zellij_nav_default_mappings = false -- Default: true
  end,
  opts = {}, -- Optional
  keys = {}, -- define your own keymaps e.g keys = { { "<C-h>", "<cmd>ZellijNavigateUp<CR>", { silent = true, desc = "Move to Zellij pane up" } } }
}
```

## Requirements 🛠️

- Neovim 0.10.0 or later. (soft req haven't tested on earlier versions)
- Zellij 0.40.1 or later. (soft req haven't tested on earlier versions)
- [zellij-autolock](https://github.com/fresh2dev/zellij-autolock) (HARD REQ needed to automatically lock Zellij when in neovim)

## Usage 🚀

### Commands

#### Navigation Commands

- `:ZellijNavigateUp` - Move up one Vim window or Zellij pane.
- `:ZellijNavigateDown` - Move down one Vim window or Zellij pane.
- `:ZellijNavigateLeft` - Move left one Vim window or Zellij pane.
- `:ZellijNavigateRight` - Move right one Vim window or Zellij pane.

#### Pane Commands

- `:ZellijNewPane` - Open a floating Zellij pane.
- `:ZellijClosePane` - Close current Zellij pane.
- `:ZellijNewPaneSplit` - Open a Zellij pane below.
- `:ZellijNewPaneVSplit` - Open a Zellij pane to the right.
- `:ZellijToggleFloatingPanes` - Show/hide floating panes; if none are open, one will be opened

#### Tab Commands

- `:ZellijNewTab` - Open a new Zellij tab.

### Default Keybindings ⌨️

These are the default keybindings set by the plugin:

```lua
vim.api.nvim_set_keymap("n", "<A-h>", "<cmd>ZellijNavigateLeft<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-j>", "<cmd>ZellijNavigateDown<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", "<cmd>ZellijNavigateUp<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-l>", "<cmd>ZellijNavigateRight<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-n>", "<cmd>ZellijNewPane<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-s>", "<cmd>ZellijNewPaneSplit<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-v>", "<cmd>ZellijNewPaneVSplit<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-f>", "<cmd>ZellijToggleFloatingPanes<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-x>", "<cmd>ZellijClosePane<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-t>", "<cmd>ZellijNewTab<CR>", { silent = true })
```
NOTE: to disable default keymaps put `vim.g.zellij_nav_default_mappings = false` somewhere in your config


### Recommended Zellij Config ⌨️

You can set up Zellij-autolock and keymaps via `~/.config/zellij/config.kdl` as
follows:

```kdl

plugins {
    // Define the "autolock" plugin.
    // if experiencing error, download from releasse page and change "https://..." to "file:~/path/to/zellij-autolock.wasm"
    autolock location="https://github.com/fresh2dev/zellij-autolock/releases/latest/download/zellij-autolock.wasm" {
        triggers "nvim|vim"  // Lock when any open these programs open. They are expected to unlock themselves when closed (e.g., using zellij.vim plugin).
        watch_triggers "fzf|zoxide|atuin"  // Lock when any of these open and monitor until closed.
        watch_interval "1.0"  // When monitoring, check every X seconds.
    }
    //...
}
keybinds {
    // Normal mode bindings to activate zellij-autolock by intercepting `Enter`,then passing it through to the terminal.
    normal {
        bind "Enter" {
            WriteChars "\u{000D}";
            MessagePlugin "autolock" {};
        }
        //...
    }
    shared_except "locked" {
        bind "Ctrl g" { SwitchToMode "Locked"; }
        bind "Ctrl q" { Detach; }
        bind "Alt q" { Quit; }
        bind "Alt n" { NewPane; }
        bind "Alt h" "Alt Left" { MoveFocusOrTab "Left"; }
        bind "Alt l" "Alt Right" { MoveFocusOrTab "Right"; }
        bind "Alt j" "Alt Down" { MoveFocus "Down"; }
        bind "Alt k" "Alt Up" { MoveFocus "Up"; }
        bind "Alt =" "Alt +" { Resize "Increase"; }
        bind "Alt -" { Resize "Decrease"; }
        bind "Alt [" { PreviousSwapLayout; }
        bind "Alt ]" { NextSwapLayout; }
    }
}
```

## Contributing ♻️

Contributions are welcome! Please open an issue or submit a pull request on GitHub.

## License 📜

This project is licensed under the GPLv3 License. See the [LICENSE](LICENSE) file for details.
