" Vundle init

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'benjaminwhite/Benokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'marijnh/tern_for_vim'
Plugin 'rking/ag.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'kchmck/vim-coffee-script'

" snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-obsession'

call vundle#end()
filetype plugin indent on "enable filetype detection
" Vundle end

set background=dark
"colorscheme solarized
colorscheme Benokai
"let g:solarized_termcolors = 256

syntax enable " enable syntax highlighting
set showmode  " shows the current mode
set backspace=indent,eol,start "backspaces behave like backspaces
set ruler "show cursor position in the corner
set rnu "show line numbers
set hlsearch "highlight search matches
set incsearch "highlight search matches as I type
set laststatus=2 "always show a status line at the bottom
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
set backupdir=~/.vim/backup
set wrap  "linewraps
set scrolloff=3 "always show some lines before/after the cursor
set title "update term title
set expandtab "expand tabs to spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set cursorline "highlight cursor line
set ignorecase "case-insensitive searching
set visualbell "turn off audio beeps
set list listchars=tab:»·,trail:· " show extra space characters
hi CursorLine cterm=NONE ctermbg=black

" Enable omni completion (<C-X><C-O> when in Insert mode)
set omnifunc=syntaxcomplete#Complete

" Autocomplete behavior - complete as you type, use Enter to select
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

autocmd InsertEnter * :set nornu
autocmd InsertEnter * :set number
autocmd InsertLeave * :set rnu

:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=darkgray ctermfg=white
endif

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" set leader key to comma
let mapleader = ","

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_cmd = 'CtrlP'

" map git commands
map <leader>b :Gblame<cr>
map <leader>l :!clear && git log -p %<cr>
map <leader>d :!clear && git diff %<cr>

" rename current file, via Gary Bernhardt
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" go to definition
map <Leader>g :TernDef<CR>

" double j to escape!
imap jj <Esc>

" insert new line on double enter
nmap <CR><CR> o<Esc>

" create a new dir and file with E command
command -nargs=1 E execute 'silent! !mkdir -p "$(dirname "<args>")"' <Bar> e <args>

" Allow project specific vimrc
set exrc
set secure


