set nocompatible
set nobackup
set noswapfile
set spelllang=en_us

" view settings
syntax on
colorscheme dw_yellow
set background=dark
set t_Co=256
set encoding=utf-8
set showcmd
set showmatch
set number
set nowrap
set list
set listchars=tab:>>
nnoremap <Space>d :display<CR>

" caret controles
set whichwrap=b,s,h,l,<,>,[,] 
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
" move aliases
nnoremap j gj
nnoremap k gk
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
noremap  <Space>h ^
noremap  <Space>l $
noremap  <Space>m %
nnoremap <Space>/ *
nnoremap t2 :<C-u>setl shiftwidth=2 softtabstop=2<CR>
nnoremap t4 :<C-u>setl shiftwidth=4 softtabstop=4<CR>
nnoremap t8 :<C-u>setl shiftwidth=8 softtabstop=8<CR>
nnoremap <Space>v :vs<CR><c-w>l
nnoremap <Space>s :sp<CR>
nnoremap <Space><Space> <c-w>=
nnoremap te :tabe<CR>

" invalidate Q,ZZ and ZQ
nnoremap Q  <Nop>
nnoremap ZQ <Nop>
nnoremap ZZ <Nop>

" NeoBundle plugin manager
if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))            
NeoBundle 'Shougo/vinarise'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'dag/vim2hs'
let g:haskell_conceal = 0 " disable interfering character replacement
NeoBundle 'taglist.vim'
NeoBundle 'FuzzyFinder'
NeoBundle 'L9'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'dart-lang/dart-vim-plugin'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'pbrisbin/html-template-syntax'
NeoBundle 'vim-scripts/TwitVim'
let g:neocomplcache_enable_at_startup = 1 " enable with vim startup
filetype plugin indent on " auto detect plugin and indent by filetype
" Unite
nnoremap <silent> <Space>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <Space>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Space>um :<C-u>Unite file_mru<CR>
nnoremap <silent> <Space>uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> <Space>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" QuickRun
nnoremap <silent> QR :QuickRun<CR>
" Vimshell
nnoremap <silent> <Space>vs :VimShell<CR>
nnoremap <silent> <Space>h :VimShellInteractive ghci<CR>
vmap     <silent> <Space>ss :VimShellSendString<CR>
" TwitVim
let twitvim_count = 40
nnoremap tp :<C-u>PosttoTwitter<CR>
nnoremap tf :<C-u>FriendsTwitter<CR><C-w>k:<C-u>set wrap<CR>
nnoremap tm :<C-u>MentionsTwitter<CR><C-w>k:<C-u>set wrap<CR>
nnoremap tu :<C-u>UserTwitter<CR><CR><C-w>k:<C-u>set wrap<CR>
nnoremap tr :<C-u>RepliesTwitter<CR><CR><C-w>k:<C-u>set wrap<CR>
nnoremap <Leader><Leader> :<C-u>RefreshTwitter<CR>

" set indent by filetype 
autocmd FileType c set cindent
autocmd FileType make set noexpandtab
