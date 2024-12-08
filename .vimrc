" Disable audible bell.
set visualbell t_vb=

" Set compatibility to Vim instead of Vi
set nocompatible
set encoding=utf8

" Show current keys being pressed in status bar.
set showcmd

" Set line number on.
" set number
" Set relative number on
set rnu
" Make Space the leade
let mapleader = ","

" Don't close buffers when switching. Preserve history and changes.
set hidden

" Don't need backups
set nobackup

" Disable the swap file. Enable this before loading large files.
set noswapfile

" Disable the normal behavior of deleting current file and writing it again.
set nowritebackup

" Make Leader-e same as Explore
nmap <Leader>e <c-p>

" Map n to nzz so the next found will be brought to the center of screen.
map n nzz

" Map F4 to :buffers.
noremap <F4> <Esc>:buffers<CR>:buffer<Space>

" Map <Leader>w to :w<Enter>
" Incluidng in insert mode
map <Leader>w :w<CR>
imap ,w <Esc>:w<CR>

" Mapping for more window navigation
map <Leader>h <c-w>h
map <Leader>j <c-w>j
map <Leader>k <c-w>k
map <Leader>l <c-w>l

nnoremap <c-j> :resize +2<CR>
nnoremap <c-k> :resize -2<CR>
nnoremap <c-h> :vertical resize -2<CR>
nnoremap <c-l> :vertical resize +2<CR>

" Cycle through tabs
map <Leader>t gT

" Map <F3> to work like switching between two buffers.
" Same as entering <Leader>l and then # followed by CR
:imap <F3> <Esc>:bu#<CR>
:map <F3> :bu#<CR>

" Set the tabstop, shiftwidth etc
set tabstop=8
"set softtabstop=2
set shiftwidth=4
set smarttab
set expandtab

" Mapping for toggle invisible characters
nmap <Leader>1 :set list!<CR>
set listchars=tab:>-,trail:.,extends:>

"Invisible character colors
highlight NonText guifg=#E0DADC
highlight SpecialKey guifg=#E0DADC

" Set the font 
" Menlo Bold:h12
set guifont=Menlo\ Bold:h13

" Set a vertical line at 120th col.
hi ColorColumn ctermbg=255
set colorcolumn=120 


" Incremental search
set incsearch

" Start Vim Plug: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
" Automatically show Vim's complete menu while typing.
Plug 'vim-scripts/AutoComplPop'
" Haproxy config syntax highlight
Plug 'Joorem/vim-haproxy'
call plug#end()

" NERDTree mappings
map <C-n> :NERDTreeToggle<CR>
" Show hidden files by default
let NERDTreeShowHidden=1

syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete

" Turn wrap off. 
set wrap!

" Toggle the function list
map <F2> :Flisttoggle<CR>

" Paste mode toggle.
set pastetoggle=<F2>

" Remap ; to :. This eliminates the need to press SHIFT when saving 
" and other operations.
nnoremap ; :

" ignore list for CtrlP
" This will speed it up.
let g:ctrlp_custom_ignore = 'tmp\|DS_Store\|report_files\|report_templates\|git\|img\|icons\|Report Templates\|db_clean_up\|PHPExcel_working'

" Always show status line
set laststatus=2                             " always show statusbar  

hi StatusLine ctermbg=white ctermfg=6
hi StatusLineNC ctermbg=white ctermfg=grey 



" In insert mode, F5 to the same as shift enter in the GUI mode
" This helps when starting a function or an array
imap <F5> <CR><Esc>O

" Auto continue comments
au Bufenter *.php set comments=sl:/*,mb:*,elx:*/
set formatoptions+=r

" Insert a ; at the end of the current line and go to new line
imap <F11> <C-o>A;

" Map .. to -> for PHP development
imap <Leader>. ->

" Map ,e to move cursor to end of line in insert mode.
imap <Leader>e <ESC>g_a


"Clear the current search term.
function! ClearSearch()
	let @/ = ""
endfunction

" Get current git branch name or an empty string if it is not a repo
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'['.l:branchname.']':''
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction


" Search and replace the current word.
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

set clipboard=unnamedplus

" Easy alilgn: https://github.com/junegunn/vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Ignore case in search unless there is a capital letter.
set ignorecase
set smartcase
