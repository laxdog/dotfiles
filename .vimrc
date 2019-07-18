" This guide is good:
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
"
"
" This option has the effect of making Vim either more Vi-compatible
" If you set this option in your vimrc file, you should probably put it at the
" very start
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'altercation/vim-colors-solarized'
Plugin 'gmarik/Vundle.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'jnurmine/Zenburn'
Plugin 'luochen1990/rainbow'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'powerman/vim-plugin-AnsiEsc'

Bundle 'jiangmiao/auto-pairs'
Bundle 'chrisbra/csv.vim'
Bundle 'martinda/Jenkinsfile-vim-syntax'
" Bundle 'edkolev/tmuxline.vim'
Bundle 'majutsushi/tagbar'
Bundle 'edkolev/promptline.vim'


" Add all your plugins here (note older versions of Vundle used Bundle instead
" of Plugin)
:let mapleader = "1"

" Toggle tagbar https://www.pkimber.net/howto/vim/plugin/tagbar.html
autocmd VimEnter * nested :call tagbar#autoopen(1)

" Rainbow brackets (from Plugin 'luochen1990/rainbow')
let g:rainbow_active = 1
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype off
filetype plugin indent on    " required

" Removing pathogen to use vundle instead
" execute pathogen#infect()

syntax enable
set t_Co=256
let g:solarized_termcolors=16
colorscheme solarized
set background=dark

let python_highlight_all=1
syntax on
map <leader>1 :NERDTreeTabsToggle<CR>
map <leader>2 :NERDTreeFocusToggle  <CR>
map <leader>3 :TagbarToggle<CR>
map <leader>4 :set nu! <CR>
map <leader>5 :set paste!<CR>
map <leader>6 :SyntasticToggleMode<CR><CR>
map <leader>7 :if exists("syntax_on") <Bar>syntax off <Bar> else <Bar> syntax on <Bar> endif <CR>
map <leader>8 :%!indent <CR> 
map <leader>9 :set wrap! <CR> 
map <leader>0 :BufExplorerHorizontalSplit <CR> 

" disable autoindent
nnoremap <F8> :setl noai nocin nosi inde=<CR>
" similar usecase to above, toggle paste mode
set pastetoggle=<F2>

set ignorecase
set smartcase
set so=7 "start scrolling 7 lines from bottom
set cmdheight=1 "Number of lines to use for cmdline + output
set foldmethod=indent "Folding method indent (useful for python)
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
map <leader><Right> :tabn <CR>
map <leader><Left> :tabp <CR>

" Override the 'ignorecase' option if the search pattern contains upper case
" characters
set ignorecase
set smartcase
" Set highlight search
set hlsearch

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" syntastic 
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 0
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=3
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq = 1

let syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = "✗✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = '≈≈'
let g:syntastic_style_warning_symbol = '✠'
let g:syntastic_enable_balloons=1
let g:syntastic_python_checkers=['flake8']
"E401 = multiple imports per line. E221 = multiple spaces before operator
let g:syntastic_python_flake8_args='--ignore=E401,E221,E241,E702 --max-line-length=120'
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_filetype_map = { "json": "javascript", }

" Allow backspace (and ctrl+w) to work in insert mode
set backspace=indent,eol,start

" YouCompleteMe bindings / config
let g:ycm_autoclose_preview_window_after_completion=1
" Supposedly for error list population, though I think it fixed the pop up
" completion menu for me too. 
let g:ycm_always_populate_location_list = 1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" diff mode
if &diff
    " have vimdiff ignore white space
    set diffopt+=iwhite
endif

" Don't open on startup as it's breaking YCM python completion
let g:nerdtree_tabs_open_on_console_startup=0

" Hide pyc files in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Swap the buffers in two panes
function! MarkWindowSwap()
    " marked window number
    let g:markedWinNum = winnr()
    let g:markedBufNum = bufnr("%")
endfunction

function! DoWindowSwap()
    let curWinNum = winnr()
    let curBufNum = bufnr("%")
    " Switch focus to marked window
    exe g:markedWinNum . "wincmd w"

    " Load current buffer on marked window
    exe 'hide buf' curBufNum

    " Switch focus to current window
    exe curWinNum . "wincmd w"

    " Load marked buffer on current window
    exe 'hide buf' g:markedBufNum
endfunction

nnoremap <leader>h :call MarkWindowSwap()<CR> <C-w>h :call DoWindowSwap()<CR>
nnoremap <leader>j :call MarkWindowSwap()<CR> <C-w>j :call DoWindowSwap()<CR>
nnoremap <leader>k :call MarkWindowSwap()<CR> <C-w>k :call DoWindowSwap()<CR>
nnoremap <leader>l :call MarkWindowSwap()<CR> <C-w>l :call DoWindowSwap()<CR>

map <Leader>b Oimport ipdb; ipdb.set_trace()<Esc>
map <Leader>B :g/^\s*import ipdb; ipdb.set_trace()/d<CR>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='jellybeans'
let g:airline_highlighting_cache=1

set ttyfast
set lazyredraw
set re=1

" automatically change window's cwd to file's dir
set autochdir

" spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

" Nice lines showing indentation
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
set cursorline
set cursorcolumn

" Some python specific PEP-8 things
au BufNewFile,BufRead *.py
    \ set softtabstop=4 |
    \ set textwidth=119 |
    \ set fileformat=unix |
    \ set tabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ setf python |
    \ set nu |
    \ match BadWhitespace /\s\+$/
