-- Copilot on/off switch. Set to true when the subscription is active again;
-- that's the only change needed. The plugin stays installed via packer and the
-- auth in ~/.config/github-copilot is left alone, so it just resumes.
--
-- Why this is gated on g:loaded_copilot rather than g:copilot_enabled: with a
-- lapsed subscription the language server sends an LSP window/showMessageRequest
-- saying "Your subscription has ended", and copilot.vim renders that with a
-- blocking inputlist() -- a modal prompt on every single startup. Setting
-- g:copilot_enabled = 0 does NOT prevent it, because plugin/copilot.vim calls
-- copilot#Init() on VimEnter unconditionally and copilot#Init never checks that
-- flag; it only suppresses inline suggestions. g:loaded_copilot is checked on
-- line 1 of plugin/copilot.vim, so setting it here (init.lua runs before
-- pack/*/start plugins are sourced) makes the plugin finish immediately: no
-- server, no autocmds, no <Tab> hijack.
local copilot = false
if not copilot then
	vim.g.loaded_copilot = 1
end

require 'plugins'
require 'keys'

require('tokyonight').setup({
	style = 'night',
	transparent = true,
	styles = {
		sidebars = 'transparent',
		floats = 'transparent',
	},
})
vim.cmd('colorscheme tokyonight-night')

vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.expandtab = false
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.scrolloff = 4



vim.opt.list = true
vim.opt.listchars:append "tab:>-"
vim.opt.listchars:append "trail:~"
vim.opt.listchars:append "precedes:<"

-- Enable line wrapping for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
  end,
})






























































