return { -- lsp configuration and plugins
	'neovim/nvim-lspconfig',
	dependencies = {
		-- automatically install LSPs to stdpath for neovim
		{
			'williamboman/mason.nvim',
			config = true
		},
		{
			'williamboman/mason-lspconfig.nvim',
		},
		-- autocompletion
		{
			'ms-jpq/coq_nvim',
			branch = 'coq'
		},
		{
			'ms-jpq/coq.artifacts',
			branch = 'artifacts'
		},
		-- useful status updates for LSP
		{
			'j-hui/fidget.nvim',
			config = true
		},
		-- lsp for init.lua and neovim plugin dev
		{
			'folke/neodev.nvim',
			config = true
		},
	},
	config = function()
		local language_servers = {
			bashls = {},
			clangd = {},
			denols = {},
			dockerls = {},
			eslint = {},
			gradle_ls = {},
			graphql = {},
			jsonls = {},
			kotlin_language_server = {},
			marksman = {},
			pylsp = {
				pylsp = {
					plugins = {
						pycodestyle = {
							enabled = false
						},
						mccabe = {
							enabled = false
						},
						pyflakes = { enabled = false },
						flake8 = { enabled = true }
					},
					configurationSources = {
						'flake8'
					}
				}
			},
			ruby_ls = {},
			rust_analyzer = {},
			lua_ls = {},
			sqls = {},
			taplo = {},
			terraformls = {},
			tsserver = {},
			yamlls = {},
		}
		
		local mason_lspconfig = require('mason-lspconfig')

		mason_lspconfig.setup {
			ensure_installed = vim.tbl_keys(language_servers),
		}

		local on_attach = function(_, bufnr)
			local opts = function(desc)
				return { buffer = bufnr, remap = false, desc = desc }
			end

			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts("[g]oto [d]efinition"))
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts("hover documentation"))
			---@diagnostic disable-next-line: missing-parameter
			vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts("[g]oto [r]eferences"))
			vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts("[r]e[n]ame"))
			vim.keymap.set('n', "<leader>fm", function() vim.lsp.buf.format() end, opts("[f]or[m]at"))
		end

		mason_lspconfig.setup_handlers {
			function(server_name)
				require('lspconfig')[server_name].setup(require('coq').lsp_ensure_capabilities({
					capabilities = vim.lsp.protocol.make_client_capabilities(),
					on_attach = on_attach,
					settings = language_servers[server_name],
				}))
			end,
		}
	end
}
