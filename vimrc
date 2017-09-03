scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis

" Plugin {{{
if v:version >= 800 " {{{
    set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

    call dein#begin(expand('~/.vim/dein/'))
    call dein#add('thinca/vim-quickrun')
    call dein#add('Shougo/unite.vim')
    call dein#add('kana/vim-textobj-indent')
    call dein#add('junegunn/vim-easy-align')
    call dein#add('tpope/vim-surround')
    call dein#add('kana/vim-textobj-user')
    call dein#add('kana/vim-textobj-entire')
    call dein#add('glidenote/memolist.vim')
    call dein#add('tomtom/tcomment_vim')
    call dein#add('koron/codic-vim')
    call dein#add('ntpeters/vim-better-whitespace')
    call dein#add('danro/rename.vim')
    call dein#add('ujihisa/repl.vim')
    call dein#add('kana/vim-textobj-underscore')
    call dein#add('thinca/vim-template')
    call dein#add('Shougo/neosnippet')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('matze/vim-tex-fold')
    call dein#add('vim-scripts/twilight')
    call dein#add('lambdalisue/vim-gita', {
        \ 'on_cmd': 'Gita',
    \ })
    call dein#add('w0rp/ale')
    let g:ale_linters = {
        \ 'python': ['flake8'],
    \ }
    call dein#add('Shougo/vimfiler')
    call dein#add('Shougo/vimproc.vim', {
        \ 'build': {
        \     'mac': 'make -f make_mac.mak',
        \     'linux': 'make',
        \     'unix': 'gmake',
        \    },
        \ })
    call dein#add('Shougo/neomru.vim')
    call dein#end()
" }}}
else " {{{
    " Note: Skip initialization for vim-tiny or vim-small.
    if 0 | endif

    set runtimepath+=~/.vim/bundle/neobundle.vim/

    call neobundle#begin(expand('~/.vim/bundle/'))

    NeoBundleFetch 'Shougo/neobundle.vim'

    NeoBundle 'thinca/vim-quickrun'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'kana/vim-textobj-indent'
    NeoBundle 'junegunn/vim-easy-align'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'kana/vim-textobj-user'
    NeoBundle 'kana/vim-textobj-entire'
    NeoBundle 'Shougo/neomru.vim'
    NeoBundle 'glidenote/memolist.vim'
    NeoBundle 'tomtom/tcomment_vim'
    NeoBundle 'koron/codic-vim'
    NeoBundle 'ntpeters/vim-better-whitespace'
    NeoBundle 'danro/rename.vim'
    NeoBundle 'ujihisa/repl.vim'
    NeoBundle 'lambdalisue/vim-gista'
    NeoBundle 'kana/vim-textobj-underscore'
    NeoBundle 'thinca/vim-template'
    NeoBundle 'rust-lang/rust.vim'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle 'matze/vim-tex-fold'
    NeoBundle 'vim-scripts/twilight'
    NeoBundle 'lambdalisue/vim-gita'
    NeoBundle 'Shougo/vimfiler'
    NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \ 'windows' : 'make -f make_mingw32.mak',
        \ 'cygwin' : 'make -f make_cygwin.mak',
        \ 'mac' : 'make -f make_mac.mak',
        \ 'unix' : 'make -f make_unix.mak',
        \ },
    \ }
    NeoBundle 'Shougo/neomru.vim'
    call neobundle#end()
endif " }}}
" Plugin Setting {{{

" quickrun {{{
autocmd BufRead,BufNewFile *_test.py set filetype=python.test
let g:quickrun_config = {}
let g:quickrun_config['python.test'] = {
    \ 'command': 'nosetests',
    \ 'hook/shebang/enable': 0,
\ }
let g:quickrun_config['markdown'] = {
    \ 'command': 'shiba',
    \ 'cmdopt': '--detach',
    \ 'hook/shebang/enable': 0,
\ }
let g:quickrun_config['yaml'] = {
    \ 'command': 'yamllint',
    \ 'hook/shebang/enable': 0,
\ }
" }}}

" easy-align {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}

" vim-surround {{{
let g:surround_{char2nr('@')} = "```\n\r\n```````\n"
let g:surround_{char2nr('7')} = "'''\n\r\n'''''''\n"
let g:surround_{char2nr('2')} = "\"\"\"\n\r\n\"\"\""
let g:surround_{char2nr('4')} = "$\r$"
" }}}

" memolist {{{
let g:memolist_path = '~/Dropbox/memo/'
let g:memolist_memo_suffix = "txt"
let g:memolist_prompt_tags=1
let g:memolist_unite = 1
let g:memolist_unite_source = "file_rec"

nmap <leader>mn :MemoNew<cr>memo<cr>
nmap <leader>ml :MemoList<cr>
nmap <leader>mg :MemoGrep<cr>
" }}}

" neomru {{{
nmap <space>M :Unite file_mru<cr>
"}}}

" neosnippet-snippets {{{
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/snippets'
" }}}

