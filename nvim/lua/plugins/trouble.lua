return {
	"folke/trouble.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons"
	},
	config = true,
	init = function()
		local opts = function(desc)
			return { silent = true, noremap = true, desc = desc }
		end
		vim.keymap.set(
			"n",
			"<leader>xw",
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			opts("[xw] => trouble workspace")
		)
		vim.keymap.set(
			"n",
			"<leader>xx",
			"<cmd>TroubleToggle document_diagnostics<cr>",
			opts("[xx] => trouble document")
		)
		vim.keymap.set(
			"n",
			"<leader>xq",
			"<cmd>TroubleToggle quickfix<cr>",
			opts("[xq] => trouble quickfix")
		)
	end
}
