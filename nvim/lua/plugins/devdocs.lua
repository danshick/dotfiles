return {
	"luckasRanarison/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		previewer_cmd = "glow",
		cmd_args = {"-s", "$HOME/.config/glow/gruvbox.json"},
		picker_cmd = "glow",
		picker_cmd_args = {"-w", "80", "-s", "$HOME/.config/glow/gruvbox.json"}
	},
	init = function()
		vim.keymap.set('n', '<leader>do', '<cmd>DevdocsOpenFloat<cr>', { desc = '[d][o]cumentation' })
	end
}
