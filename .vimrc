set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))            

set nocompatible
set nobackup
set noswapfile
"view settings
set background=dark
set t_Co=256
set encoding=utf-8
set showcmd
set showmatch
set number
set nowrap
set list
set listchars=tab:>>
syntax on
colorscheme dw_yellow
"caret controles
set whichwrap=b,s,h,l,<,>,[,] 
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
"move aliases
nnoremap j gj
nnoremap k gk
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
noremap  <Space>h ^
noremap  <Space>l $
noremap  <Space>m %
nnoremap <Space>/ *
"invalidate Q and ZQ
nnoremap Q  <Nop>
nnoremap ZQ <Nop>

"NeoBundle plugin manager
NeoBundle 'Shougo/vinarise'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'dag/vim2hs'
let g:haskell_conceal = 0 "disable interfering character replacement
NeoBundle 'taglist.vim'
NeoBundle 'FuzzyFinder'
NeoBundle 'L9'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'dart-lang/dart-vim-plugin'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'pbrisbin/html-template-syntax'
NeoBundle 'vim-scripts/TwitVim'
let g:neocomplcache_enable_at_startup = 1 "enable with vim startup
"auto detect plugin and indent by filetype
filetype plugin indent on
"Unite
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"QuickRun
nnoremap <silent> QR :QuickRun<CR>
"Vimshell
nnoremap <silent> ,vs :VimShell<CR>
nnoremap <silent> ,h :VimShellInteractive ghci<CR>
vmap     <silent> ,ss :VimShellSendString<CR>
"TwitVim
let twitvim_count = 40
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR>
nnoremap ,tm :<C-u>MentionsTwitter<CR>
nnoremap ,tu :<C-u>UserTwitter<CR>
nnoremap ,tr :<C-u>RepliesTwitter<CR>
nnoremap <Leader><Leader> :<C-u>RefreshTwitter<CR>

"set indent by filetype 
autocmd FileType c set cindent
autocmd FileType make set noexpandtab
