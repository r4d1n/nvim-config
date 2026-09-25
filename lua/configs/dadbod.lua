-- vim-dadbod-ui reads these when its plugin file is sourced, so this is
-- required before `vim.pack.add()`.
--
-- Connections live outside the repo: add them with :DBUIAddConnection (saved to
-- ~/.local/share/db_ui/connections.json) or DB_UI_<NAME>=<url> env vars.
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_win_position = "left"
-- snacks.notifier handles vim.notify.
vim.g.db_ui_use_nvim_notify = 1

-- Neovim's sql ftplugin maps <C-c>{t,c,l,...} and <Right>/<Left> in insert mode to
-- completion that needs the (unused) dbext plugin; dadbod-completion replaces it.
vim.g.omni_sql_no_default_maps = 1

vim.keymap.set("n", "<leader>D", "<cmd>DBUIToggle<CR>", { desc = "Toggle DB UI" })
