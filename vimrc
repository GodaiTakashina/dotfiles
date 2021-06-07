" plugin ---------------------- {{{
execute pathogen#infect()
" }}}

""" general settings ---------------------- {{{

" enable syntax highlight
syntax enable

" enable filetype plugin
filetype plugin on

" use colors for dark background
set background=dark

" print the line number in front of each line
set number
set numberwidth=2

" status line setting
set laststatus=2
set statusline=%f\ %y\ %m\ %=\ %l,%c/%L

" show bracket match
set showmatch
set matchtime=2

" allow backspacing over autoindent/line breaks/start of insert
set backspace=indent,eol,start

" indent setting
set autoindent
set shiftwidth=4

" search setting
set ignorecase
set smartcase
set hlsearch
set incsearch

" command-line completion
set wildmenu
set wildmode=list:longest,full

" default filetype for *.tex
let g:tex_flavor = "latex"

" }}}

""" key mappings ---------------------- {{{

" set leader key ---------------------- {{{
let mapleader = ","
let maplocalleader = "\\"

nnoremap + ,
vnoremap + ,
" }}}

" motions ---------------------- {{{

" left-right motions
noremap H ^
noremap L $
noremap ^ <nop>
noremap $ <nop>

" up-down motions
noremap <C-j> gj
noremap <C-k> gk

" other motions
noremap <C-h> H
noremap <C-l> L

" move aroung buffer list
nnoremap [b :<C-u>bprev<CR>
nnoremap ]b :<C-u>bnext<CR>

" move around quickfix list
nnoremap [c :<C-u>cprev<CR>
nnoremap ]c :<C-u>cnext<CR>

" }}}

" search ---------------------- {{{

" very magic search
nnoremap g/ /\v
vnoremap g/ /\v

" make & command to remember flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" }}}

" normal mode ---------------------- {{{

" yank until the end of the line
nnoremap Y y$

" insert text before the last character of the line
nnoremap gA $i

" Delete current line except line break
nnoremap <Leader>d 0D

" edit vimrc
nnoremap <Leader>ev :<C-u>vsplit $MYVIMRC<CR>

" toggle fold column
nnoremap <leader>f :call FoldColumnToggle()<CR>

" stop highlighting matches
nnoremap <Leader>m :<C-u>match<CR>

" toggle number
nnoremap <leader>n :setlocal number!<CR>

" reset filetype
nnoremap <leader>sf :call ResetFileType()<CR>

" source vimrc
nnoremap <Leader>sv :<C-u>source $MYVIMRC<CR>

" swap the current word and the next word
nnoremap <leader>w :normal! dawwPb<CR>

" highlight trailing spaces
nnoremap <Leader>$ :<C-u>match Todo / \+$/<CR>

" clear screen and stop highlighting
nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR><C-l>

" }}}

" insert mode ---------------------- {{{

"  move forward/backword
inoremap <C-f> <Right>
inoremap <C-b> <Left>

" insert expression
inoremap <C-g><C-e> <C-r>=

" make current word to lowercase/uppercase
" *** don't work well in Visual-Block insert
inoremap <C-g>u <esc>viwuea
inoremap <C-g>U <esc>viwUea
inoremap <C-g><C-u> <esc>viwUea

" <C-z> : redraw, line at center of the window
inoremap <C-z> <C-o>zz

" }}}

" surround ---------------------- {{{
vnoremap " <ESC>`>a"<ESC>`<i"<ESC>`>2l
vnoremap ' <ESC>`>a'<ESC>`<i'<ESC>`>2l
vnoremap ( <ESC>`>a)<ESC>`<i(<ESC>`>2l
vnoremap ) <ESC>`>a)<ESC>`<i(<ESC>`>2l
vnoremap { <ESC>`>a}<ESC>`<i{<ESC>`>2l
vnoremap } <ESC>`>a}<ESC>`<i{<ESC>`>2l
vnoremap [ <ESC>`>a]<ESC>`<i[<ESC>`>2l
vnoremap ] <ESC>`>a]<ESC>`<i[<ESC>`>2l
" }}}

" columnate ---------------------- {{{
vnoremap <Leader>cl :!column -t<CR>
" }}}

" }}}

" abbreviations ---------------------- {{{

" horizontal line
iabbrev #- ----------------------

" }}}

" functions ---------------------- {{{

function! FoldColumnToggle()
    if &foldcolumn
	setlocal foldcolumn=0
    else
	setlocal foldcolumn=3
    endif
endfunction

function! ResetFileType()
    let ft = &filetype
    execute "set filetype=" . ft
endfunction

" }}}
