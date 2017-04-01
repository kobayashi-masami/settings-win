" http://qiita.com/ahiruman5/items/4f3c845500c172a02935
set encoding=cp932
scriptencoding cp932
" ª1s–Ú‚Í“Ç‚İ‚İ‚Ì•¶šƒR[ƒh‚Ìİ’è
" ª2s–Ú‚ÍVim Script“à‚Åƒ}ƒ‹ƒ`ƒoƒCƒg‚ğg‚¤ê‡‚Ìİ’è
" Vim scritpt‚Évimrc‚àŠÜ‚Ü‚ê‚é‚Ì‚ÅA“ú–{Œê‚ÅƒRƒƒ“ƒg‚ğ‘‚­ê‡‚Íæ“ª‚É‚±‚Ìİ’è‚ª•K—v‚É‚È‚é

set guioptions-=T

" dein‚Ìİ’è"{{{

augroup DEIN_HOOK
augroup END

" ƒvƒ‰ƒOƒCƒ“‚ªÀÛ‚ÉƒCƒ“ƒXƒg[ƒ‹‚³‚ê‚éƒfƒBƒŒƒNƒgƒŠ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim –{‘Ì
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim ‚ª‚È‚¯‚ê‚Î github ‚©‚ç—‚Æ‚µ‚Ä‚­‚é
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
"  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
  let &runtimepath = s:dein_repo_dir .",". &runtimepath
endif

" İ’èŠJn
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " ƒvƒ‰ƒOƒCƒ“ƒŠƒXƒg‚ğû‚ß‚½ TOML ƒtƒ@ƒCƒ‹
  " —\‚ß TOML ƒtƒ@ƒCƒ‹iŒãqj‚ğ—pˆÓ‚µ‚Ä‚¨‚­
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML ‚ğ“Ç‚İ‚İAƒLƒƒƒbƒVƒ…‚µ‚Ä‚¨‚­
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " İ’èI—¹
  call dein#end()
  call dein#save_state()
endif

" ‚à‚µA–¢ƒCƒ“ƒXƒg[ƒ‹‚à‚Ì‚à‚Ì‚ª‚ ‚Á‚½‚çƒCƒ“ƒXƒg[ƒ‹
if dein#check_install()
  call dein#install()
endif
"}}}

" •¶š"{{{

set fileencoding=cp932                                                                            " •Û‘¶‚Ì•¶šƒR[ƒh
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,utf-8,euc-jp,sjis,cp932 " “Ç‚İ‚İ‚Ì•¶šƒR[ƒh‚Ì©“®”»•Ê. ¶‘¤‚ª—Dæ‚³‚ê‚é
set fileformats=dos,unix,mac                                                                      " ‰üsƒR[ƒh‚Ì©“®”»•Ê. ¶‘¤‚ª—Dæ‚³‚ê‚é
set ambiwidth=double                                                                              "  ‚â›•¶š‚ª•ö‚ê‚é–â‘è‚ğ‰ğŒˆ
set gfn=MS_Gothic:h11:cDEFAULT
"}}}

" ƒRƒ}ƒ“ƒhƒ‚[ƒh"{{{

set wildmenu     " ƒRƒ}ƒ“ƒhƒ‚[ƒh‚Ì•âŠ®
set history=5000 " •Û‘¶‚·‚éƒRƒ}ƒ“ƒh—š—ğ‚Ì”
"}}}

" ƒ^ƒuEƒCƒ“ƒfƒ“ƒg"{{{

set expandtab     " ƒ^ƒu“ü—Í‚ğ•¡”‚Ì‹ó”’“ü—Í‚É’u‚«Š·‚¦‚é
set tabstop=2     " ‰æ–Êã‚Åƒ^ƒu•¶š‚ªè‚ß‚é•
set softtabstop=2 " ˜A‘±‚µ‚½‹ó”’‚É‘Î‚µ‚Äƒ^ƒuƒL[‚âƒoƒbƒNƒXƒy[ƒXƒL[‚ÅƒJ[ƒ\ƒ‹‚ª“®‚­•
set autoindent    " ‰üs‚É‘O‚Ìs‚ÌƒCƒ“ƒfƒ“ƒg‚ğŒp‘±‚·‚é
set smartindent   " ‰üs‚É‘O‚Ìs‚Ì\•¶‚ğƒ`ƒFƒbƒN‚µŸ‚Ìs‚ÌƒCƒ“ƒfƒ“ƒg‚ğ‘Œ¸‚·‚é
set shiftwidth=2  " smartindent‚Å‘Œ¸‚·‚é•
set breakindent   " ƒCƒ“ƒfƒ“ƒg‚ğ•t‚¯‚ÄÜ‚è•Ô‚µ
"}}}

" •¶š—ñŒŸõ"{{{

set incsearch  " ƒCƒ“ƒNƒŠƒƒ“ƒ^ƒ‹ƒT[ƒ`. ‚P•¶š“ü—Í–ˆ‚ÉŒŸõ‚ğs‚¤
set ignorecase " ŒŸõƒpƒ^[ƒ“‚É‘å•¶š¬•¶š‚ğ‹æ•Ê‚µ‚È‚¢
set smartcase  " ŒŸõƒpƒ^[ƒ“‚É‘å•¶š‚ğŠÜ‚ñ‚Å‚¢‚½‚ç‘å•¶š¬•¶š‚ğ‹æ•Ê‚·‚é
set hlsearch   " ŒŸõŒ‹‰Ê‚ğƒnƒCƒ‰ƒCƒg

" ESCƒL[2“x‰Ÿ‚µ‚ÅƒnƒCƒ‰ƒCƒg‚ÌØ‚è‘Ö‚¦
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
"}}}

" ƒJ[ƒ\ƒ‹"{{{

set whichwrap=b,s,h,l,<,>,[,],~ " ƒJ[ƒ\ƒ‹‚Ì¶‰EˆÚ“®‚Ås––‚©‚çŸ‚Ìs‚Ìs“ª‚Ö‚ÌˆÚ“®‚ª‰Â”\‚É‚È‚é
set number                      " s”Ô†‚ğ•\¦
set cursorline                  " ƒJ[ƒ\ƒ‹ƒ‰ƒCƒ“‚ğƒnƒCƒ‰ƒCƒg

" s‚ªÜ‚è•Ô‚µ•\¦‚³‚ê‚Ä‚¢‚½ê‡As’PˆÊ‚Å‚Í‚È‚­•\¦s’PˆÊ‚ÅƒJ[ƒ\ƒ‹‚ğˆÚ“®‚·‚é
nnoremap  j      gj
nnoremap  k      gk
nnoremap  <down> gj
nnoremap  <up>   gk

" s‚ªÜ‚è•Ô‚µ•\¦‚³‚ê‚Ä‚¢‚½ê‡As’PˆÊ‚ÅˆÚ“®‚³‚¹‚é‘ã‘ÖƒL[
nnoremap  <C-J>  j
nnoremap  <C-K>  k

" ‘}“üƒ‚[ƒh‚Å‚ÌƒJ[ƒ\ƒ‹ˆÚ“®
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ƒoƒbƒNƒXƒy[ƒXƒL[‚Ì—LŒø‰»
set backspace=indent,eol,start
"}}}

" ƒJƒbƒREƒ^ƒO‚Ì‘Î‰"{{{

set    showmatch                      " Š‡ŒÊ‚Ì‘Î‰ŠÖŒW‚ğˆêu•\¦‚·‚é
source $VIMRUNTIME/macros/matchit.vim " Vim‚Ìu%v‚ğŠg’£‚·‚é

" Š‡ŒÊ‚Ì©“®“ü—Íİ’è
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap "" ""
inoremap ' ''<Left>
inoremap < <><Left>
"}}}

" ƒ}ƒEƒX‚ÅƒJ[ƒ\ƒ‹ˆÚ“®‚ÆƒXƒNƒ[ƒ‹"{{{

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

" ƒNƒŠƒbƒvƒ{[ƒh‚©‚ç‚Ìƒy[ƒXƒg"{{{

" ‘}“üƒ‚[ƒh‚ÅƒNƒŠƒbƒvƒ{[ƒh‚©‚çƒy[ƒXƒg‚·‚é‚É©“®‚ÅƒCƒ“ƒfƒ“ƒg‚³‚¹‚È‚¢‚æ‚¤‚É‚·‚é
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

" ƒGƒNƒXƒvƒ[ƒ‰"{{{

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

" vim/gvim‚Å“ú–{Œê‚ğg‚¢‚â‚·‚­‚·‚é"{{{
" ˆø—pFhttps://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese

"“ú–{Œê‚Ìs‚Ì˜AŒ‹‚É‚Í‹ó”’‚ğ“ü—Í‚µ‚È‚¢B
set formatoptions+=mM

"‰æ–ÊÅŒã‚Ìs‚ğ‚Å‚«‚éŒÀ‚è•\¦‚·‚éB
set display +=lastline
"}}}

" vim/gvim‚Å“ú–{Œê‚ğg‚¢‚â‚·‚­‚·‚éiIMEj""{{{
" ˆø—pFhttp://qiita.com/mwmsnn/items/0b40662a22162907efae

" ‘}“üƒ‚[ƒh‚É“ü‚éC‘O‰ñ‚Ì‘}“üƒ‚[ƒh‚É‚¨‚¯‚é IME ‚Ìó‘Ô‚ğ•œŒ³‚·‚éD
set t_SI+=[<r
" ‘}“üƒ‚[ƒh‚ğo‚éCŒ»İ‚Ì IME ‚Ìó‘Ô‚ğ•Û‘¶‚µCIME ‚ğƒIƒt‚É‚·‚éD
set t_EI+=[<s[<0t
" Vim I—¹CIME ‚ğ–³Œø‚É‚µC–³Œø‚É‚µ‚½ó‘Ô‚ğ•Û‘¶‚·‚éD
set t_te+=[<0t[<s
" ESC ƒL[‚ğ‰Ÿ‚µ‚Ä‚©‚ç‘}“üƒ‚[ƒh‚ğo‚é‚Ü‚Å‚ÌŠÔ‚ğ’Z‚­‚·‚é
set ttimeoutlen=100
"}}}

" ƒtƒ@ƒCƒ‹–¼©“®İ’è"{{{

nmap <F12> :w ~\Desktop\<C-R>=strftime("%Y%m%d%H%M%S")<CR>memo.txt<CR>
"}}}

" vimgrep—p‚Ìquickfixİ’è"{{{

noremap <A-j>    :cn<CR>
noremap <A-k>    :cp<CR>

set efm=%f\|%l\ col\ %c\|%m
"}}}


set fdm=marker

set list
"list‚Å•\¦‚³‚ê‚é•¶š‚ÌƒtƒH[ƒ}ƒbƒg‚ğw’è‚·‚é
set listchars=eol:$,tab:>\ ,extends:<

"•ÏX’†‚Ìƒtƒ@ƒCƒ‹‚Å‚àA•Û‘¶‚µ‚È‚¢‚Å‘¼‚Ìƒtƒ@ƒCƒ‹‚ğ•\¦
set hidden

"ƒEƒBƒ“ƒhƒE‚ğÅ‘å‰»‚µ‚Ä‹N“®
au GUIEnter * simalt ~x


let mapleader = "\<Space>"

nmap <Leader>w :w<CR>

" unite.vim‚Ìİ’è"{{{

" “ü—Íƒ‚[ƒh‚ÅŠJn‚·‚é
let g:unite_enable_start_insert=1

let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200

nnoremap  [unite]   <Nop>
nmap      <Leader>u [unite]

" ƒoƒbƒtƒ@ˆê——
nnoremap  <silent>  [unite]b :<C-u>Unite -buffer-name=buffer buffer<CR>
" ƒtƒ@ƒCƒ‹ˆê——
nnoremap  <silent>  [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ƒŒƒWƒXƒ^ˆê——
nnoremap  <silent>  [unite]r :<C-u>Unite -buffer-name=register register<CR>
" Å‹ßg—p‚µ‚½ƒtƒ@ƒCƒ‹ˆê——
nnoremap  <silent>  [unite]m :<C-u>Unite file_mru<CR>
" í—pƒZƒbƒg
nnoremap  <silent>  [unite]u :<C-u>Unite buffer file_mru<CR>
" ‘S•”æ‚¹
nnoremap  <silent>  [unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ƒEƒBƒ“ƒhƒE‚ğ•ªŠ„‚µ‚ÄŠJ‚­
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ƒEƒBƒ“ƒhƒE‚ğc‚É•ªŠ„‚µ‚ÄŠJ‚­
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCƒL[‚ğ2‰ñ‰Ÿ‚·‚ÆI—¹‚·‚é
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"}}}

"jqiJSONƒp[ƒT[j‚Ìİ’è"{{{
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

" ƒm[ƒ}ƒ‹ƒ‚[ƒh‚Ì 'cc' ‚ÉŠ„‚è“–‚Ä‚é
nmap cc <Plug>(ToggleColorColumn)

" vimƒGƒfƒBƒ^‚Ìˆóü‹@”\‚ğg—p‚·‚é"{{{
" ˆø—pFhttp://nanasi.jp/articles/howto/hardcopy/hardcopy.html

" ˆóüƒ_ƒCƒAƒƒO‚ğ•\¦‚·‚é
" :hardcopy
" ˆóüƒ_ƒCƒAƒƒO‚ğ•\¦‚µ‚È‚¢‚Åˆóü
" :hardcopy!
" 20s–Ú‚©‚ç50s–Ú‚ğˆóü‚·‚é
" :20,50hardcopy

set printheader=
set printoptions=

"---------------------------------------------------------------------------
" ˆóü‚ÌƒtƒHƒ“ƒg
"---------------------------------------------------------------------------
" ˆóü‚Åg—p‚·‚éƒtƒHƒ“ƒg
let &printfont=&guifont
"set printfont=MS_Mincho:h12

" postscript printer
if has('postscript')
    if has('win32')                          " Windows
    elseif has('mac')                        " Mac OSX
        set printencoding=euc-jp
        set printmbcharset=JIS_X_1990

        set printmbfont=

        " •’Ê•¶š‚ÌƒtƒHƒ“ƒg
        set printmbfont+=r:Osaka-Mono
        " ‘¾š (bold) ‚ÌƒtƒHƒ“ƒg
        set printmbfont+=,b:Osaka-Mono
        " Î‘Ì•¶š (italic) ‚ÌƒtƒHƒ“ƒgB–¢İ’è‚Írƒtƒ‰ƒO‚ğg—p‚·‚éB
        set printmbfont+=,r:Osaka-Mono
        " ‘¾šÎ‘Ì•¶š (bold-italic) ‚ÌƒtƒHƒ“ƒgB–¢İ’è‚Íbƒtƒ‰ƒO‚ğg—p‚·‚éB
        set printmbfont+=,b:Osaka-Mono

        set printmbfont+=,c:yes              " ASCII •¶š‚ğ Courier ƒtƒHƒ“ƒg‚Åo—Í
        "set printmbfont+=,c:no              " ƒfƒtƒHƒ‹ƒg
        set printmbfont+=,a:yes              " ASCIIƒR[ƒh‚Ì”ÍˆÍ‚ğ ASCII •¶šƒZƒbƒg‚Åo—Í
        "set printmbfont+=,a:no              " ƒfƒtƒHƒ‹ƒg

    else                                     " ‚»‚Ì‘¼‚ÌŠÂ‹«
    endif
endif

"---------------------------------------------------------------------------
" ƒwƒbƒ_[
"---------------------------------------------------------------------------
"set printoptions+=header:0  " ƒwƒbƒ_[‚ğˆóü‚µ‚È‚¢
"set printoptions+=header:1  " ƒwƒbƒ_[A–{•¶ŠÔ‚ÉƒXƒy[ƒX‚ğ‹ó‚¯‚È‚¢
set printoptions+=header:2   " ƒwƒbƒ_[A–{•¶ŠÔ‚É1s“ü‚ê‚é

"set printheader=-%N-                                     " -ƒy[ƒW-
"set printheader=%t                                       " ƒtƒ@ƒCƒ‹–¼
"set printheader=%F                                       " ƒtƒ@ƒCƒ‹–¼iƒpƒXŠÜ‚Şj
set printheader=%t\ -%N-                                  " ƒtƒ@ƒCƒ‹–¼ -ƒy[ƒW-
"set printheader=%{strftime('%Y/%m/%d\ %H:%M')}           " ÅIˆóü“ú
"set printheader=R“c\ ‘¾˜Y                               " ÅI•Û‘¶ÒAì¬Ò
"set printheader=R“c\ ‘¾˜Y\ %N\ %{strftime('%Y/%m/%d')}  " ì¬Ò ƒy[ƒW “ú•t
"set printheader=ĞŠO”é\ %N\ %{strftime('%Y/%m/%d')}      " ĞŠO”é ƒy[ƒW “ú•t

" ƒwƒbƒ_[‚ÌˆÊ’u
let &printheader = &printheader . "%="   " ¶Šñ‚¹
"let &printheader = "%=" . &printheader  " ‰EŠñ‚¹

"---------------------------------------------------------------------------
" ˆóüİ’è
"---------------------------------------------------------------------------
"
" —]”’ƒXƒy[ƒX
" [left ¶]  [right ‰E]  [top ã]  [bottom ‰º]
" [in ƒCƒ“ƒ`]  [pt 1/72ƒCƒ“ƒ`]  [mm ƒ~ƒŠƒ[ƒgƒ‹]  [pc —p†ƒTƒCƒY‚É‘Î‚·‚éŠ„‡]
" set printoptions+=left:10pc,right:5pc,top:5pc,bottom:5pc
"set printoptions+=left:3pc,right:3pc,top:3pc,bottom:3pc
set printoptions+=left:1pc,right:3pc,top:3pc,bottom:3pc

" –{•¶‚ÌÜ‚è•Ô‚µ
if &wrap                       " wrap‚Ìİ’è‚É‰ï‚í‚¹‚é
    set printoptions+=wrap:y
else
    set printoptions+=wrap:n
endif
"set printoptions+=wrap:y      " ‰E’[‚ÅÜ‚è•Ô‚·
"set printoptions+=wrap:n      " Ü‚è•Ô‚³‚È‚¢

" s”Ô†
if &number                     " number‚Ìİ’è‚É‰ï‚í‚¹‚é
    set printoptions+=number:y
    let &printheader = "   " . &printheader
else
    set printoptions+=number:n
endif
"set printoptions+=number:y    " s”Ô†•t‚«‚Åˆóü
"set printoptions+=number:n    " s”Ô†‚ğ•t‚¯‚È‚¢

" SyntaxƒnƒCƒ‰ƒCƒg
"set printoptions+=syntax:y    " SyntaxƒnƒCƒ‰ƒCƒg—LŒø‚Åˆóü
set printoptions+=syntax:n    " SyntaxƒnƒCƒ‰ƒCƒg–³Œø‚Åˆóü
"set printoptions+=syntax:a     " ƒJƒ‰[ˆóü‰Â”\‚È‚çSyntaxƒnƒCƒ‰ƒCƒg—LŒø

" ‰üƒy[ƒW•¶š
set printoptions+=formfeed:y   " ‰üƒy[ƒW•¶š‚ÅA‰üƒy[ƒW‚·‚é
"set printoptions+=formfeed:n  " ‰üƒy[ƒW•¶š‚ğˆóü‚·‚éB‰üƒy[ƒW•¶š‚ª‚ ‚Á‚Ä‚à‰üƒy[ƒW‚µ‚È‚¢B


"---------------------------------------------------------------------------
" ƒvƒŠƒ“ƒ^İ’è
"---------------------------------------------------------------------------
" †‚ÌŒü‚«
set printoptions+=portrait:y   " c•ûŒü‚Éˆóü
"set printoptions+=portrait:n  " ‰¡Œü‚«‚Éˆóü

" —p†ƒTƒCƒY
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

" ˆóü‚Ì•û–@
set printoptions+=duplex:off     " •Ğ–Êˆóü
"set printoptions+=duplex:long   " —¼–ÊˆóüB’Ô‚¶•ûŒücB’·‚¢•Ó‚Å•Â‚¶‚éB
"set printoptions+=duplex:short  " —¼–ÊˆóüB’Ô‚¶•ûŒü‰¡B’Z‚¢•Ó‚Å•Â‚¶‚éB

" ˆóü’PˆÊ
set printoptions+=collate:y      " •”’PˆÊ‚Åˆóüi1,2,3,4,1,2,3,4,1,2,3,4j
"set printoptions+=collate:n     " ƒy[ƒW’PˆÊ‚Åˆóüi1,1,1,1,2,2,2,2,3,3,3,4,4,4,4j

" ˆóüƒWƒ‡ƒu
"set printoptions+=jobsplit:y    " ˆóüƒWƒ‡ƒu‚ğ•ª‚¯‚é
set printoptions+=jobsplit:n     " ˆóüƒWƒ‡ƒu‚ğ•ª‚¯‚È‚¢

" ˆóü‚Åg—p‚·‚éƒvƒŠƒ“ƒ^i‹ó‚ÍƒVƒXƒeƒ€•W€‚ÌƒvƒŠƒ“ƒ^j
set printdevice=
"set printdevice="CutePDF Writer"
"}}}

" ˆÈ‘O‚Ìİ’è"{{{

" set nocompatible

" "“ü—Íƒ‚[ƒhAƒXƒe[ƒ^ƒXƒ‰ƒCƒ“‚ÌƒJƒ‰[‚ğ•ÏX
" augroup InsertHook
"     autocmd!
"     autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"     autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
" augroup END

" "ƒtƒ@ƒCƒ‹ƒGƒ“ƒR[ƒfƒBƒ“ƒO‚â•¶šƒR[ƒh‚ğƒXƒe[ƒ^ƒXs‚É•\¦‚·‚é
" set laststatus=2
" set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 

" colorscheme desert

" -------------------------------------------------------------------------------
" •¶šƒR[ƒh‚Ì©“®”F¯
"if &encoding !=# 'utf-8'
"  setlocal encoding=japan
"  setlocal fileencoding=japan
"endif
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
"  " iconv‚ªeucJP-ms‚É‘Î‰‚µ‚Ä‚¢‚é‚©‚ğƒ`ƒFƒbƒN
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'eucjp-ms'
"    let s:enc_jis = 'iso-2022-jp-3'
"  " iconv‚ªJISX0213‚É‘Î‰‚µ‚Ä‚¢‚é‚©‚ğƒ`ƒFƒbƒN
"  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
"  " fileencodings‚ğ\’z
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
"  " ’è”‚ğˆ•ª
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif

" setlocal encoding=cp932
" setlocal fileencoding=cp932
"
" " -------------------------------------------------------------------------------
" " ‰üsƒR[ƒh‚Ì©“®”F¯
" set fileformats=dos,unix,mac

" "  ‚Æ‚©›‚Ì•¶š‚ª‚ ‚Á‚Ä‚àƒJ[ƒ\ƒ‹ˆÊ’u‚ª‚¸‚ê‚È‚¢‚æ‚¤‚É‚·‚é
" if exists('&ambiwidth')
"   set ambiwidth=double
" endif

" setlocal fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,utf-8,sjis,cp932

"set gfn=MS_Gothic:h9:cDEFAULT
"
" "ƒtƒ@ƒCƒ‹“à‚Ì <Tab> ‚ª‘Î‰‚·‚é‹ó”’‚Ì”
" set tabstop=2
" "ƒVƒtƒgˆÚ“®•
" set shiftwidth=2
" "ƒ^ƒu‚Ì‘ã‚í‚è‚É‹ó”’•¶š‚ğ‘}“ü‚·‚é
" set expandtab
" "V‚µ‚¢s‚ÌƒCƒ“ƒfƒ“ƒg‚ğŒ»İs‚Æ“¯‚¶‚É‚·‚é
" set autoindent
" "V‚µ‚¢s‚ğì‚Á‚½‚Æ‚«‚É‚“x‚È©“®ƒCƒ“ƒfƒ“ƒg‚ğs‚¤
" set smartindent
" "s“ª‚Ì—]”’“à‚Å Tab ‚ğ‘Å‚¿‚Ş‚ÆA'shiftwidth' ‚Ì”‚¾‚¯ƒCƒ“ƒfƒ“ƒg‚·‚éB
" set smarttab

" "ƒJ[ƒ\ƒ‹‚ğs“ªAs––‚Å~‚Ü‚ç‚È‚¢‚æ‚¤‚É‚·‚é
" set whichwrap=b,s,h,l,<,>,[,]
" "set whichwrap=b,s,<,>,[,]

" set number

" set ruler
" set showcmd
" "setlocal lines=60
" "setlocal columns=192

" "ŒŸõ‚É‘å•¶š‚ğŠÜ‚ñ‚Å‚¢‚½‚ç‘å/¬‚ğ‹æ•Ê
" set smartcase

" "ƒJ[ƒ\ƒ‹‚ğ•\¦s‚ÅˆÚ“®‚·‚éB•¨—sˆÚ“®‚Í<C-n>,<C-p>
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
"         syntax match InvisibleJISX0208Space "@" display containedin=ALL
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

" "ƒoƒCƒiƒŠƒ‚[ƒh
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

" " “ú–{Œê‚ğŠÜ‚Ü‚È‚¢ê‡‚Í fileencoding ‚É encoding ‚ğg‚¤‚æ‚¤‚É‚·‚é
" if has('autocmd')
"   function! AU_ReCheck_FENC()
"     if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"       let &fileencoding=&encoding
"     endif
"   endfunction
"   autocmd BufReadPost * call AU_ReCheck_FENC()
" endif

" " -------------------------------------------------------------------------------
" " Ruby —p‚Ìİ’è
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

