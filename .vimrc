"Easy escape to normal mode
imap jj <esc>

let mapleader="'"
function! Ap(isOn)
	if(a:isOn == 1)
		inoremap ( ()<esc>i
		inoremap [ []<esc>i
		inoremap { {<CR>}<esc>O
	elseif(a:isOn == 0)
		iunmap (
		iunmap [
		iunmap {
	endif
endfunction
imap <leader>f <esc>:call Ap(1)<CR>i<right>
imap <leader>d <esc>:call Ap(0)<CR>i<right>
call Ap(1)

"better multiline comment
inoremap /* <esc>:set backspace=indent,start<CR>i/*<CR><BS>*/<esc>:set backspace=indent,eol,start<CR>O<BS>

"move over one space (move outside parens)
imap <leader>a <esc>la
syntax on			"enables syntax highlighting
set cursorline		"Shows current line cursor is on
nnoremap j gj
nnoremap k gk
"nice autocomplete for ":" commands
set wildmenu
set ignorecase		"ignore case when searching
set smartcase		"override 'ignorecase' if search contains capital letter

"makes cursor block when not in insert mode
"even solid, odd blink
"0-2 block, 3-4 underscore, 5-6 vertical bar
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q" "SI= Insert mode
let &t_EI.="\e[2 q" "EI= Normal mode (else)
let &t_te.="\e[1 q"
"SR is replace mode

set number			"line numbers
set showmode        "show mode currently editing in
set title			"show filename in window title bar
"allow backspacing over everything in insert mode
set backspace=indent,eol,start
set textwidth=80	"Can use w/ gq to wrap text really nicely

filetype indent on
set autoindent      "indent if already indented
"set smartindent     "smart indenting, ex: for loop
set tabstop=4       "num visual spaces per tab
set smarttab		"<Tab> in front of a line inserts blanks according to 'shiftwidth'
set softtabstop=4   "num spaces in tab when editing
set shiftwidth=4    "make tab 4 spaces
set noexpandtab		"don't use spaces for tabs
"configure tabs for various files
au BufReadPost,BufNewFile *.py setlocal expandtab "use spaces when tab is hit
au BufReadPost,BufNewFile *.c,*.h setlocal cindent

set ruler			"always show cursor
set scrolloff=5     "start scrolling before hitting top/bottom
set showmatch       "show matching parens
set incsearch       "search chars as entered
set hlsearch        "highlight matches

set noswapfile		"no additional swapfiles
set colorcolumn=80  "highlight column 80 for long lines

colorscheme gruvbox
"set background=dark
"set term=xterm-256color
set t_ut=

"stuff I"m trying out
set completeopt=longest,menuone "autocomplete

"persistent undo
set undodir=$HOME/.vim/undo	"where to save undo histories
set undofile				"saves undos after file closes
set undolevels=1000			"How many undos
set undoreload=10000		"number of lines to save for undo
