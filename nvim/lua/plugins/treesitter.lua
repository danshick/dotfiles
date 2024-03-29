return {
	-- highlight, edit, and navigate code
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
		require('nvim-treesitter.configs').setup {
			-- Add languages to be installed here that you want installed for treesitter
			ensure_installed = { 'bash', 'c', 'cpp', 'diff', 'dockerfile', 'git_rebase', 'gitcommit', 'go', 'haskell', 'html', 'java', 'javascript',
				'json', 'kotlin', 'lua', 'make', 'markdown', 'python', 'regex', 'ruby', 'rust', 'sql', 'terraform', 'toml', 'tsx',
				'typescript', 'vim', 'yaml' },
			highlight = { enable = true },
			indent = { enable = true, disable = { 'python' } },
		}
	end
}
