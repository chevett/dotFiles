let mapleader=","
let g:airline_powerline_fonts = 1
let t_Co=256
let g:airline_theme='solarized'
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
syntax enable
let g:syntastic_enable_highlighting = 0
"set background=dark
"colorscheme solarized
"let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

autocmd InsertEnter * :call SetInsertOptions()
autocmd InsertLeave * :call SetNormalOptions()
autocmd BufNewFile,BufRead *.pjs set filetype=javascript
autocmd BufNewFile,BufRead *.json set ft=javascript

function SetInsertOptions()
	set nocursorline
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endfunction

function SetNormalOptions()
	set cursorline
endfunction

call SetNormalOptions()

syntax on
filetype off                   " required!


filetype plugin on

let NERDTreeIgnore = ['\.pyc$']
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg
set wildignore+=node_modules,.git

let g:CommandTMaxFiles=20000
let g:CommandTMatchWindowAtTop=1

exec 'set viminfo=%,' . &viminfo

hi MatchParen cterm=NONE ctermbg=169
hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi PMenu cterm=NONE ctermbg=39 ctermfg=233 guibg=darkred guifg=white
hi PMenuSel cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi LineNr cterm=NONE ctermfg=23
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
nnoremap <Leader>gd :call MyDiffToggle()<cr>
nnoremap <Leader>f :Ack --smart-case<space>


nnoremap <Leader>O O<Esc>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR> " set the working directiory to the current file's location
nnoremap <Tab> :bnext<CR>
nnoremap <BS> :bprevious<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
"nnoremap <C-V> :tabe ~/.vimrc<CR>
noremap <F5> :CommandTFlush<CR>
"noremap <F4> :set noet|retab!<CR>
nnoremap <F4> :%retab! <CR>
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
imap <C-w> <C-]>w
imap <C-e> <C-]>e
imap <C-b> <C-]>b
imap <C-^> <C-]>^
imap <C-$> <C-]>$
imap <C-]> <Esc>:w!<CR>

inoremap kj <Esc>

nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>
map <F8> :TagbarToggle<CR>

" write anyway
cmap w!! w !sudo tee % >/dev/null

noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>
noremap <Down>  <NOP>

"nnoremap <Leader><Leader>1 :cd %:p:h<CR>:NERDTreeCWD<CR>
nnoremap <Leader><Leader>1 :NERDTreeTabsToggle<CR>
nnoremap <Leader><Leader>2 :NERDTreeFind<CR>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'git@github.com:Lokaltog/vim-easymotion.git'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'git@github.com:marijnh/tern_for_vim.git'
Bundle 'git@github.com:terryma/vim-smooth-scroll.git' 
Bundle 'git@github.com:mileszs/ack.vim.git'
Bundle 'git@github.com:guns/xterm-color-table.vim.git'
Bundle 'git@github.com:groenewege/vim-less.git'
Bundle 'git@github.com:scrooloose/nerdtree.git'
Bundle 'git@github.com:jistr/vim-nerdtree-tabs.git'
Bundle 'git@github.com:scrooloose/syntastic.git'
Bundle 'git@github.com:airblade/vim-gitgutter.git'
Bundle 'git@github.com:jelera/vim-javascript-syntax.git'
Bundle 'git@github.com:ervandew/supertab.git'
Bundle 'git@github.com:tpope/vim-fugitive.git'
Bundle 'git@github.com:christoomey/vim-tmux-navigator.git'
Bundle 'git@github.com:tpope/vim-commentary.git'
"Bundle 'git@github.com:bling/vim-airline.git'
Bundle 'git@github.com:tpope/vim-unimpaired.git'
Bundle 'git@github.com:majutsushi/tagbar.git'
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



function! MyDiffToggle()
  if (&diff == 0 || getbufvar('#', '&diff') == 0)
        \ && (bufname('%') !~ '^fugitive:' && bufname('#') !~ '^fugitive:')
    w!
	tabe %
	Gdiff
    return
  endif

  " close current buffer if alternate is not fugitive but current one is
  if bufname('#') !~ '^fugitive:' && bufname('%') =~ '^fugitive:'
    if bufwinnr("#") == -1
      b #
      bd #
    else
      bd
    endif
  else
    bd #
  endif
  w!
  tabclose!
endfunction

highlight DiffAdd    cterm=bold ctermfg=87 ctermbg=22 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=236 ctermbg=52 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=99 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=233 ctermbg=88 gui=none guifg=bg guibg=Red
