


require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-fugitive'
	use 'github/copilot.vim'
	use 'sindrets/diffview.nvim'
	use 'dense-analysis/ale' -- eslint

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = {
			{ 'nvim-lua/plenary.nvim' }
		},
		config = function()
			require("telescope").setup({
				defaults = {
					previewer = false,
					file_ignore_patterns = {
						"dist",
						"node_modules",
					},
					disable_devicons = true,
				},
				pickers = {
					previewer = false,
					git_files = {
						theme = "dropdown",
						previewer = false,
					},
					find_files = {
						previewer = false,
						prompt_prefix=🔍,
					}
				}
			})
		end,
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup({
			})
		end,
	}

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- themes
	use 'folke/tokyonight.nvim'
	use {
		'projekt0n/github-nvim-theme',
		config = function()
			require('github-theme').setup({
			})

			-- vim.cmd('colorscheme github_dark_default')
			vim.cmd('colorscheme tokyonight')
		end
	}

end)


