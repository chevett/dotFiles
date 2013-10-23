let mapleader=","
let t_Co=256
set tags=tags;~
set cursorline
set relativenumber
set hidden 
set autoindent
set smartcase
set ignorecase
set nocompatible 
set backspace=2 " make backspace work like most other apps
"set grepprg=ack
set omnifunc=syntaxcomplete#Complete
set wildignore+=node_modules,.git
set mouse=nirc
set shiftwidth=4
set tabstop=4
set nobackup
set noswapfile
set scrolloff=4
set nowrap

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

autocmd InsertEnter * :call SetInsertOptions()
autocmd InsertLeave * :call SetNormalOptions()
autocmd BufNewFile,BufRead *.pjs set filetype=javascript
autocmd BufNewFile,BufRead *.json set ft=javascript

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
let g:CommandTMatchWindowAtTop=1

exec 'set viminfo=%,' . &viminfo

hi MatchParen cterm=NONE ctermbg=169
hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi PMenu cterm=NONE ctermbg=39 ctermfg=233 guibg=darkred guifg=white
hi PMenuSel cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi LineNr cterm=NONE ctermfg=23
hi NonText ctermfg=234
hi SpecialKey ctermfg=234
hi Search ctermbg=49 ctermfg=233
hi Visual  ctermfg=232 ctermbg=198 gui=none
hi SignColumn ctermbg=NONE

nnoremap ; :
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 5, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 4)<CR>
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>m :TernDef<CR>
nnoremap <Leader>u :TernRefs<CR>
nnoremap <Leader>r :TernRename<CR>
nnoremap <Leader>f :Ack --smart-case<space>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR> " set the working directiory to the current file's location
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
"nnoremap <C-V> :tabe ~/.vimrc<CR>
noremap <F5> :CommandTFlush<CR>
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
imap <C-w> <C-o>w
imap <C-b> <C-o>b
imap <C-^> <C-o>^
imap <C-$> <C-o>$
imap <C-]> <Esc>:w!<CR>

"nnoremap <Leader><Leader>1 :cd %:p:h<CR>:NERDTreeCWD<CR>
nnoremap <Leader><Leader>1 :NERDTreeTabsToggle<CR>
nnoremap <Leader><Leader>2 :NERDTreeFind<CR>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'git@github.com:marijnh/tern_for_vim.git'
Bundle 'git@github.com:terryma/vim-expand-region.git' 
Bundle 'git@github.com:terryma/vim-smooth-scroll.git' 
Bundle 'https://github.com/mileszs/ack.vim.git'
Bundle 'git@github.com:guns/xterm-color-table.vim.git'
Bundle 'https://github.com/groenewege/vim-less.git'
Bundle 'git@github.com:scrooloose/nerdtree.git'
Bundle 'git@github.com:jistr/vim-nerdtree-tabs.git'
Bundle 'git@github.com:scrooloose/syntastic.git'
Bundle 'git@github.com:itchyny/lightline.vim.git'
Bundle 'git@github.com:airblade/vim-gitgutter.git'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'git@github.com:ervandew/supertab.git'
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


 vnoremap <C-c> "+yi
