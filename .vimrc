"recongnize .hbs files as html
au BufNewFile,BufRead,BufReadPost *.hbs setfiletype html

let mapleader = ","
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
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'neoclide/coc.nvim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'haya14busa/vim-asterisk'
Plugin 'mattn/emmet-vim'    
Plugin 'gregsexton/MatchTag'  
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate' "Auto completion for brackets,quotes,etc 
Plugin 'preservim/nerdtree' 
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line
map <F9> :NERDTreeToggle <CR>
set omnifunc=syntaxcomplete#Complete
"set mouse=a

" handling system copy/paste using xclip
"set clipboard=unnamedplus

vmap <silent><leader>y :'<,'>w !xclip -f -sel clip<CR>
map <silent><leader>p :-1r !xclip -o -sel clip<CR>

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
"NerdComment toggle
map <C-c> ,c<space>
nmap <C-s> :w<cr>
map <C-h> <C-w>h
map <c-l> <c-w>l
"tab switching
nnoremap <silent> <c-t> :tabnew<cr>
nnoremap <silent> <c-k> :tabn<cr>
nnoremap <silent> <c-j> :tabp<cr>
"new line under
nmap <c-n> o<esc>k
"search for selected text in v mode
map *   <Plug>(asterisk-*)
"switch to i-beam when in insertmode
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

" Spell Check
let b:myLang=0
let g:myLangList=["nospell","en_us"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap <silent> <F5> :call ToggleSpell()<CR>

" coc mappings
set signcolumn=number
command! -nargs=0 Format :call CocAction('format')

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

imap <C-j> <Plug>(coc-snippets-expand-jump)

map <leader>jg :CocAction<CR>

"command mappings  
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <leader>jc :make<Return>:copen<Return>
map <leader>jj :!clear && java  %:r<CR>
map <leader>ll :!ls<CR>
"Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
"themes and colorscheme:
"set t_Co=16
"set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
