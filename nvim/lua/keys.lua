function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
	map('n', shortcut, command)
end

function imap(shortcut, command)
	map('i', shortcut, command)
end


imap('kj', '<esc>')
nmap(',t', ':Telescope find_files results_title="" prompt_title="" previewer=false<cr>')
