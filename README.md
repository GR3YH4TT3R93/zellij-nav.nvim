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
  config = function()
    require("zellij-nav").setup({
      -- Configuration options go here
    })
  end
}
```

## Requirements 🛠️

- Neovim 0.10.0 or later. (soft req haven't tested on earlier versions)
- Zellij 0.40.1 or later. (soft req haven't tested on earlier versions)

## Usage 🚀

### Commands

#### Navigation Commands

- `:ZellijNavigateUp` - Move up one Vim window or Zellij pane.
- `:ZellijNavigateDown` - Move down one Vim window or Zellij pane.
- `:ZellijNavigateLeft` - Move left one Vim window or Zellij pane.
- `:ZellijNavigateRight` - Move right one Vim window or Zellij pane.

#### Pane Commands

- `:ZellijNewPane` - Open a floating Zellij pane.
- `:ZellijNewPaneSplit` - Open a Zellij pane below.
- `:ZellijNewPaneVSplit` - Open a Zellij pane to the right.

### Default Keybindings ⌨️

These are the default keybindings set by the plugin:

```lua
vim.keymap.set("n", "<Leader>zk", ":ZellijNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<Leader>zj", ":ZellijNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<Leader>zh", ":ZellijNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<Leader>zl", ":ZellijNavigateRight<CR>", { silent = true })
vim.keymap.set("n", "<Leader>zn", ":ZellijNewPane<CR>", { silent = true })
vim.keymap.set("n", "<Leader>zs", ":ZellijNewPaneSplit<CR>", { silent = true })
vim.keymap.set("n", "<Leader>zv", ":ZellijNewPaneVSplit<CR>", { silent = true })
```

### Custom Keybindings ⌨️

You can set up your custom keybindings in your `init.lua` file:

```lua
vim.keymap.set("n", "<C-k>", ":ZellijNavigateUp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":ZellijNavigateDown<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", ":ZellijNavigateLeft<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", ":ZellijNavigateRight<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", ":ZellijNewPane<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", ":ZellijNewPaneSplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-v>", ":ZellijNewPaneVSplit<CR>", { noremap = true, silent = true })
```

## Contributing ♻️

Contributions are welcome! Please open an issue or submit a pull request on GitHub.

## License 📜

This project is licensed under the GPLv3 License. See the [LICENSE](LICENSE) file for details.
