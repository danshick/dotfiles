return {
	'weilbith/nvim-code-action-menu',
	init = function()
		vim.keymap.set("n", "<leader>ca", "<cmd>CodeActionMenu<cr>",
			{ silent = true, noremap = true, desc = "[c]ode [a]ction menu" }
		)
	end
}
