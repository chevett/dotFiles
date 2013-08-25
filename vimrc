let mapleader=","
let t_Co=256

set tags=tags;~
set cursorline
set relativenumber
set nocompatible 
"set grepprg=ack
set omnifunc=syntaxcomplete#Complete
set wildignore+=node_modules,.git
set showtabline=2
set mouse=n
set shiftwidth=4
set tabstop=4

autocmd InsertEnter * :call SetInsertOptions()
autocmd InsertLeave * :call SetNormalOptions()

function SetInsertOptions()
	hi StatusLine ctermfg=124 ctermbg=white
	set number
endfunction

function SetNormalOptions()
	hi StatusLine ctermfg=41 ctermbg=black
	set relativenumber
endfunction

call SetNormalOptions()

syntax on
filetype off                   " required!


filetype plugin on

let g:CommandTMaxFiles=20000

exec 'set viminfo=%,' . &viminfo


hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi PMenu cterm=NONE ctermbg=39 ctermfg=233 guibg=darkred guifg=white
hi PMenuSel cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi LineNr cterm=NONE ctermfg=237
hi NonText ctermfg=234
hi SpecialKey ctermfg=234
hi Search ctermbg=49 ctermfg=233

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 6, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 6, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 6, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 6, 4)<CR>
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>m :TernDef<CR>
nnoremap <Leader>u :TernRefs<CR>
nnoremap <Leader>r :TernRename<CR>
nnoremap <Leader>k :cd %:p:h<CR>:NERDTreeCWD<CR>
nnoremap <Leader>l :NERDTreeToggle<CR>
nnoremap <Leader>f :Ack --smart-case<space>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR> " set the working directiory to the current file's location
nnoremap <Space> <C-w>w
nnoremap <C-V> :tabe ~/.vimrc<CR>
nnoremap <Tab> gT


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'git@github.com:marijnh/tern_for_vim.git'
Bundle 'git@github.com:terryma/vim-expand-region.git' 
Bundle 'git@github.com:terryma/vim-smooth-scroll.git' 
Bundle 'https://github.com/mileszs/ack.vim.git'
Bundle 'git@github.com:guns/xterm-color-table.vim.git'
Bundle 'https://github.com/groenewege/vim-less.git'
Bundle 'git@github.com:scrooloose/nerdtree.git'
Bundle 'git@github.com:scrooloose/syntastic.git'
"------------------------------------------------------------------------
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
let @/ = ''
if exists('#auto_highlight')
	au! auto_highlight
		augroup! auto_highlight
		setl updatetime=4000
	return 0
else
	augroup auto_highlight
	au!
	au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
	augroup end
	setl updatetime=100
	return 1
endif
endfunction "call AutoHighlightToggle() "======================================================================== 


" Enable omni completion.
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

 filetype plugin indent on     " required!

set laststatus=2
set statusline+=%F

 " highlight tabs and trailing spaces
 set listchars=tab:>-,trail:~,extends:>,precedes:<
 set list
