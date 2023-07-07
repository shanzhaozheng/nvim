return {

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local presets = require("which-key.plugins.presets")
			presets.operators["v"] = nil
			require("which-key").setup {
			}
		end,
	},

	{
		"ethanholz/nvim-lastplace",
		config = function()
			require 'nvim-lastplace'.setup {}
			vim.g.lastplace_ignore_buftype = "quickfix,nofile,help"
			vim.g.lastplace_ignore_filetype = "gitcommit,gitrebase,svn,hgcommit"
			vim.g.lastplace_open_folds = 1
		end
	},


	{
		"shellRaining/hlchunk.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require('hlchunk').setup {
				chunk = {
					enable = true,
					use_treesitter = true,
					exclude_filetypes = {
						aerial = true,
						dashboard = true,
					},
					chars = {
						horizontal_line = "─",
						vertical_line = "│",
						left_top = "╭",
						left_bottom = "╰",
						right_arrow = ">",
					},
					style = {
						{ fg = "#806d9c" },
					},
				},

				indent = {
					enable = true,
					use_treesitter = false,
					chars = {
						"│",
					},
					style = {
						{ fg = "#404040" }
					},
				},

				line_num = {
					enable = false,
					use_treesitter = false,
					style = "#806d9c",
				},

				blank = {
					enable = false,
					chars = {
						"․",
					},
					style = {
						vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
					},
				},
			}
		end
	},

	{
		"petertriho/nvim-scrollbar",
		dependencies = {
			'kevinhwang91/nvim-hlslens',
		},
		config = function()
			require("scrollbar.handlers.search").setup()
			require("scrollbar").setup({
				show = true,
				handle = {
					text = " ",
					color = "#928374",
					hide_if_all_visible = true,
				},
				marks = {
					Search = { color = "yellow" },
					Misc = { color = "purple" },
				},
				handlers = {
					cursor = false,
					diagnostic = true,
					gitsigns = true,
					handle = true,
					search = true,
				},
			})
		end,
	},

	{
		"yianwillis/vimcdoc",
		lazy = true,
		ft = "vim"
	},

	{
		"airblade/vim-rooter",
		config = function()
			vim.g.rooter_patterns = { '.git', 'Makefile', '*.sln', 'pom.xml', 'build.gradle', 'Cargo.toml', 'go.mod' }
			vim.g.rooter_cd_cmd = 'lcd'
		end
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
			},
		}
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end
	},


	{
		"voldikss/vim-translator",
		config = function()
			vim.keymap.set('', 'tt', ':TranslateW<CR>', { noremap = true, silent = true })
			vim.g.translator_target_lang = "zh"
		end
	}
}
