let mapleader =" "

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Download vim-plug if missing
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    silent! execute 'curl -fsSLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * silent! PlugInstall
endif

" Load vim-plug
silent! if plug#begin('~/.local/share/nvim/plugged')
    Plug 'bfrg/vim-cpp-enhanced-highlight',
    Plug 'dylanaraps/wal.vim'
    Plug 'ying17zi/vim-live-latex-preview'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'tpope/vim-surround'
    Plug 'atweiden/vim-vmath'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
    Plug 'junegunn/fzf'
    Plug 'vim-airline/vim-airline/'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/nerdtree'  " file list
    Plug 'majutsushi/tagbar'  " show tags in a bar (functions etc) for easy browsing
    Plug 'davidhalter/jedi-vim'   " jedi for python
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
    Plug 'Vimjas/vim-python-pep8-indent'  "better indenting for python
    Plug 'kien/ctrlp.vim'  " fuzzy search files
    Plug 'tweekmonster/impsort.vim'  " color and sort imports
    Plug 'wsdjeg/FlyGrep.vim'  " awesome grep on the fly
    Plug 'w0rp/ale'  " python linters
    Plug 'airblade/vim-gitgutter'  " show git changes to files in gutter
    Plug 'tpope/vim-commentary'  "comment-out by gc
    Plug 'roxma/nvim-yarp'  " dependency of ncm2
    Plug 'ncm2/ncm2'  " awesome autocomplete plugin
    Plug 'HansPinckaers/ncm2-jedi'  " fast python completion (use ncm2 if you want type info or snippet support)
    Plug 'ncm2/ncm2-bufword'  " buffer keyword completion
    Plug 'ncm2/ncm2-path'  " filepath completion

    call plug#end()
endif


autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'powerline'
"let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#enabled = 0 " turn off the whitespace extension
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme='wal'
set noshowmode

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.columnr = ''
let g:airline_symbols.maxlinenr = ''

set fileformat=unix


set mouse=a

" Security
set modelines=0

" Show line numbers
set number
set relativenumber

autocmd WinLeave * : set norelativenumber
autocmd WinEnter * : set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=120
set formatoptions=tcqrn1
set noshiftround

autocmd FileType tex setlocal textwidth=79

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
" nnoremap j gj
" nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
"set t_Co=256
"set background=dark
"let g:hybrid_termcolors=256
"let g:hybrid_termtrans=1
colorscheme wal
hi Normal ctermbg=none

" Tabs to spaces
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" set update time to 1 second
set updatetime=1000
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>


" Open corresponding.pdf
map <leader>p :!mupdf <c-r>%<backspace><backspace><backspace>pdf &<CR><CR>

" Compile document
map <leader>c :!compiler <c-r>%<CR>

" Get line, word and character counts with F3:
map <F3> :!wc <C-R>%<CR>

" Spell-check set to F6:
map <F6> :setlocal spell! spelllang=en,sv<CR>

" Enable autocompletion:
"set wildmode=longest,list,full
"set wildmenu

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear


" Navigating with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>




