function map(mode, shortcut, command)
	vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

map('i', 'kj', '<esc>')

local builtin = require('telescope.builtin')
vim.g.mapleader = " "

map('n', ',t', ':Telescope find_files results_title="" prompt_title="" previewer=false prompt_prefix=🔍<cr>')
-- map('n', ',g', ':Telescope find_files find_command=rg results_title="" prompt_title="" previewer=false prompt_prefix=🔍<cr>')


local find_files_opt = {
	results_title = '',
	prompt_title = '',
	previewer = false,
}

-- vim.keymap.set('n', ',t', builtin.find_files(find_files_opt), { noremap = true, silent = true })
