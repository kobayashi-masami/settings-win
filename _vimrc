" http://qiita.com/ahiruman5/items/4f3c845500c172a02935
set encoding=cp932
scriptencoding cp932
" ↑1行目は読み込み時の文字コードの設定
" ↑2行目はVim Script内でマルチバイトを使う場合の設定
" Vim scritptにvimrcも含まれるので、日本語でコメントを書く場合は先頭にこの設定が必要になる

set guioptions-=T

" deinの設定"{{{

augroup DEIN_HOOK
augroup END

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
"  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
  let &runtimepath = s:dein_repo_dir .",". &runtimepath
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
"}}}

" 文字"{{{

set fileencoding=cp932                                                                            " 保存時の文字コード
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,utf-8,euc-jp,sjis,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=dos,unix,mac                                                                      " 改行コードの自動判別. 左側が優先される
set ambiwidth=double                                                                              " □や○文字が崩れる問題を解決
set gfn=MS_Gothic:h11:cDEFAULT
"}}}

" コマンドモード"{{{

set wildmenu     " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数
"}}}

" タブ・インデント"{{{

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2  " smartindentで増減する幅
set breakindent   " インデントを付けて折り返し
"}}}

" 文字列検索"{{{

set incsearch  " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase  " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch   " 検索結果をハイライト

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
"}}}

" カーソル"{{{

set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number                      " 行番号を表示
set cursorline                  " カーソルラインをハイライト

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap  j      gj
nnoremap  k      gk
nnoremap  <down> gj
nnoremap  <up>   gk

" 行が折り返し表示されていた場合、行単位で移動させる代替キー
nnoremap  <C-J>  j
nnoremap  <C-K>  k

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" バックスペースキーの有効化
set backspace=indent,eol,start
"}}}

" カッコ・タグの対応"{{{

set    showmatch                      " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

" 括弧の自動入力設定
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap "" ""
inoremap ' ''<Left>
inoremap < <><Left>
"}}}

" マウスでカーソル移動とスクロール"{{{

if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif
"}}}

" クリップボードからのペースト"{{{

" 挿入モードでクリップボードからペーストする時に自動でインデントさせないようにする
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
"}}}

" エクスプローラ"{{{

let g:explVertical      = 1
let g:explSplitRight    = 1
let g:explSplitBelow    = 1
let g:explStartRight    = 0
let g:explStartBelow    = 1
let g:explSortBy        = 'name'
let g:explDirsFirst     = 1
let g:explUseSeparators = 1
let g:explDateFormat    = "%Y %bb %d %H:%M"
"}}}

" vim/gvimで日本語を使いやすくする"{{{
" 引用：https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese

"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM

"画面最後の行をできる限り表示する。
set display +=lastline
"}}}

" vim/gvimで日本語を使いやすくする（IME）""{{{
" 引用：http://qiita.com/mwmsnn/items/0b40662a22162907efae

" 挿入モードに入る時，前回の挿入モードにおける IME の状態を復元する．
set t_SI+=[<r
" 挿入モードを出る時，現在の IME の状態を保存し，IME をオフにする．
set t_EI+=[<s[<0t
" Vim 終了時，IME を無効にし，無効にした状態を保存する．
set t_te+=[<0t[<s
" ESC キーを押してから挿入モードを出るまでの時間を短くする
set ttimeoutlen=100
"}}}

" ファイル名自動設定"{{{

nmap <F12> :w ~\Desktop\<C-R>=strftime("%Y%m%d%H%M%S")<CR>memo.txt<CR>
"}}}

" vimgrep用のquickfix設定"{{{

noremap <A-j>    :cn<CR>
noremap <A-k>    :cp<CR>

set efm=%f\|%l\ col\ %c\|%m
"}}}


set fdm=marker

set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"ウィンドウを最大化して起動
au GUIEnter * simalt ~x


let mapleader = "\<Space>"

nmap <Leader>w :w<CR>

" unite.vimの設定"{{{

" 入力モードで開始する
let g:unite_enable_start_insert=1

let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200

nnoremap  [unite]   <Nop>
nmap      <Leader>u [unite]

" バッファ一覧
nnoremap  <silent>  [unite]b :<C-u>Unite -buffer-name=buffer buffer<CR>
" ファイル一覧
nnoremap  <silent>  [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap  <silent>  [unite]r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap  <silent>  [unite]m :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap  <silent>  [unite]u :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap  <silent>  [unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"}}}

"jq（JSONパーサー）の設定"{{{
" http://qiita.com/tekkoc/items/324d736f68b0f27680b8
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction
"}}}

"---------------------------------------------------------------------------
au BufNewFile,BufRead *.bash   setf sh
au BufNewFile,BufRead _vimrc   setf vim
au BufNewFile,BufRead _viminfo setf viminfo

filetype on
filetype indent on
filetype plugin on

" ---------------------------------------------------------------------------

noremap <Plug>(ToggleColorColumn)
            \ :<c-u>let &colorcolumn = len(&colorcolumn) > 0 ? '' :
            \   join(range(71, 9999), ',')<CR>

" ノーマルモードの 'cc' に割り当てる
nmap cc <Plug>(ToggleColorColumn)

" vimエディタの印刷機能を使用する"{{{
" 引用：http://nanasi.jp/articles/howto/hardcopy/hardcopy.html

" 印刷ダイアログを表示する
" :hardcopy
" 印刷ダイアログを表示しないで印刷
" :hardcopy!
" 20行目から50行目を印刷する
" :20,50hardcopy

set printheader=
set printoptions=

"---------------------------------------------------------------------------
" 印刷のフォント
"---------------------------------------------------------------------------
" 印刷で使用するフォント
let &printfont=&guifont
"set printfont=MS_Mincho:h12

" postscript printer
if has('postscript')
    if has('win32')                          " Windows
    elseif has('mac')                        " Mac OSX
        set printencoding=euc-jp
        set printmbcharset=JIS_X_1990

        set printmbfont=

        " 普通文字のフォント
        set printmbfont+=r:Osaka-Mono
        " 太字 (bold) のフォント
        set printmbfont+=,b:Osaka-Mono
        " 斜体文字 (italic) のフォント。未設定時はrフラグを使用する。
        set printmbfont+=,r:Osaka-Mono
        " 太字斜体文字 (bold-italic) のフォント。未設定時はbフラグを使用する。
        set printmbfont+=,b:Osaka-Mono

        set printmbfont+=,c:yes              " ASCII 文字を Courier フォントで出力
        "set printmbfont+=,c:no              " デフォルト
        set printmbfont+=,a:yes              " ASCIIコードの範囲を ASCII 文字セットで出力
        "set printmbfont+=,a:no              " デフォルト

    else                                     " その他の環境
    endif
endif

"---------------------------------------------------------------------------
" ヘッダー
"---------------------------------------------------------------------------
"set printoptions+=header:0  " ヘッダーを印刷しない
"set printoptions+=header:1  " ヘッダー、本文間にスペースを空けない
set printoptions+=header:2   " ヘッダー、本文間に1行入れる

"set printheader=-%N-                                     " -ページ-
"set printheader=%t                                       " ファイル名
"set printheader=%F                                       " ファイル名（パス含む）
set printheader=%t\ -%N-                                  " ファイル名 -ページ-
"set printheader=%{strftime('%Y/%m/%d\ %H:%M')}           " 最終印刷日時
"set printheader=山田\ 太郎                               " 最終保存者、作成者
"set printheader=山田\ 太郎\ %N\ %{strftime('%Y/%m/%d')}  " 作成者 ページ 日付
"set printheader=社外秘\ %N\ %{strftime('%Y/%m/%d')}      " 社外秘 ページ 日付

" ヘッダーの位置
let &printheader = &printheader . "%="   " 左寄せ
"let &printheader = "%=" . &printheader  " 右寄せ

"---------------------------------------------------------------------------
" 印刷設定
"---------------------------------------------------------------------------
"
" 余白スペース
" [left 左]  [right 右]  [top 上]  [bottom 下]
" [in インチ]  [pt 1/72インチ]  [mm ミリメートル]  [pc 用紙サイズに対する割合]
" set printoptions+=left:10pc,right:5pc,top:5pc,bottom:5pc
"set printoptions+=left:3pc,right:3pc,top:3pc,bottom:3pc
set printoptions+=left:1pc,right:3pc,top:3pc,bottom:3pc

" 本文の折り返し
if &wrap                       " wrapの設定に会わせる
    set printoptions+=wrap:y
else
    set printoptions+=wrap:n
endif
"set printoptions+=wrap:y      " 右端で折り返す
"set printoptions+=wrap:n      " 折り返さない

" 行番号
if &number                     " numberの設定に会わせる
    set printoptions+=number:y
    let &printheader = "   " . &printheader
else
    set printoptions+=number:n
endif
"set printoptions+=number:y    " 行番号付きで印刷
"set printoptions+=number:n    " 行番号を付けない

" Syntaxハイライト
"set printoptions+=syntax:y    " Syntaxハイライト有効で印刷
set printoptions+=syntax:n    " Syntaxハイライト無効で印刷
"set printoptions+=syntax:a     " カラー印刷可能ならSyntaxハイライト有効

" 改ページ文字
set printoptions+=formfeed:y   " 改ページ文字で、改ページする
"set printoptions+=formfeed:n  " 改ページ文字を印刷する。改ページ文字があっても改ページしない。


"---------------------------------------------------------------------------
" プリンタ設定
"---------------------------------------------------------------------------
" 紙の向き
set printoptions+=portrait:y   " 縦方向に印刷
"set printoptions+=portrait:n  " 横向きに印刷

" 用紙サイズ
"set printoptions+=paper:10x14
"set printoptions+=paper:A3
set printoptions+=paper:A4
"set printoptions+=paper:A5
"set printoptions+=paper:B4
"set printoptions+=paper:B5
"set printoptions+=paper:executive
"set printoptions+=paper:folio
"set printoptions+=paper:ledger
"set printoptions+=paper:legal
"set printoptions+=paper:letter
"set printoptions+=paper:quarto
"set printoptions+=paper:statement
"set printoptions+=paper:tabloid

" 印刷の方法
set printoptions+=duplex:off     " 片面印刷
"set printoptions+=duplex:long   " 両面印刷。綴じ方向縦。長い辺で閉じる。
"set printoptions+=duplex:short  " 両面印刷。綴じ方向横。短い辺で閉じる。

" 印刷単位
set printoptions+=collate:y      " 部単位で印刷（1,2,3,4,1,2,3,4,1,2,3,4）
"set printoptions+=collate:n     " ページ単位で印刷（1,1,1,1,2,2,2,2,3,3,3,4,4,4,4）

" 印刷ジョブ
"set printoptions+=jobsplit:y    " 印刷ジョブを分ける
set printoptions+=jobsplit:n     " 印刷ジョブを分けない

" 印刷で使用するプリンタ（空はシステム標準のプリンタ）
set printdevice=
"set printdevice="CutePDF Writer"
"}}}

" 以前の設定"{{{

" set nocompatible

" "入力モード時、ステータスラインのカラーを変更
" augroup InsertHook
"     autocmd!
"     autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"     autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
" augroup END

" "ファイルエンコーディングや文字コードをステータス行に表示する
" set laststatus=2
" set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 

" colorscheme desert

" -------------------------------------------------------------------------------
" 文字コードの自動認識
"if &encoding !=# 'utf-8'
"  setlocal encoding=japan
"  setlocal fileencoding=japan
"endif
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
"  " iconvがeucJP-msに対応しているかをチェック
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'eucjp-ms'
"    let s:enc_jis = 'iso-2022-jp-3'
"  " iconvがJISX0213に対応しているかをチェック
"  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
"  " fileencodingsを構築
"  if &encoding ==# 'utf-8'
"    let s:fileencodings_default = &fileencodings
"    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"    let &fileencodings = &fileencodings .','. s:fileencodings_default
"    unlet s:fileencodings_default
"  else
"    let &fileencodings = &fileencodings .','. s:enc_jis
"    setlocal fileencodings+=utf-8,ucs-2le,ucs-2
"    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"      setlocal fileencodings+=cp932
"      setlocal fileencodings-=euc-jp
"      setlocal fileencodings-=euc-jisx0213
"      setlocal fileencodings-=eucjp-ms
"      let &encoding = s:enc_euc
"      let &fileencoding = s:enc_euc
"    else
"      let &fileencodings = &fileencodings .','. s:enc_euc
"    endif
"  endif
"  " 定数を処分
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif

" setlocal encoding=cp932
" setlocal fileencoding=cp932
"
" " -------------------------------------------------------------------------------
" " 改行コードの自動認識
" set fileformats=dos,unix,mac

" " □とか○の文字があってもカーソル位置がずれないようにする
" if exists('&ambiwidth')
"   set ambiwidth=double
" endif

" setlocal fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,utf-8,sjis,cp932

"set gfn=MS_Gothic:h9:cDEFAULT
"
" "ファイル内の <Tab> が対応する空白の数
" set tabstop=2
" "シフト移動幅
" set shiftwidth=2
" "タブの代わりに空白文字を挿入する
" set expandtab
" "新しい行のインデントを現在行と同じにする
" set autoindent
" "新しい行を作ったときに高度な自動インデントを行う
" set smartindent
" "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
" set smarttab

" "カーソルを行頭、行末で止まらないようにする
" set whichwrap=b,s,h,l,<,>,[,]
" "set whichwrap=b,s,<,>,[,]

" set number

" set ruler
" set showcmd
" "setlocal lines=60
" "setlocal columns=192

" "検索時に大文字を含んでいたら大/小を区別
" set smartcase

" "カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
" nnoremap j      gj
" nnoremap k      gk
" nnoremap <Down> gj
" nnoremap <Up>   gk
"
" nnoremap <C-J>  j
" nnoremap <C-K>  k

" if &t_Co > 2 || has("gui_running")
"     syntax on
"     set hlsearch
"     set cursorline
"     autocmd WinEnter * set cursorline
"     autocmd WinLeave * set nocursorline
" endif

" if has("syntax")
"     syntax on
"     function! ActivateInvisibleIndicator()
"         syntax match InvisibleJISX0208Space "　" display containedin=ALL
"         highlight InvisibleJISX0208Space term=underline ctermbg=Blue gui=underline guibg=#554455
"         "syntax match InvisibleTrailedSpace "[ \t]\+" display containedin=ALL
"         syntax match InvisibleTrailedSpace "[\t]\+" display containedin=ALL
"         highlight InvisibleTrailedSpace term=underline ctermbg=Blue guibg=#445555
"     endf
"     augroup invisible
"         autocmd! invisible
"         autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
"     augroup END
" endif

" "バイナリモード
" augroup BinaryXXD
"   autocmd!
"   autocmd BufReadPre  *.bin let &binary =1
"   autocmd BufReadPost * if &binary | silent %!xxd -g 1
"   autocmd BufReadPost * set ft=xxd | endif
"   autocmd BufWritePre * if &binary | %!xxd -r | endif
"   autocmd BufWritePost * if &binary | silent %!xxd -g 1
"   autocmd BufWritePost * set nomod | endif
" augroup END

"set spell spelllang=en_us

" " 日本語を含まない場合は fileencoding に encoding を使うようにする
" if has('autocmd')
"   function! AU_ReCheck_FENC()
"     if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"       let &fileencoding=&encoding
"     endif
"   endfunction
"   autocmd BufReadPost * call AU_ReCheck_FENC()
" endif

" " -------------------------------------------------------------------------------
" " Ruby 用の設定
"
" "let g:rsenseHome = 'D:/fhs/usr/local/bin/rsense-0.3'
" " let g:rsenseUseOmniFunc = 1
"
" imap <C-Space> <C-x><C-o>
" autocmd FileType ruby imap <C-Space> <C-x><C-u>
"
" "let g:acp_enableAtStartup = 0
" "let g:neocomplcache_enable_at_startup = 1
" " let g:neocomplcache_enable_smart_case = 1
" " let g:neocomplcache_enable_camel_case_completion = 1
" " let g:neocomplcache_enable_underbar_completion = 1
" " let g:neocomplcache_min_syntax_length = 3
"
" " Enable omni completion.
" " setlocal omnifunc=syntaxcomplete#Complete
" " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" " autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" "
" " autocmd FileType ruby setlocal completefunc=RSenseComplete
" " autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"
" " Enable heavy omni completion.
" " if !exists('g:neocomplcache_omni_patterns')
" "   let g:neocomplcache_omni_patterns = {}
" " endif
" " let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" " let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
" " let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" " let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" }}}