"""LATEX
" Word count:
autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
" Compile document using xelatex:
autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space><c-r>%<Enter>a
autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>
" Code snippets
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ;fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;bt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ;rn (\ref{})<++><Esc>F}i

"""LATEX Logical symbols
autocmd FileType tex inoremap ;m $$<++><Esc>2T$i
autocmd FileType tex inoremap ;M \[\]<Space><Enter><++><Esc>2k\[ hi
autocmd FileType tex inoremap ;neg {\neg}
autocmd FileType tex inoremap ;V {\vee}
autocmd FileType tex inoremap ;or {\vee}
autocmd FileType tex inoremap ;L {\wedge}
autocmd FileType tex inoremap ;and {\wedge}
autocmd FileType tex inoremap ;ra {\rightarrow}
autocmd FileType tex inoremap ;la {\leftarrow}
autocmd FileType tex inoremap ;lra {\leftrightarrow}
autocmd FileType tex inoremap ;fa {\forall}
autocmd FileType tex inoremap ;ex {\exists}
autocmd FileType tex inoremap ;dia	{\Diamond}
autocmd FileType tex inoremap ;box	{\Box}
autocmd FileType tex inoremap ;gt	{\textgreater}
autocmd FileType tex inoremap ;lt	{\textless}

""".bib
autocmd FileType bib inoremap ;a @article{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>journal<Space>=<Space>"<++>",<Enter><tab>volume<Space>=<Space>"<++>",<Enter><tab>pages<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ;b @book{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>6kA,<Esc>i
autocmd FileType bib inoremap ;c @incollection{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>booktitle<Space>=<Space>"<++>",<Enter><tab>editor<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i

" Goyo plugin makes text more readable when writing prose:
map <F10> :Goyo<CR>
map <leader>f :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a

function! s:goyo_enter()
    set nonumber
    set norelativenumber
    set noshowcmd
    set scrolloff=999
    Limelight
endfunction

function! s:goyo_leave()
    set number
    set relativenumber
    set scrolloff=3
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++


" Copy selected text to system clipboard (requires xclip installed):
"vnoremap <C-c> "cy<esc>:!echo -n '<C-R>c' \|<space>xclip<CR><enter>


let g:python3_host_prog = '/usr/bin/python3'

set wrapscan

set undodir=~/.undodir
set undofile  " save undos
set undolevels=10000  " maximum number of changes that can be undone
set undoreload=100000  " maximum number lines to save for undo on a buffer reload

" toggle nerdtree on ctrl+n
noremap <C-u> :NERDTreeToggle<CR>
noremap <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>

" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
" " make it FAST
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

set pumheight=5

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> (pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : "\<CR>"

"auto indent for brackets
nmap <leader>w :w!<cr>
"nmap <leader>q :lcl<cr>:q<cr>
nnoremap <leader>h :nohlsearch<Bar>:echo<CR>
"
" FlyGrep settings
"nnoremap <leader>s :FlyGrep<cr>

" ale options
let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
let g:ale_python_pylint_options = '-j 0 --max-line-length=120'
let g:ale_list_window_size = 4
let g:ale_sign_column_always = 0
"let g:ale_open_list = 1
"let g:ale_keep_list_window_open = '1'

" Options are in .pylintrc!
"highlight VertSplit ctermbg=253

let g:ale_sign_error = '‼'
let g:ale_sign_warning = '∙'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = '0'
let g:ale_lint_on_save = '1'
nmap <silent> <C-M> <Plug>(ale_previous_wrap)
nmap <silent> <C-m> <Plug>(ale_next_wrap)

" highlight python and self function
autocmd BufEnter * syntax match Type /\v\.[a-zA-Z0-9_]+\ze(\[|\s|$|,|\]|\)|\.|:)/hs=s+1
autocmd BufEnter * syntax match pythonFunction /\v[[:alnum:]_]+\ze(\s?\()/
hi def link pythonFunction Function
autocmd BufEnter * syn match Self "\(\W\|^\)\@<=self\(\.\)\@="
highlight self ctermfg=239

" jedi options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0

" Impsort option
hi pythonImportedObject ctermfg=127
hi pythonImportedFuncDef ctermfg=127
hi pythonImportedClassDef ctermfg=127

" Remove all trailing whitespace by pressing C-S
"nnoremap <C-S> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
"autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" move between defs python:
"# NOTE: this break shortcuts with []
"nnoremap [[ [m
"nnoremap ]] ]m

"nnoremap <silent><nowait> [ [[
"nnoremap <silent><nowait> ] ]]

" vimgutter options
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0
 
" ctrl p options
let g:ctrlp_custom_ignore = '\v\.(npy|jpg|pyc|so|dll)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

autocmd FileType python inoremap <F5> <Esc>:!python3<space><c-r>%<Enter>a
autocmd FileType python nnoremap <F5> :!python3<space><c-r>%<Enter>
