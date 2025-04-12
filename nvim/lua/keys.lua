local function map(mode, l, r, opts)
	opts = opts or { noremap = true, silent = true }
	vim.keymap.set(mode, l, r, opts)
end

map('i', 'kj', '<esc>')

local builtin = require('telescope.builtin')
local telescopeThemes = require('telescope.themes')
vim.g.mapleader = ","
vim.keymap.set('n', '<leader>t',
	function() 
		local theme = telescopeThemes.get_ivy({})
		theme.previewer = false
		theme.prompt_prefix = '🔍 '
		builtin.find_files(theme)
	end, {})

local myDiffOpened = false
map('n', ',d', function()
	if myDiffOpened == true then
		myDiffOpened = false
		return ':DiffviewClose<cr>'
	else
		myDiffOpened = true
		return ':DiffviewOpen<cr>'
	end
end, { expr = true })



local myX = true
map('n', ',x', function()
	if myX == true then
		myX = false
		return ':echo "xxx"<cr>'
	else
		myX = true
		return ':echo "yy"<cr>'
	end
end, { expr = true })



map('n', '<C-]>', ':Gitsigns next_hunk<cr>')
map('n', '<C-[>', ':Gitsigns prev_hunk<cr>')
map('v', 'B', ':Gitsigns blame_line<cr>')

--
-- map('n', prev_hunk, function()
-- 	if vim.wo.diff then return prev_hunk end
-- 	vim.schedule(function() gs.prev_hunk() end)
-- 	return '<Ignore>'
-- end, {expr=true})
-- vim.keymap.set('n', ',t', builtin.find_files(find_files_opt), { noremap = true, silent = true })
