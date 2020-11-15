"recongnize .hbs files as html
au BufNewFile,BufRead,BufReadPost *.hbs setfiletype html
set nocompatible              " be iMproved, required
filetype off                  " required
"light status bar configuration and timing
set timeoutlen=3000 ttimeoutlen=100
set updatetime=300
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ }
      \ }
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" let Vundle manage Vundle, required
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'neoclide/coc.nvim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'mattn/emmet-vim'    
Plugin 'gregsexton/MatchTag'  
"Auto completion for brackets,quotes,etc :
Plugin 'Raimondi/delimitMate' 
Plugin 'preservim/nerdtree' 
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" Put your non-Plugin stuff after this line
map <F9> :NERDTreeToggle <CR>
set omnifunc=syntaxcomplete#Complete
set mouse=a
":nmap ; :
" handling system copy/paste using xclip
vmap ,y :!xclip -f -sel clip<CR>
map ,p :-1r !xclip -o -sel clip<CR>

let mapleader = ","
filetype plugin on
set hlsearch
set incsearch
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set fileformat=unix
set encoding=utf-8
set number relativenumber
" auto complete ctrl+n:
set wildmode=longest,list,full
map <C-c> ,c<space>
nmap <C-s> :w<cr>
map <C-h> <C-w>h
map <c-l> <c-w>l
"tab switching
nnoremap <silent> <c-t> :tabnew<cr>
nnoremap <silent> <c-k> :tabn<cr>
nnoremap <silent> <c-j> :tabp<cr>
nmap <c-n> o<esc>k
if has("autocmd")
  au vimenter,insertleave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif    
" coc mappings
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif
"
"nnoremap <silent><nowait> <c-a>  :CocAction<CR>

map <leader>jc :!javac %<CR>  
map <leader>jj :!java %:r<CR>:!<CR>
map <leader>ll :!ls<CR>
"Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
"themes and colorscheme:
"set t_Co=16
"set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight"set termguicolors
