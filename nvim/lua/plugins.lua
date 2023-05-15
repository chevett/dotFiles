

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } },
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
	}

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

end)

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
			prompt_prefix=🔍,
		}
	}
})

