set nocompatible

let maplocalleader = ","

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    set runtimepath+=~/.vim/bundle/vim-redl/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

"set background=light
"colorscheme solarized

set history=1000
set mouse=a
set ignorecase
set smartcase
set ruler
"set hidden

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

let g:paredit_mode = 1
let g:paredit_shortmaps = 1
let g:paredit_smartjump = 1

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'

NeoBundle 'tpope/vim-fireplace'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'https://bitbucket.org/kovisoft/paredit'
NeoBundle 'xolox/vim-reload'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mrdomino/vim-utf8'

filetype plugin indent on

syntax on

" Clojure-specific settings
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']
let g:clojure_fuzzy_indent_blacklist = ['-fn$', '\v^with-%(meta|out-str|loading-context)$']
let g:clojure_align_multiline_strings = 1

" Rainbow parentheses colors.
" Left column is for terminal environment.
" Right column is for GUI environment.
" Outermost is determined by last.
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ]

" Enable Rainbow Parens everywhere
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
        

" Configure Clojure repl commands
imap <silent> <C-e> <Plug>ClojureReplEvaluate.
imap <silent> <C-k> <Plug>ClojureReplUpHistory.
imap <silent> <C-j> <Plug>ClojureReplDownHistory.
imap <silent> <C-Up> <Plug>ClojureReplUpHistory.
imap <silent> <C-Down> <Plug>ClojureReplDownHistory.

" Configure Control-P plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_custom_ignore = {
	    \ 'dir':  '\v(\.(git|hg|svn|cvs)|target)$',
	    \ 'file': '\.exe$\|\.so$\|\.dll$|\.class$',
	    \ }

" EasyMotion leader
let g:EasyMotion_leader_key = ',,'

" Remap tab to escape
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
"inoremap <Tab> <Esc>`^
inoremap <Tab> <Esc>
inoremap <Leader><Tab> <Tab>

" Make indenting and unindenting in visual mode retain the selection so
" you don't have to re-select or type gv every time.
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Make CTRL+u and CTRL+d less confusing
"map <C-u> 10<C-Y>10k
"map <C-d> 10<C-E>10j

" Switch windows quickly with CTRL+{h,j,k,l}
" This breaks backspace in a terminal, but I never use backspace in
" normal mode
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
" This would break in a terminal where ^H is
" backspace.
if has("gui_running")
    imap <C-h> <Esc><C-W>h
endif
imap <C-j> <Esc><C-W>j
imap <C-k> <Esc><C-W>k
imap <C-l> <Esc><C-W>l

" Make j,k move by screen lines instead of file lines.
" WARNING: If you use this vimrc, make sure you understand the
" implications
" of the following two mappings, especially if you use macros
" frequently.
" A temporary workaround for writing macros is to go into
" insert mode, use
" the up/down arrow keys, then exit to normal mode.
map j gj
map k gk

" Don't update the display while executing macros
set lazyredraw

"autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
"autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
"highlight EOLWS ctermbg=red guibg=red

NeoBundleCheck
