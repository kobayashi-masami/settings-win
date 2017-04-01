" http://qiita.com/ahiruman5/items/4f3c845500c172a02935
set encoding=cp932
scriptencoding cp932
" ��1�s�ڂ͓ǂݍ��ݎ��̕����R�[�h�̐ݒ�
" ��2�s�ڂ�Vim Script���Ń}���`�o�C�g���g���ꍇ�̐ݒ�
" Vim scritpt��vimrc���܂܂��̂ŁA���{��ŃR�����g�������ꍇ�͐擪�ɂ��̐ݒ肪�K�v�ɂȂ�

set guioptions-=T

" dein�̐ݒ�"{{{

augroup DEIN_HOOK
augroup END

" �v���O�C�������ۂɃC���X�g�[�������f�B���N�g��
let s:dein_dir = expand('~/.cache/dein')
" dein.vim �{��
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim ���Ȃ���� github ���痎�Ƃ��Ă���
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
"  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
  let &runtimepath = s:dein_repo_dir .",". &runtimepath
endif

" �ݒ�J�n
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " �v���O�C�����X�g�����߂� TOML �t�@�C��
  " �\�� TOML �t�@�C���i��q�j��p�ӂ��Ă���
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML ��ǂݍ��݁A�L���b�V�����Ă���
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " �ݒ�I��
  call dein#end()
  call dein#save_state()
endif

" �����A���C���X�g�[�����̂��̂���������C���X�g�[��
if dein#check_install()
  call dein#install()
endif
"}}}

" ����"{{{

set fileencoding=cp932                                                                            " �ۑ����̕����R�[�h
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,utf-8,euc-jp,sjis,cp932 " �ǂݍ��ݎ��̕����R�[�h�̎�������. �������D�悳���
set fileformats=dos,unix,mac                                                                      " ���s�R�[�h�̎�������. �������D�悳���
set ambiwidth=double                                                                              " ���⁛������������������
set gfn=MS_Gothic:h11:cDEFAULT
"}}}

" �R�}���h���[�h"{{{

set wildmenu     " �R�}���h���[�h�̕⊮
set history=5000 " �ۑ�����R�}���h�����̐�
"}}}

" �^�u�E�C���f���g"{{{

set expandtab     " �^�u���͂𕡐��̋󔒓��͂ɒu��������
set tabstop=2     " ��ʏ�Ń^�u��������߂镝
set softtabstop=2 " �A�������󔒂ɑ΂��ă^�u�L�[��o�b�N�X�y�[�X�L�[�ŃJ�[�\����������
set autoindent    " ���s���ɑO�̍s�̃C���f���g���p������
set smartindent   " ���s���ɑO�̍s�̍\�����`�F�b�N�����̍s�̃C���f���g�𑝌�����
set shiftwidth=2  " smartindent�ő������镝
set breakindent   " �C���f���g��t���Đ܂�Ԃ�
"}}}

" �����񌟍�"{{{

set incsearch  " �C���N�������^���T�[�`. �P�������͖��Ɍ������s��
set ignorecase " �����p�^�[���ɑ啶������������ʂ��Ȃ�
set smartcase  " �����p�^�[���ɑ啶�����܂�ł�����啶������������ʂ���
set hlsearch   " �������ʂ��n�C���C�g

" ESC�L�[2�x�����Ńn�C���C�g�̐؂�ւ�
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
"}}}

" �J�[�\��"{{{

set whichwrap=b,s,h,l,<,>,[,],~ " �J�[�\���̍��E�ړ��ōs�����玟�̍s�̍s���ւ̈ړ����\�ɂȂ�
set number                      " �s�ԍ���\��
set cursorline                  " �J�[�\�����C�����n�C���C�g

" �s���܂�Ԃ��\������Ă����ꍇ�A�s�P�ʂł͂Ȃ��\���s�P�ʂŃJ�[�\�����ړ�����
nnoremap  j      gj
nnoremap  k      gk
nnoremap  <down> gj
nnoremap  <up>   gk

" �s���܂�Ԃ��\������Ă����ꍇ�A�s�P�ʂňړ��������փL�[
nnoremap  <C-J>  j
nnoremap  <C-K>  k

" �}�����[�h�ł̃J�[�\���ړ�
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" �o�b�N�X�y�[�X�L�[�̗L����
set backspace=indent,eol,start
"}}}

" �J�b�R�E�^�O�̑Ή�"{{{

set    showmatch                      " ���ʂ̑Ή��֌W����u�\������
source $VIMRUNTIME/macros/matchit.vim " Vim�́u%�v���g������

" ���ʂ̎������͐ݒ�
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap "" ""
inoremap ' ''<Left>
inoremap < <><Left>
"}}}

" �}�E�X�ŃJ�[�\���ړ��ƃX�N���[��"{{{

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

" �N���b�v�{�[�h����̃y�[�X�g"{{{

" �}�����[�h�ŃN���b�v�{�[�h����y�[�X�g���鎞�Ɏ����ŃC���f���g�����Ȃ��悤�ɂ���
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

" �G�N�X�v���[��"{{{

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

" vim/gvim�œ��{����g���₷������"{{{
" ���p�Fhttps://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese

"���{��̍s�̘A�����ɂ͋󔒂���͂��Ȃ��B
set formatoptions+=mM

"��ʍŌ�̍s���ł������\������B
set display +=lastline
"}}}

" vim/gvim�œ��{����g���₷������iIME�j""{{{
" ���p�Fhttp://qiita.com/mwmsnn/items/0b40662a22162907efae

" �}�����[�h�ɓ��鎞�C�O��̑}�����[�h�ɂ����� IME �̏�Ԃ𕜌�����D
set t_SI+=[<r
" �}�����[�h���o�鎞�C���݂� IME �̏�Ԃ�ۑ����CIME ���I�t�ɂ���D
set t_EI+=[<s[<0t
" Vim �I�����CIME �𖳌��ɂ��C�����ɂ�����Ԃ�ۑ�����D
set t_te+=[<0t[<s
" ESC �L�[�������Ă���}�����[�h���o��܂ł̎��Ԃ�Z������
set ttimeoutlen=100
"}}}

" �t�@�C���������ݒ�"{{{

nmap <F12> :w ~\Desktop\<C-R>=strftime("%Y%m%d%H%M%S")<CR>memo.txt<CR>
"}}}

" vimgrep�p��quickfix�ݒ�"{{{

noremap <A-j>    :cn<CR>
noremap <A-k>    :cp<CR>

set efm=%f\|%l\ col\ %c\|%m
"}}}


set fdm=marker

set list
"list�ŕ\������镶���̃t�H�[�}�b�g���w�肷��
set listchars=eol:$,tab:>\ ,extends:<

"�ύX���̃t�@�C���ł��A�ۑ����Ȃ��ő��̃t�@�C����\��
set hidden

"�E�B���h�E���ő剻���ċN��
au GUIEnter * simalt ~x


let mapleader = "\<Space>"

nmap <Leader>w :w<CR>

" unite.vim�̐ݒ�"{{{

" ���̓��[�h�ŊJ�n����
let g:unite_enable_start_insert=1

let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200

nnoremap  [unite]   <Nop>
nmap      <Leader>u [unite]

" �o�b�t�@�ꗗ
nnoremap  <silent>  [unite]b :<C-u>Unite -buffer-name=buffer buffer<CR>
" �t�@�C���ꗗ
nnoremap  <silent>  [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ���W�X�^�ꗗ
nnoremap  <silent>  [unite]r :<C-u>Unite -buffer-name=register register<CR>
" �ŋߎg�p�����t�@�C���ꗗ
nnoremap  <silent>  [unite]m :<C-u>Unite file_mru<CR>
" ��p�Z�b�g
nnoremap  <silent>  [unite]u :<C-u>Unite buffer file_mru<CR>
" �S���悹
nnoremap  <silent>  [unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" �E�B���h�E�𕪊����ĊJ��
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" �E�B���h�E���c�ɕ������ĊJ��
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESC�L�[��2�񉟂��ƏI������
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"}}}

"jq�iJSON�p�[�T�[�j�̐ݒ�"{{{
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

" �m�[�}�����[�h�� 'cc' �Ɋ��蓖�Ă�
nmap cc <Plug>(ToggleColorColumn)

" vim�G�f�B�^�̈���@�\���g�p����"{{{
" ���p�Fhttp://nanasi.jp/articles/howto/hardcopy/hardcopy.html

" ����_�C�A���O��\������
" :hardcopy
" ����_�C�A���O��\�����Ȃ��ň��
" :hardcopy!
" 20�s�ڂ���50�s�ڂ��������
" :20,50hardcopy

set printheader=
set printoptions=

"---------------------------------------------------------------------------
" ����̃t�H���g
"---------------------------------------------------------------------------
" ����Ŏg�p����t�H���g
let &printfont=&guifont
"set printfont=MS_Mincho:h12

" postscript printer
if has('postscript')
    if has('win32')                          " Windows
    elseif has('mac')                        " Mac OSX
        set printencoding=euc-jp
        set printmbcharset=JIS_X_1990

        set printmbfont=

        " ���ʕ����̃t�H���g
        set printmbfont+=r:Osaka-Mono
        " ���� (bold) �̃t�H���g
        set printmbfont+=,b:Osaka-Mono
        " �Α̕��� (italic) �̃t�H���g�B���ݒ莞��r�t���O���g�p����B
        set printmbfont+=,r:Osaka-Mono
        " �����Α̕��� (bold-italic) �̃t�H���g�B���ݒ莞��b�t���O���g�p����B
        set printmbfont+=,b:Osaka-Mono

        set printmbfont+=,c:yes              " ASCII ������ Courier �t�H���g�ŏo��
        "set printmbfont+=,c:no              " �f�t�H���g
        set printmbfont+=,a:yes              " ASCII�R�[�h�͈̔͂� ASCII �����Z�b�g�ŏo��
        "set printmbfont+=,a:no              " �f�t�H���g

    else                                     " ���̑��̊�
    endif
endif

"---------------------------------------------------------------------------
" �w�b�_�[
"---------------------------------------------------------------------------
"set printoptions+=header:0  " �w�b�_�[��������Ȃ�
"set printoptions+=header:1  " �w�b�_�[�A�{���ԂɃX�y�[�X���󂯂Ȃ�
set printoptions+=header:2   " �w�b�_�[�A�{���Ԃ�1�s�����

"set printheader=-%N-                                     " -�y�[�W-
"set printheader=%t                                       " �t�@�C����
"set printheader=%F                                       " �t�@�C�����i�p�X�܂ށj
set printheader=%t\ -%N-                                  " �t�@�C���� -�y�[�W-
"set printheader=%{strftime('%Y/%m/%d\ %H:%M')}           " �ŏI�������
"set printheader=�R�c\ ���Y                               " �ŏI�ۑ��ҁA�쐬��
"set printheader=�R�c\ ���Y\ %N\ %{strftime('%Y/%m/%d')}  " �쐬�� �y�[�W ���t
"set printheader=�ЊO��\ %N\ %{strftime('%Y/%m/%d')}      " �ЊO�� �y�[�W ���t

" �w�b�_�[�̈ʒu
let &printheader = &printheader . "%="   " ����
"let &printheader = "%=" . &printheader  " �E��

"---------------------------------------------------------------------------
" ����ݒ�
"---------------------------------------------------------------------------
"
" �]���X�y�[�X
" [left ��]  [right �E]  [top ��]  [bottom ��]
" [in �C���`]  [pt 1/72�C���`]  [mm �~�����[�g��]  [pc �p���T�C�Y�ɑ΂��銄��]
" set printoptions+=left:10pc,right:5pc,top:5pc,bottom:5pc
"set printoptions+=left:3pc,right:3pc,top:3pc,bottom:3pc
set printoptions+=left:1pc,right:3pc,top:3pc,bottom:3pc

" �{���̐܂�Ԃ�
if &wrap                       " wrap�̐ݒ�ɉ�킹��
    set printoptions+=wrap:y
else
    set printoptions+=wrap:n
endif
"set printoptions+=wrap:y      " �E�[�Ő܂�Ԃ�
"set printoptions+=wrap:n      " �܂�Ԃ��Ȃ�

" �s�ԍ�
if &number                     " number�̐ݒ�ɉ�킹��
    set printoptions+=number:y
    let &printheader = "   " . &printheader
else
    set printoptions+=number:n
endif
"set printoptions+=number:y    " �s�ԍ��t���ň��
"set printoptions+=number:n    " �s�ԍ���t���Ȃ�

" Syntax�n�C���C�g
"set printoptions+=syntax:y    " Syntax�n�C���C�g�L���ň��
set printoptions+=syntax:n    " Syntax�n�C���C�g�����ň��
"set printoptions+=syntax:a     " �J���[����\�Ȃ�Syntax�n�C���C�g�L��

" ���y�[�W����
set printoptions+=formfeed:y   " ���y�[�W�����ŁA���y�[�W����
"set printoptions+=formfeed:n  " ���y�[�W�������������B���y�[�W�����������Ă����y�[�W���Ȃ��B


"---------------------------------------------------------------------------
" �v�����^�ݒ�
"---------------------------------------------------------------------------
" ���̌���
set printoptions+=portrait:y   " �c�����Ɉ��
"set printoptions+=portrait:n  " �������Ɉ��

" �p���T�C�Y
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

" ����̕��@
set printoptions+=duplex:off     " �Жʈ��
"set printoptions+=duplex:long   " ���ʈ���B�Ԃ������c�B�����ӂŕ���B
"set printoptions+=duplex:short  " ���ʈ���B�Ԃ��������B�Z���ӂŕ���B

" ����P��
set printoptions+=collate:y      " ���P�ʂň���i1,2,3,4,1,2,3,4,1,2,3,4�j
"set printoptions+=collate:n     " �y�[�W�P�ʂň���i1,1,1,1,2,2,2,2,3,3,3,4,4,4,4�j

" ����W���u
"set printoptions+=jobsplit:y    " ����W���u�𕪂���
set printoptions+=jobsplit:n     " ����W���u�𕪂��Ȃ�

" ����Ŏg�p����v�����^�i��̓V�X�e���W���̃v�����^�j
set printdevice=
"set printdevice="CutePDF Writer"
"}}}

" �ȑO�̐ݒ�"{{{

" set nocompatible

" "���̓��[�h���A�X�e�[�^�X���C���̃J���[��ύX
" augroup InsertHook
"     autocmd!
"     autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
"     autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
" augroup END

" "�t�@�C���G���R�[�f�B���O�╶���R�[�h���X�e�[�^�X�s�ɕ\������
" set laststatus=2
" set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 

" colorscheme desert

" -------------------------------------------------------------------------------
" �����R�[�h�̎����F��
"if &encoding !=# 'utf-8'
"  setlocal encoding=japan
"  setlocal fileencoding=japan
"endif
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
"  " iconv��eucJP-ms�ɑΉ����Ă��邩���`�F�b�N
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'eucjp-ms'
"    let s:enc_jis = 'iso-2022-jp-3'
"  " iconv��JISX0213�ɑΉ����Ă��邩���`�F�b�N
"  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
"  " fileencodings���\�z
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
"  " �萔������
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif

" setlocal encoding=cp932
" setlocal fileencoding=cp932
"
" " -------------------------------------------------------------------------------
" " ���s�R�[�h�̎����F��
" set fileformats=dos,unix,mac

" " ���Ƃ����̕����������Ă��J�[�\���ʒu������Ȃ��悤�ɂ���
" if exists('&ambiwidth')
"   set ambiwidth=double
" endif

" setlocal fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,utf-8,sjis,cp932

"set gfn=MS_Gothic:h9:cDEFAULT
"
" "�t�@�C������ <Tab> ���Ή�����󔒂̐�
" set tabstop=2
" "�V�t�g�ړ���
" set shiftwidth=2
" "�^�u�̑���ɋ󔒕�����}������
" set expandtab
" "�V�����s�̃C���f���g�����ݍs�Ɠ����ɂ���
" set autoindent
" "�V�����s��������Ƃ��ɍ��x�Ȏ����C���f���g���s��
" set smartindent
" "�s���̗]������ Tab ��ł����ނƁA'shiftwidth' �̐������C���f���g����B
" set smarttab

" "�J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���
" set whichwrap=b,s,h,l,<,>,[,]
" "set whichwrap=b,s,<,>,[,]

" set number

" set ruler
" set showcmd
" "setlocal lines=60
" "setlocal columns=192

" "�������ɑ啶�����܂�ł������/�������
" set smartcase

" "�J�[�\����\���s�ňړ�����B�����s�ړ���<C-n>,<C-p>
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
"         syntax match InvisibleJISX0208Space "�@" display containedin=ALL
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

" "�o�C�i�����[�h
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

" " ���{����܂܂Ȃ��ꍇ�� fileencoding �� encoding ���g���悤�ɂ���
" if has('autocmd')
"   function! AU_ReCheck_FENC()
"     if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"       let &fileencoding=&encoding
"     endif
"   endfunction
"   autocmd BufReadPost * call AU_ReCheck_FENC()
" endif

" " -------------------------------------------------------------------------------
" " Ruby �p�̐ݒ�
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

