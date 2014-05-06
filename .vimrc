" ===============================
" NeoBundle
" ===============================

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'unite.vim'
NeoBundle 'Shougo/unite-build'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'fugitive.vim'
NeoBundle 'a.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'jakedouglas/exuberant-ctags'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tomasr/molokai'
NeoBundle 'fatih/vim-go'

filetype plugin indent on

NeoBundleCheck

" ===============================
" edit
" ===============================
colorscheme molokai
syntax on

" statusline
set laststatus=2
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.(&bomb?':BOM':'')}%{']'}%y%{fugitive#statusline()}\ %F%=%l,%c%V%8P

" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set smartindent
set backspace=indent,eol,start
set modelines=0
" display
set number
set splitbelow
set splitright
set list
set listchars=tab:>-,trail:_
highlight SpecialKey ctermfg=white ctermbg=grey
set wildmode=list:longest
" file
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,cp932,euc-jp
" util setting
set nocompatible
set nowrap
set history=1000
set showmatch
set cursorline
set clipboard+=unnamed
set autoread
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END
"popup
set completeopt=menu
noremap o o<ESC>
noremap O O<ESC>
" xxd mode
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

set ignorecase
set smartcase
set wrapscan
set hlsearch
set noincsearch
set incsearch
" ,nhでhighlightを消す
nnoremap <silent> ,nh :let @/=''<CR>
" visual mode時の検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" ===============================
" omnifunc, fold
" ===============================
" python
autocmd FileType python setl omnifunc=pythoncomplete#Complete
autocmd FileType python setl foldmethod=indent
autocmd FileType python setl foldnestmax=2
" c,cpp
autocmd FileType python setl foldmethod=indent
" erlang
autocmd FileType erlang setl omnifunc=erlangcomplete#Complete
" javascript
autocmd FileType javascript call JavaScriptFold()
" coffeescript
autocmd BufRead, BufNewFile, BufReadPre *.coffee set filetype=coffee
" golang
" autocmd FileType go setl nolist



" ===============================
" vim-quickrun
" ===============================
nnoremap <silent> <C-p> :<C-u>QuickRun<CR>
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}

" ===============================
" neocomplcache
" ===============================
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" ===============================
" unite
" ===============================
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space> [unite]
"インサートモードで開始しない
let g:unite_enable_start_insert = 0
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
"bookmarkだけホームディレクトリに保存
let g:unite_source_bookmark_directory = $HOME . '/.unite/bookmark'
"バッファ一覧
nnoremap <silent> <C-t> :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]fm :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]bl :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]ba :<C-u>UniteBookmarkAdd<CR>

nnoremap <silent> [unite]ol :<C-u>Unite outline<CR>
nnoremap <silent> [unite]mk :<C-u>Unite build:!<CR>

"uniteを開いている間のキーマッピング
augroup vimrc
  autocmd FileType unite call s:unite_my_settings()
augroup END"
function! s:unite_my_settings()
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "sでsplit
  nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  "vでvsplit
  nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  "fでvimfiler
  nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  "eで編集
  nnoremap <silent><buffer><expr> e unite#smart_map('e', unite#do_action('open'))
  inoremap <silent><buffer><expr> e unite#smart_map('e', unite#do_action('open'))
endfunction

" ===============================
" VimFiler
" ===============================
"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> <C-f> :VimFiler<CR>
"現在開いているバッファのディレクトリを開く
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
"現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

"デフォルトのキーマッピングを変更
augroup vimrc
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> Q <Plug>(vimfiler_exit)
  nmap <buffer> q <Plug>(vimfiler_hide)
  nnoremap <silent> bl: <C-u>Unite bookmark<CR>
  nnoremap <silent> ba: <C-u>UniteBookmarkAdd<CR>
  call unite#custom_default_action(g:unite_source_bookmark_directory, 'vimfiler')
endfunction

" ===============================
" ctags
" ===============================
nnoremap <silent> <C-[> :pop<CR>

" ===============================
" vimshell
" ===============================
nnoremap <silent> sh :VimShellPop<CR>

" ===============================
" nerdcommneter
" ===============================
let NERDSpaceDelims = 1
nmap cc <Plug>NERDCommenterToggle
vmap cc <Plug>NERDCommenterToggle

" ===============================
" fugitive
" ===============================
nnoremap <silent> ,gst :Gstatus<CR>
nnoremap <silent> ,gdi :Gdiff<CR>

" ===============================
" vim-makegreen
" ===============================
"map <Leader>] <Plug>MakeGreen

" ===============================
" jscomplete
" ===============================
let g:jscomplete_use = ['dom', 'moz', 'es6th']

" ===============================
" vim-coffee-script
" ===============================
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

let g:go_snippet_engine = "neosnippet"
au FileType go nmap <Leader>i <Plug>(go-import)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" vim-go go_fmt_autosave not working...
au FileType go au BufWritePost *.go silent GoFmt
