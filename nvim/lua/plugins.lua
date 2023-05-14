

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } }
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
		}
	}
})

