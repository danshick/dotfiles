return {
	{
		'mfussenegger/nvim-dap',
		init = function()
			local widgets = require('dap.ui.widgets')
			vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, { desc = '[d]ebug [c]ontinue' })
			vim.keymap.set('n', '<leader>dso', function() require('dap').step_over() end, { desc = '[d]ebug [s]tep [o]ver' })
			vim.keymap.set('n', '<leader>dsi', function() require('dap').step_into() end, { desc = '[d]ebug [s]tep [i]nto' })
			vim.keymap.set('n', '<leader>dsu', function() require('dap').step_out() end, { desc = '[d]ebug [s]tep o[u]t' })
			vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = '[d]ebug toggle [b]reakpoint' })
			vim.keymap.set('n', '<leader>dB', function() require('dap').set_breakpoint() end, { desc = '[d]ebug set [B]reakpoint' })
			vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end, { desc = '[d]ebug [r]epl' })
			vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end, { desc = '[d]ebug run [l]ast' })
			vim.keymap.set({'n', 'v'}, '<leader>de', function()
				widgets.hover()
			end, { desc = '[d]ebug [e]valuate' })
			vim.keymap.set('n', '<leader>dvf', function()
				widgets.centered_float(widgets.frames)
			end, { desc = '[d]ebug [v]iew [f]rames' })
			vim.keymap.set('n', '<leader>dvs', function()
				widgets.centered_float(widgets.scopes)
			end, { desc = '[d]ebug [v]iew [s]copes' })
		end
	},
	{
		'mfussenegger/nvim-dap-python',
		cond = function()
			local venv_path = os.getenv("VIRTUAL_ENV")
			return venv_path ~= nil and vim.fn.filereadable(venv_path .. "/bin/python")
		end,
		config = function()
			require('dap-python').setup(os.getenv("VIRTUAL_ENV") .. "/bin/python")
		end
	},
	{
		'leoluz/nvim-dap-go',
		config = function()
			require('dap-go').setup()
		end
	}
}
