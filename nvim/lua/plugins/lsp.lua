return {
	{ -- lsp configuration and plugins
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
				branch = 'coq',
				init = function()
					vim.g.coq_settings = {
						auto_start = 'shut-up',
						limits = {
							completion_auto_timeout = 0.8,
							completion_manual_timeout = 2,
						}
					}
				end
			},
			{
				'ms-jpq/coq.artifacts',
				branch = 'artifacts'
			},
			-- useful status updates for LSP
			{
				'j-hui/fidget.nvim',
				tag = "v1.2.0",
				config = true
			},
			-- json/yaml schema validation
			{
				'b0o/schemastore.nvim'
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
				gopls = {},
				gradle_ls = {},
				graphql = {},
				jsonls = {
					schemas = require('schemastore').json.schemas(),
					validate = { enable = true },
				},
				kotlin_language_server = {},
				marksman = {},
				pylsp = {
					pylsp = {
						plugins = {
							autopep8 = {
								enabled = false,
							},
							black = {
								enabled = true,
							},
							jedi_completion = {
								include_class_objects = true,
								include_function_objects = true,
								fuzzy = true,
							},
							pycodestyle = {
								enabled = false
							},
							mccabe = {
								enabled = false
							},
							pyflakes = { enabled = false },
							flake8 = { enabled = true },
							rope_autoimport = {
								enabled = true
							},
							ruff = {
								enabled = true,
								extendSelect = { "I" },
							},
							yapf = {
								enabled = false,
							}
						},
						configurationSources = {
							'flake8'
						}
					}
				},
				rust_analyzer = {},
				lua_ls = {},
				taplo = {},
				terraformls = {},
				tsserver = {},
				yamlls = {
					schemaStore = {
						-- You must disable built-in schemaStore support if you want to use
						-- this plugin and its advanced options like `ignore`.
						enable = false,
						-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
						url = "",
					},
					schemas = require('schemastore').yaml.schemas(),
				},
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
				vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts("[g]oto [t]ype definition"))
				vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts("[g]oto [r]eferences"))
				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts("hover documentation"))
				vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end, opts("signature documentation"))
				vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts("[r]e[n]ame"))
				vim.keymap.set('n', "<leader>fm", function() vim.lsp.buf.format() end, opts("[f]or[m]at"))
				vim.keymap.set('n', "<leader>rl", function()
					vim.cmd(':LspRestart')
					vim.diagnostic.reset()
					vim.cmd(':e')
				end, opts("[r]estart [l]sp"))
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
	},
	{ -- null-ls for formatters/linters
		{
			"jay-babu/mason-null-ls.nvim",
			dependencies = {
				"mason.nvim",
				{
					"nvimtools/none-ls.nvim",
					dependencies = {
						"nvim-lua/plenary.nvim",
					},
					opts = function()
						local null_ls = require("null-ls")
						return {
							sources = {
								-- gha linting
								null_ls.builtins.diagnostics.actionlint,
								-- go linting
								null_ls.builtins.diagnostics.golangci_lint,
								null_ls.builtins.formatting.gofmt,
								null_ls.builtins.formatting.golines,
								null_ls.builtins.formatting.goimports,
								-- hadolint
								null_ls.builtins.diagnostics.hadolint,
								-- prettier
								null_ls.builtins.formatting.prettierd,
								-- shellcheck
								null_ls.builtins.diagnostics.shellcheck,
								null_ls.builtins.code_actions.shellcheck,
								-- spellcheck
								null_ls.builtins.diagnostics.cspell,
								null_ls.builtins.code_actions.cspell,
								-- terraform
								null_ls.builtins.formatting.terraform_fmt.with({
									command = "tofu",
								}),
							},
						}
					end,
				},
			},
			config = function()
				require('mason-null-ls').setup {
					ensure_installed = {},
					automatic_installation = true,
					automatic_setup = false,
				}
			end,
		}
	}
}
