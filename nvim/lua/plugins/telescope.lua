return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = vim.fn.executable 'make' == 1
		}
	},
	config = function()
		require('telescope').setup {
			pickers = {
				find_files = {
					hidden = true
				}
			},
			defaults = {
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
					},
				},
			},
		}
		-- enable telescope fzf native, if installed
		pcall(require('telescope').load_extension, 'fzf')
	end,
	init = function()
		-- telescope keybindings
		vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[s]earch existing [b]uffers' })
		vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[s]earch files with [g]rep' })
		vim.keymap.set('n', '<leader>sc', function()
			require('telescope.builtin').current_buffer_fuzzy_find(require('telescope').themes.get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = '[s]earch in [c]urrent buffer' })
		vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[s]earch [f]iles' })
		vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[s]earch [d]iagnostics' })
	end
}
