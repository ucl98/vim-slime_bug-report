local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup({
	{
		"jpalardy/vim-slime",
		lazy = false,
		config = function()
			vim.g.slime_target = "tmux"
			vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
			vim.g.slime_dont_ask_default = 1
			vim.api.nvim_set_keymap("n", "<C-v><C-v>", "<Plug>SlimeLineSend", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "<C-c><C-c>", "<Plug>SlimeParagraphSend", { noremap = false, silent = true })
		end,
	},
})

-- keybindings
local map_keys = vim.keymap.set

map_keys(
	"n",
	"<leader>ip",
	[[<cmd>silent !tmux split-window -h 'python3' && tmux select-pane -L<CR>]],
	{ noremap = true, silent = true }
)
