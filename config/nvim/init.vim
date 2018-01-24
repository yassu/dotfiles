scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis


"dein Scripts-----------------------------
" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" Required:
if dein#load_state('/Users/yuki_yasuda/.cache/dein')
  call dein#begin('/Users/yuki_yasuda/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/yuki_yasuda/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  if dein#tap('neomru.vim')
      nnoremap <Space><S-M> :Unite file_mru<cr>
  endif
  call dein#add('tpope/vim-surround')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-indent')
  call dein#add('Shougo/neosnippet')
  let g:neosnippet#snippets_directory = '~/.vim/snippets/'

  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  "imap <expr><TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ neosnippet#expandable_or_jumpable() ?
  " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For conceal markers.
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif

  "set snippet file dir
  let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'
  call dein#add('kana/vim-textobj-entire')
  call dein#add('glidenote/memolist.vim')
  let g:memolist_path = "~/Dropbox/memo/"
  nnoremap <Space>mn  :MemoNew memo<CR>
  nnoremap <Space>ml  :MemoList<CR>
  nnoremap <Space>mg  :MemoGrep<CR>
  call dein#add('danro/rename.vim')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('thaerkh/vim-workspace')
  let g:workspace_autocreate =0
  let g:workspace_autosave_always = 0
  let g:workspace_autosave = 0
  nnoremap <Space>s :ToggleWorkspace<CR>
  if v:version >= 800
      call dein#add('lambdalisue/gina.vim')
  endif
  call dein#add('ktvoelker/sbt-vim')
  call dein#add('vim-scripts/twilight')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


set number
set relativenumber

set background=dark
if dein#tap('twilight')
    colorscheme twilight
else
    colorscheme desert
endif

" filetype {{{
autocmd BufWinEnter,BufNewFile SConstruct set filetype=python
autocmd BufWinEnter,BufNewFile *test*.py set filetype=python.test
autocmd BufNewFile,BufRead *.tex  setfiletype tex
autocmd BufNewFile,BufRead *.go  setfiletype go
autocmd BufNewFile,BufRead *.scala  setfiletype scala
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
set number
set relativenumber
set visualbell t_vb=
set noequalalways
set clipboard+=unnamed
set ignorecase
set scrolloff=3
set wildmode=list:longest
set laststatus=2
set statusline=%F%m%r%h%w:\[TYPE=%Y]:\[POS=%04l,%04v]
set statusline+=:[%p%%]
set incsearch
set foldmethod=marker

if exists('&ambiwidth')
    set ambiwidth=double
endif
set list listchars=tab:>>,trail:.

set noundofile
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

" scala {{{
augroup Setting-Scala
  autocmd!

  autocmd FileType scala setlocal textwidth=99
  autocmd FileType scala setlocal colorcolumn=100
  autocmd FileType scala setlocal softtabstop=2
  autocmd FileType scala setlocal shiftwidth=2
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
command! Dog !shiba --detach %
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
nnoremap <space>. :e ~/.vimrc<cr>
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

nmap <space>l :set list!<cr>
nmap <space>z :on<cr>
" }}}

syntax on
