set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""" Bundles go below.
Plugin 'scrooloose/nerdtree.git'
"Plugin 'scrooloose/syntastic.git'   " or flake8
Plugin 'nvie/vim-flake8.git'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
Plugin 'mbbill/undotree'
Plugin 'yegappan/mru'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'exu/pgsql.vim'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'ervandew/supertab'
"Plugin 'majutsushi/tagbar'
"Plugin 'Shougo/neocomplcache.vim'
"Plugin 'Yggdroot/indentLine'
"Plugin 'fs111/pydoc.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" For undotree:
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif


" General
set number
set linebreak
set showbreak=+++
set showmatch
set visualbell
set nowrap

set hlsearch
set smartcase
set incsearch

set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent
set smarttab
set softtabstop=4

" Advanced
set ruler

set undolevels=1000
set backspace=indent,eol,start

" clear search result highlighting
nmap ;; :noh<CR>

" Toggle the nerd tree
nmap <Leader><Space> :NERDTreeToggle<CR>

" Reload vimrc
nmap <Leader>r :source ~/.vimrc<CR>
nmap <Leader>gg :GitGutterToggle<CR>

nmap ;m :MRU<CR>

map <C-1> 1gt
map <C-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt

map <C-Tab> :tabn<CR>
map <C-S-Tab> :tabn<CR>

nmap <S-l> gt
nmap <S-h> gT

:hi Search guibg=Yellow guifg=Black ctermbg=Yellow ctermfg=Black

" Syntastic Settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_check_on_w = 0
"let g:syntastic_quiet_messages = {"type": "style", "regex": "C01\\(11\\)\\|\\(03\\)"}

let g:flake8_show_quickfix=1
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=0
highlight link Flake8_Error      None
highlight link Flake8_Warning    None
highlight link Flake8_Complexity None
highlight link Flake8_Naming     None
highlight link Flake8_PyFlake    None

nmap <Leader>1 :!sh -xc 'clear; python3 %:p'<CR>
nmap <Leader>2 :call Flake8()<CR>
nmap <Leader>r :source ~/.vimrc<CR>

" Rainbow Settings
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['lightgray',   'RoyalBlue3'],
    \ ['yellow',      'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" MRU Settings
nmap <Leader><Leader> :MRU<CR>
nmap <Leader>s :SyntasticCheck<CR>


"colorscheme CandyPaper
"colorscheme tropikos
colorscheme oxeded
"colorscheme bclear

set mouse=a

hi SpellBad ctermfg=red ctermbg=none
hi SpellCap ctermfg=red ctermbg=none
nmap ;sr :SyntasticReset<CR>

nmap <Leader>p  oimport ipdb; ipdb.set_trace()<ESC>
nmap <Leader>P  :g/\s*import ipdb;\s*ipdb.set_trace()\s*/d<CR>:noh<CR>
nmap <Leader>cp :%s/\(import ipdb;\s*ipdb.set_trace()\s*\)/#\1/g<CR>:noh<CR>
nmap <Leader>Cp :%s/\(#\)\(\s*import ipdb;\s*ipdb.set_trace()\s*\)/\2/g<CR>:noh<CR>

nnoremap <silent> + :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
nnoremap <silent> _ :exe "vertical resize " . (winwidth(0) * 4/5)<CR>
nnoremap <silent> = :exe "resize " . (winheight(0) * 5/4)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 4/5)<CR>

" setup tabbar style
:hi TabLineFill term=bold cterm=bold ctermbg=NONE
:hi TabLine ctermfg=DarkGray ctermbg=NONE
:hi TabLineSel ctermfg=Black ctermbg=LightYellow

" Underline the cursor line
:hi CursorLine gui=underline cterm=underline ctermfg=NONE guifg=NONE ctermbg=NONE

" Stylize the split line (the trailing whitespace is significant)
:hi VertSplit cterm=NONE ctermbg=NONE ctermfg=DarkGray guibg=NONE

" Sylize the statusline
:hi StatusLine ctermbg=NONE ctermfg=White
:hi StatusLineNC ctermbg=NONE ctermfg=White

" Highlight lines longer than 80 cols
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
nmap <Leader>3 :call matchadd('OverLength', '\%>81v.\+')<CR>

" search result highlight color
hi Search cterm=NONE ctermfg=black ctermbg=LightYellow
