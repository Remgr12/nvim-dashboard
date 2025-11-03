# Neovim Dashboard

## Overview

This repository contains a Neovim dashboard configuration intended for
snacks.nvim. The dashboard provides the familiar LazyVim-style quick actions
(recent files, find files, new file, etc.) and adds a right-side projects pane
plus a GitHub notifications & status tab.

## Key features

- Basic LazyVim dashboard items (recent files, new file, find file, etc.).
- Right-side folder / projects panel that lists your project directories for
  quick switching.
- GitHub notifications and status tab integrated into the dashboard UI.
  - Requires GitHub CLI + gh-notify extension (see setup below).

## Prerequisites

- Neovim (your local setup that already uses LazyVim or a similar plugin
  manager).
- GitHub CLI (gh) installed and authenticated.
  - Install from <https://cli.github.com/> if you don't have it.
- gh-notify extension for GitHub CLI:
  - gh extension install meiji163/gh-notify

## Installation

You need to copy the snacks.lua file from this directory to
~/.config/nvim/lua/plugins/

## GitHub notifications setup

1. Ensure GitHub CLI is installed: gh --version

2. Install the gh-notify extension: gh extension install meiji163/gh-notify

3. Authenticate gh if not already: gh auth status || gh auth login

   Follow the interactive prompts from `gh auth login` to complete
   authentication.

4. After installation & auth, restart Neovim. The dashboard's GitHub
   notification tab should show notifications and status (depends on the
   extension being available and authenticated).

## Troubleshooting

- If the GitHub tab shows nothing:
  - Verify `gh auth status` returns authenticated.
  - Ensure the extension is installed: `gh extension list`.
  - Try running the extension manually: `gh notify` (see extension docs).
- Dashboard not loading:
  - Confirm the file(s) are being required by your Neovim config or plugin
    manager.
  - Check for errors on Neovim startup (`:messages`) and resolve any Lua errors.
