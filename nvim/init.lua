require 'plugins'
require 'keys'

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






























































