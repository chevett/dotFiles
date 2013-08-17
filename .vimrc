let mapleader=","
let t_Co=256
set tags=tags;~
set cursorline
set number
syntax on
set nocompatible               " be iMproved
 filetype off                   " required!

 let g:vimfiler_as_default_explorer = 1

 set showtabline=2
 
filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:CommandTMaxFiles=20000
"let g:CommandTHighlightColor=red

exec 'set viminfo=%,' . &viminfo

set grepprg=ack


hi CursorLine   cterm=NONE ctermbg=233 guibg=darkred guifg=#121212
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi PMenu cterm=NONE ctermbg=39 ctermfg=233 guibg=darkred guifg=white
"hi Search cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi PMenuSel cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi PMenu cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi LineNr cterm=NONE ctermfg=237
hi NonText ctermfg=234
hi SpecialKey ctermfg=234
hi Search ctermbg=49 ctermfg=233

"nmap <Space> ,b
"nmap <S-Enter> 

nmap <C-k> :call smooth_scroll#up(15, 5, 1)<CR>
nmap <C-j> :call smooth_scroll#down(15, 4, 1)<CR>
nmap <C-h> 10h
nmap <C-l> 10l
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>m :TernDef<CR>
nnoremap <Leader>u :TernRefs<CR>
nnoremap <Leader>r :TernRename<CR>
map <C-l> :VimFilerExplorer<CR> 

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
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
 Bundle 'git@github.com:Shougo/unite.vim.git'
 Bundle 'git@github.com:Shougo/vimfiler.vim.git'
 Bundle 'https://github.com/mileszs/ack.vim.git'
 Bundle 'git@github.com:guns/xterm-color-table.vim.git'
 Bundle 'https://github.com/groenewege/vim-less.git'
 
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


 "------------------------ neo completion with cache -------------------------------------
 let g:acp_enableAtStartup = 0
 
 " Use neocomplcache.
 let g:neocomplcache_enable_at_startup = 1
 Bundle 'git@github.com:Shougo/neocomplcache.vim.git'

noremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	  return neocomplcache#smart_close_popup() . "\<CR>"
	    " For no inserting <CR> key.
	    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
	  endfunction



 inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
 inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
 inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
 inoremap <expr><C-y>  neocomplcache#close_popup()
 inoremap <expr><C-e>  neocomplcache#cancel_popup()
"========================================================================================

" Enable omni completion.
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

 filetype plugin indent on     " required!

set laststatus=2
set statusline+=%F

 " highlight tabs and trailing spaces
 set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
 set list
 set tabstop=4
 
 
 
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
