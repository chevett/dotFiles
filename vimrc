ab fuc function nnnn() {}
ab rec const _ = require('lodash');
ab ife if (true) {} else {}

let mapleader=","
let t_Co=256
let g:tmux_navigator_no_mappings=1
set tags=tags;~
set cursorline
set number
set hidden 
set autoindent
set autoread
set smartcase
set ignorecase
set nocompatible 
set backspace=2 " make backspace work like most other apps
"set grepprg=ack
set omnifunc=syntaxcomplete#Complete
set mouse=nirc
set shiftwidth=4
set tabstop=4
set noexpandtab
set nobackup
set noswapfile
set scrolloff=4
set nowrap
set incsearch
set sidescroll=1 
set noerrorbells 
set novisualbell
set t_vb=
set updatetime=250
syntax enable
let g:syntastic_enable_highlighting = 0

autocmd InsertEnter * :call SetInsertOptions()
autocmd InsertLeave * :call SetNormalOptions()
autocmd BufNewFile,BufRead *.json set ft=json
autocmd BufNewFile,BufRead *.less set ft=less
autocmd BufNewFile,BufRead *.vash set ft=html
autocmd BufWritePost * redraw!

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/colors/yaml.vim

function SetInsertOptions()
	set nocursorline
	" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endfunction

function SetNormalOptions()
	set cursorline
endfunction

call SetNormalOptions()

syntax on
filetype off				   " required!

set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg
set wildignore+=node_modules,.git

let g:CommandTMaxFiles=20000
let g:CommandTMatchWindowAtTop=0
let g:CommandTMaxHeight=8
let g:CommandTMinHeight=8
let g:CommandTTraverseSCM='pwd'
"let g:CommandTMatchWindowReverse=1

exec 'set viminfo=%,' . &viminfo



filetype off	
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'L9'
Plugin 'git@github.com:Lokaltog/vim-easymotion.git'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'git@github.com:marijnh/tern_for_vim.git'
Plugin 'git@github.com:mileszs/ack.vim.git'
Plugin 'git@github.com:scrooloose/syntastic.git'
Plugin 'git@github.com:airblade/vim-gitgutter.git'
Plugin 'git@github.com:jelera/vim-javascript-syntax.git'
Plugin 'git@github.com:ervandew/supertab.git'
Plugin 'git@github.com:tpope/vim-fugitive.git'
Plugin 'git@github.com:christoomey/vim-tmux-navigator.git'
Plugin 'git@github.com:tpope/vim-commentary.git'
Plugin 'git@github.com:groenewege/vim-less.git'

let g:vim_json_syntax_conceal = 0
Plugin 'elzr/vim-json'
call vundle#end()
filetype off	

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

 filetype plugin indent on	   " required!

set laststatus=2

 " highlight tabs and trailing spaces
 set listchars=tab:>-,trail:~,extends:>,precedes:<
 set list


function! MyDiffToggle()
  if (&diff == 0 || getbufvar('#', '&diff') == 0)
		\ && (bufname('%') !~ '^fugitive:' && bufname('#') !~ '^fugitive:')
	Gvdiff
	return
  endif
  bd

endfunction

set statusline=%t		"tail of the filename
set statusline+=%m		"modified flag
set statusline+=%r		"read only flag
set statusline+=%=		"left/right separator
set statusline+=%c,		"cursor column
set statusline+=%l/%L	"cursor line/total lines
set statusline+=\ %P	"percent through file

"nnoremap ; :
inoremap kj <Esc>
noremap <Left>	<NOP>
noremap <Right> <NOP>
noremap <Up>	<NOP>
noremap <Down>	<NOP>

nnoremap <Leader>f :Ack --smart-case<space>

nnoremap <Leader>m :TernDef<CR>
nnoremap <Leader>u :TernRefs<CR>
nnoremap <Leader>r :TernRename<CR>

nnoremap <Leader>O O<Esc>
nnoremap <Leader>o o<Esc>

nnoremap <Leader>d :call MyDiffToggle()<CR>

" if in diff mode, then hjkl navigates changes and pulls from left or right
nmap <silent> <expr> <C-j> &diff ? ']c' : ':TmuxNavigateDown<cr>'
nmap <silent> <expr> <C-k> &diff ? '[c' : ':TmuxNavigateUp<cr>'
nmap <silent> <expr> <C-l> &diff ? ':diffput<CR>' : ':TmuxNavigateRight<cr>'
nmap <silent> <expr> <C-h> &diff ? ':diffget<CR>' : ':TmuxNavigateLeft<cr>'
nmap <silent> <expr> <enter> &diff ? 'zR' : ''
nmap <expr> <C-enter> &diff ? ':echo 'hi'' : ''

