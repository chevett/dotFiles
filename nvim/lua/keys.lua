-- function map(mode, shortcut, command)
-- 	vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
-- end

local function map(mode, l, r, opts)
	opts = opts or { noremap = true, silent = true }
	vim.keymap.set(mode, l, r, opts)
end

map('i', 'kj', '<esc>')
-- map('n', '<C-u>', ':echo "hiiii"<cr>')

local builtin = require('telescope.builtin')
vim.g.mapleader = " "

map('n', ',t', function()
	return ':Telescope find_files results_title="" prompt_title="" previewer=false prompt_prefix=🔍<cr>'
end, { expr = true })
-- map('n', ',g', ':Telescope find_files find_command=rg results_title="" prompt_title="" previewer=false prompt_prefix=🔍<cr>')





local gs = require('gitsigns')
local next_hunk = '<C-[>'
--
map('n', '<C-]>', ':Gitsigns next_hunk<cr>')
map('n', '<C-[>', ':Gitsigns prev_hunk<cr>')
map('v', 'b', ':Gitsigns blame_line<cr>')

--
-- map('n', prev_hunk, function()
-- 	if vim.wo.diff then return prev_hunk end
-- 	vim.schedule(function() gs.prev_hunk() end)
-- 	return '<Ignore>'
-- end, {expr=true})
-- vim.keymap.set('n', ',t', builtin.find_files(find_files_opt), { noremap = true, silent = true })
