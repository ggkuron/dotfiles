set nocompatible
set nobackup
set noswapfile
"set spelllang=en_us
set clipboard=autoselect,unnamed
set visualbell t_vb=

" view settings
syntax on
" colorscheme dw_yellow
set background=dark
set t_Co=256
set encoding=utf-8
set showcmd
set showmatch
set number
set nowrap
set nofoldenable
set list
set listchars=tab:>>
set laststatus=2 " always displays the status line
set hlsearch
set statusline="col:\ %c"
nnoremap <Space>d :display<CR>

" caret controles
set whichwrap=b,s,h,l,<,>,[,] 
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set ambiwidth=double
" move aliases
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap j gj
nnoremap k gk
noremap  <Space>h ^
noremap  <Space>l $
noremap  <Space>m %
nnoremap <Space>/ *
nnoremap t0 :<C-u>setl expandtab<CR>
nnoremap t1 :<C-u>setl noexpandtab<CR>
nnoremap t2 :<C-u>setl shiftwidth=2 softtabstop=2<CR>
nnoremap t4 :<C-u>setl shiftwidth=4 softtabstop=4<CR>
nnoremap t8 :<C-u>setl shiftwidth=8 softtabstop=8<CR>
" splitright only when opening empty new
nnoremap <Space>v :vnew<CR><C-w>Li
nnoremap <Space>s :new<CR>i
nnoremap <Space><Space> <C-w>=
nnoremap tn :tabe<CR>
nnoremap <C-n> gt
nnoremap <C-p> gT

" invalidate Q,ZZ and ZQ
nnoremap Q  <Nop>
nnoremap ZQ <Nop>
nnoremap ZZ <Nop>
" kill wa! command
cmap wa  <Nop>
cmap wa! <Nop>
" sudo write
cmap w!! w !sudo tee % > /dev/null
" expand active directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

set runtimepath+=~/.vim/bundle/dein/repos/github.com/Shougo/dein.vim


" dein plugin manager
if dein#load_state('~/.vim/bundle/dein')
    call dein#begin('~/.vim/bundle/dein')

    if has('persistent_undo')
        set undodir=~/.vim/undo
        set undofile
    endif

    call dein#add('morhetz/gruvbox')
    call dein#add('Shougo/vinarise')
    " NeoBundle 'Shougo/neocomplete'
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/vimfiler')
    call dein#add('thinca/vim-quickrun')
    call dein#add('Shougo/vimshell')
    call dein#add('Shougo/vimproc')
    call dein#add('eagletmt/ghcmod-vim')
    call dein#add('ujihisa/neco-ghc')
    call dein#add('dag/vim2hs')
    call dein#add('morhetz/gruvbox')
    call dein#add('scrooloose/nerdtree')
    " NeoBundle 'taglist.vim'
    call dein#add('vim-scripts/FuzzyFinder')
    call dein#add('vim-scripts/L9')
    call dein#add('kchmck/vim-coffee-script')
    call dein#add('dart-lang/dart-vim-plugin')
    call dein#add('pbrisbin/html-template-syntax')
    call dein#add('vim-scripts/TwitVim')
    call dein#add('tpope/vim-markdown')
    call dein#add('vim-scripts/SyntaxRange')
    call dein#add('tpope/vim-fugitive')
    call dein#add('morhetz/gruvbox')
    call dein#add('xolox/vim-session')
    call dein#add('xolox/vim-misc')
    call dein#add('PProvost/vim-ps1')
    " NeoBundle 'tsukkee/lingr-vim'

" gvim plugin
    call dein#add('thinca/vim-fontzoom')
    call dein#end()
    call dein#save_state()
endif

colorscheme gruvbox

"let g:haskell_conceal = 0 " disable interfering character replacement
let g:haskell_conceal_enumerations = 0
let g:session_autosave = 'no'
let g:session_autoload = 'yes'

filetype plugin indent on " auto detect plugin and indent by filetype
" neocomplete
let g:neocomplete#enable_at_startup = 0 " enable neocomplete
" let g:neocomplete#enable_smart_case = 1 
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><C-y>  neocomplete#close_popup()
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
nnoremap <silent> <Space>gh :VimShellInteractive ghci<CR>
vmap     <silent> <Space>ss :VimShellSendString<CR>
" TwitVim
let twitvim_browser_cmd = 'firefox'
let twitvim_count = 40

nnoremap tp :<C-u>PosttoTwitter<CR>
nnoremap tf :<C-u>FriendsTwitter<CR><C-w>k:<C-u>set wrap<CR>
nnoremap tm :<C-u>MentionsTwitter<CR><C-w>k:<C-u>set wrap<CR>
nnoremap tu :<C-u>UserTwitter<CR><CR><C-w>k:<C-u>set wrap<CR>
nnoremap tr :<C-u>RepliesTwitter<CR><CR><C-w>k:<C-u>set wrap<CR>
nnoremap <Leader><Leader> :<C-u>RefreshTwitter<CR>
" gitv
autocmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
  " ここに設定を書く
    " s:my_gitv_settings 内
    setlocal iskeyword+=/,-,.
    nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
    " s:my_gitv_settings 内
    nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
    nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
    nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
    nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
    " s:my_gitv_settings 内
    nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
endfunction
function! s:gitv_get_current_hash()
  return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction
autocmd FileType git setlocal nofoldenable foldlevel=0
function! s:toggle_git_folding()
  if &filetype ==# 'git'
    setlocal foldenable!
  endif
endfunction
" filetype settings
autocmd FileType haskell set omnifunc=necoghc#omnifunc
autocmd FileType c set cindent
autocmd FileType make set noexpandtab
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.fs,*.fsi,*.fsx set filetype=fsharp
autocmd BufNewFile,BufRead *.scala set filetype=scala
autocmd FileType scala set shiftwidth=2 softtabstop=2
autocmd FileType ruby set shiftwidth=2 softtabstop=2