" gita {{{
command! G                 Gita
command! GAdd              Gita add
command! GCom              Gita commit
command! GSta              Gita status
command! GLog              Gita log
command! GCout             Gita checkout
command! GDiff             Gita diff
command! GPull             Gita pull
command! GPush             Gita push
" }}}

" vim-filer {{{
let vimfiler_as_default_explorer = 1
nmap <Space>f :VimFiler -split -simple -winwidth=35 -no-quit -project<cr>
nmap <Space>tf :VimFiler -tab -simple -winwidth=35 -no-quit -project<cr>
nmap <Space>d :VimFiler -split -simple -winwidth=35 -no-quit -project ~/Dropbox/ <cr>
nmap <Space>td :VimFiler -tab -simple -winwidth=35 -no-quit -project ~/Dropbox/ <cr>
" }}}
" }}}
" }}}


set background=dark
if (v:version >= 800 && dein#tap('twilight')) ||
        \ (v:version < 800 && neobundle#tap('twilight'))
    colorscheme twilight
else
  colorscheme desert
endif

let g:mapleader='<space>'

" filetype {{{
autocmd BufWinEnter,BufNewFile SConstruct set filetype=python
autocmd BufWinEnter,BufNewFile *test*.py set filetype=python.test
autocmd BufNewFile,BufRead *.tex  setfiletype tex
autocmd BufNewFile,BufRead *.go  setfiletype go
autocmd BufNewFile,BufRead *.sage setfiletype python
autocmd BufNewFile,BufRead *.markdown setfiletype markdown
autocmd BufNewFile,BufRead *.plant setfiletype plantuml
autocmd BufNewFile,BufRead *.puml setfiletype plantuml
autocmd BufNewFile,BufRead *.iuml setfiletype plantuml
autocmd BufNewFile,BufRead *.diag setfiletype blockdiag
autocmd BufNewFile,BufRead *.max setfiletype maxima
autocmd BufNewFile,BufRead *.gnu setfiletype gnuplot
autocmd BufNewFile,BufRead *.md setfiletype markdown
autocmd BufNewFile,BufRead *.mkd setfiletype markdown
" }}}

" json {{{
augroup Setting-Json
  autocmd!
  autocmd FileType json setlocal conceallevel=0
augroup END
" }}}

" system {{{
set noswapfile
set nobackup

set conceallevel=0
set nonumber
set visualbell t_vb=
set noequalalways
set clipboard+=unnamed
set ignorecase
set scrolloff=3
set wildmode=list:longest
set laststatus=2
set statusline=%F%m%r%h%w:\[TYPE=%Y]:\[POS=%04l,%04v]
if v:version >= 800 && dein#tap('ale')
  set statusline+=:[%{ALEGetStatusLine()}]
end
set statusline+=:[%p%%]
set incsearch
set foldmethod=marker

if exists('&ambiwidth')
    set ambiwidth=double
endif
set list listchars=tab:>>,trail:.

set undofile
set undodir=~/.vim/undo
set backupdir=~/.vim/backup
set directory=~/.vim/swp

set expandtab
set colorcolumn=80
set textwidth=80
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tex {{{
let tex_conceal = ''
augroup Setting-Tex
  autocmd!

  autocmd FileType tex setlocal textwidth=99
  autocmd FileType tex setlocal colorcolumn=100
  autocmd FileType tex setlocal tabstop=2
  autocmd FileType tex setlocal softtabstop=2
  autocmd FileType tex setlocal shiftwidth=2
augroup END
" }}}

" html {{{
augroup Setting-Html
  autocmd!

  autocmd FileType html setlocal textwidth=99
  autocmd FileType html setlocal colorcolumn=100
  autocmd FileType html setlocal tabstop=2
  autocmd FileType html setlocal softtabstop=2
  autocmd FileType html setlocal shiftwidth=2
augroup END
" }}}

" yaml {{{
augroup Setting-Yaml
  autocmd!

  autocmd FileType yaml setlocal textwidth=99
  autocmd FileType yaml setlocal colorcolumn=100
  autocmd FileType yaml setlocal softtabstop=2
  autocmd FileType yaml setlocal shiftwidth=2
augroup END
" }}}

" plant {{{
augroup Setting-PlantUML
  autocmd!

  autocmd FileType plant setlocal textwidth=99
  autocmd FileType plant setlocal colorcolumn=100
  autocmd FileType plant setlocal tabstop=2
  autocmd FileType plant setlocal softtabstop=2
  autocmd FileType plant setlocal shiftwidth=2
augroup END
" }}}

" python {{{
augroup Setting-Python
  autocmd!

  autocmd FileType python,python.test setlocal textwidth=79
  autocmd FileType python,python.test setlocal colorcolumn=80
  autocmd FileType python,python.test setlocal tabstop=4
  autocmd FileType python,python.test setlocal softtabstop=4
  autocmd FileType python,python.test setlocal shiftwidth=4
augroup END
" }}}

" ruby {{{
augroup Setting-Ruby
  autocmd!

  autocmd FileType ruby setlocal textwidth=79
  autocmd FileType ruby setlocal colorcolumn=80
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
augroup END
" }}}

" php {{{
augroup Setting-Php
  autocmd!

  autocmd FileType php setlocal textwidth=79
  autocmd FileType php setlocal colorcolumn=80
  autocmd FileType php setlocal tabstop=4
  autocmd FileType php setlocal softtabstop=4
  autocmd FileType php setlocal shiftwidth=4
augroup END
" }}}

" rust {{{
augroup Setting-Rust
  autocmd!

  autocmd FileType rust setlocal textwidth=79
  autocmd FileType rust setlocal colorcolumn=80
  autocmd FileType rust setlocal tabstop=4
  autocmd FileType rust setlocal softtabstop=4
  autocmd FileType rust setlocal shiftwidth=4
augroup END
"}}}

" hs {{{
augroup Setting-Haskell
  autocmd!

  autocmd FileType haskell setlocal textwidth=79
  autocmd FileType haskell setlocal colorcolumn=80
  autocmd FileType haskell setlocal tabstop=2
  autocmd FileType haskell setlocal softtabstop=2
  autocmd FileType haskell setlocal shiftwidth=2
augroup END
" }}}

" blockdiag {{{
augroup Setting-Blockdiag
  autocmd!

  autocmd FileType diag setlocal textwidth=79
  autocmd FileType diag setlocal colorcolumn=80
  autocmd FileType diag setlocal tabstop=2
  autocmd FileType diag setlocal softtabstop=2
  autocmd FileType diag setlocal shiftwidth=2
augroup END
" }}}

" maxima {{{
augroup Setting-Maxima
  autocmd!

  autocmd FileType maxima setlocal textwidth=99
  autocmd FileType maxima setlocal colorcolumn=100
  autocmd FileType maxima setlocal tabstop=2
  autocmd FileType maxima setlocal softtabstop=2
  autocmd FileType maxima setlocal shiftwidth=2
augroup END
" }}}
" }}}

" commands {{{
command! Fab !fab view
command! Dog !shiba --detach %
command! TT :e ~/tasks.markdown
" }}}

autocmd BufWinLeave *? silent mkview
autocmd BufWinEnter *? silent loadview

set nrformats =

set autoindent
set smartindent
nnoremap J mzJ`z:delm z<cr>

" wildignore {{{
set wildignore=*.o,*.obj,*~,*.pyc
set wildignore+=.git
set wildignore+=.tmp
set wildignore+=.coverage
set wildignore+=__pycache__/
set wildignore+=*.egg,*.egg-info
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.pdf
" }}}

" setting of tab {{{
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
" Set tabline.
function! s:my_tabline()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    T [Tag]
" Tab jump
for s:n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.s:n  ':<C-u>tabnext'.s:n.'<CR>'
endfor
map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>
" }}}

" load vimrc of local {{{
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END
function! s:vimrc_local(loc)
  let files = findfile('.lcvimrc', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
" }}}

" underline {{{
function! s:drawUnderLine(...)
    let l:sep = get(a:, 1, '-')
    call append('.', repeat(l:sep, len(getline('.')) + 2))
endfunction
command! -nargs=? UnderLine call s:drawUnderLine(<f-args>)
nnoremap <leader>u :UnderLine<cr>
nnoremap <leader>U :UnderLine<space>
" }}}

" mapping {{{
" move by paragraph {{{
nnoremap <RIGHT> <NOP>
nnoremap <LEFT>  <NOP>
nnoremap <UP>    <NOP>
nnoremap <DOWN>  <NOP>
nnoremap L :cnext<cr>
nnoremap H :cprev<cr>
" }}}
" vimrc {{
nnoremap <space>. :tabnew      ~/dotfiles/vimrc<cr>
nnoremap <space>? :source ~/dotfiles/vimrc<cr>
nnoremap <c-n> <c-a><c-x>
" }}
" normal mode {{{
nnoremap <Space>h :<c-u>help<Space>
nnoremap <silent><c-c> o<esc>
nnoremap <space>w :write<cr>
nnoremap <space>q :quit<cr>
" }}}

" map {{{
nnoremap <silent>c_ ct_
nnoremap <silent>d_ dt_
nnoremap <silent>c) ct)
nnoremap <silent>d) dt)
nnoremap <silent>c} ct}
nnoremap <silent>d} dt}
nnoremap <silent>c] ct]
nnoremap <silent>d] dt]
nnoremap <silent>d' dt'
nnoremap <silent>c' ct'
nnoremap <silent>d" dt"
nnoremap <silent>c" ct"
nnoremap <silent>d. dt.
nnoremap <silent>c. ct.
nnoremap <silent>d\ d$
nnoremap <silent>D  ^d$
nnoremap <silent>c$ d$a
nnoremap <silent>c\ c$
" }}}

nmap <leader>s :set number!<cr>
nmap <leader>l :set list!<cr>
nmap <space>z :on<cr>
" }}}

syntax on
