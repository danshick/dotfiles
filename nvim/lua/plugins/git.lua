return {
	-- git related plugins
	{ 'tpope/vim-fugitive' },
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			current_line_blame = true,
		}
	},
	{
		'sindrets/diffview.nvim',
		dependencies = {
						'nvim-lua/plenary.nvim',
		},
		opts = {
			view = {
				default = {
					layout = 'diff2_vertical'
				},
				merge_tool = {
					layout = 'diff1_plain',
					disable_diagnostics = true
				},
				file_history = {
					layout = 'diff2_vertical'
				}
			}
		}
	}
}
