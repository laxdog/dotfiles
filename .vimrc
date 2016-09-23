" This guide is good:
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
"
"
" This option has the effect of making Vim either more Vi-compatible
" If you set this option in your vimrc file, you should probably put it at the
" very start
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'luochen1990/rainbow'
Plugin 'tpope/vim-commentary'
Bundle 'majutsushi/tagbar'


" Add all your plugins here (note older versions of Vundle used Bundle instead
" of Plugin)

" Toggle tagbar https://www.pkimber.net/howto/vim/plugin/tagbar.html
nnoremap <leader>6 :TagbarToggle<CR>
autocmd VimEnter * nested :call tagbar#autoopen(1)

" Rainbow brackets (from Plugin 'luochen1990/rainbow')
let g:rainbow_active = 1
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Removing pathogen to use vundle instead
" execute pathogen#infect()

syntax enable
set t_Co=256
colorscheme solarized
set background=dark

let python_highlight_all=1
syntax on
map <leader>1 :SyntasticToggleMode<CR><CR>
map <leader>2 :NERDTreeFocusToggle  <CR>
map <leader>3 :NERDTreeTabsToggle<CR>
map <leader>4 :set nu! <CR>
map <leader>5 :setf python <CR>
" map <leader>6 zfap
map <leader>7 :if exists("syntax_on") <Bar>syntax off <Bar> else <Bar> syntax on <Bar> endif <CR>
map <leader>8 :%!indent <CR> 
map <leader>9 :set wrap! <CR> 
" disable autoindent
nnoremap <F8> :setl noai nocin nosi inde=<CR>

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

filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" syntastic 
let g:syntastic_auto_loc_list = 0
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_loc_list_height=3
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq = 1

let syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='>>'
let g:syntastic_enable_balloons=1
let g:syntastic_python_checkers=['flake8']
"E401 = multiple imports per line. E221 = multiple spaces before operator
let g:syntastic_python_flake8_args='--ignore=E401,E221,E241,E702 --max-line-length=120'


" YouCompleteMe bindings / config
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" diff mode
if &diff
    " have vimdiff ignore white space
    set diffopt+=iwhite
endif

augroup vimrc_autocmds
    autocmd!
    if !&diff
        " autocmd VimEnter * NERDTreeTabsOpen
        autocmd VimEnter * wincmd p
    endif
    autocmd FileType make set noexpandtab
    autocmd FileType python set nu
    autocmd FileType python set nowrap
	autocmd FileType python setlocal completeopt-=preview
    autocmd BufNew,BufRead SConstruct setf python
    autocmd BufNew,BufRead SConscript setf python
    autocmd BufNew,BufRead SConscript.win setf python
augroup END

let g:nerdtree_tabs_open_on_console_startup=1

" Not sure if this works with NERDTreeTabs
" Quit NERDTree if it's the only open window
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
          let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
      quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

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

map <Leader>b Oimport pdb; pdb.set_trace()<Esc>
map <Leader>B :g/^\s*import pdb; pdb.set_trace()/d<CR>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" automatically change window's cwd to file's dir
set autochdir

" spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Some python specific PEP-8 things
au BufNewFile,BufRead *.py
    \ set softtabstop=4 |
    \ set textwidth=119 |
    \ set fileformat=unix |
    \ set tabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab

" Define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

" Highlight extra white space in python files
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
