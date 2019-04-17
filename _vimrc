scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis

let mapleader = "\<Space>"

" dein {{{
" dein.vim がなければ github からclone
let s:dein_path = expand('~/.vim/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_path, ':p')
endif

" dein#add {{{
if dein#load_state(expand('~/.vim/dein'))
    call dein#begin(expand('~/.vim/dein'))
    call dein#add(expand('~/.vim/dein/repos/github.com/Shougo/dein.vim'))

    let s:toml = s:dein_path . '/dein.toml'
    call dein#load_toml(s:toml, {'lazy': 0})

    call dein#end()
    call dein#save_state()
endif
" }}}

filetype plugin indent on
syntax enable
" }}}

set background=dark
if dein#tap('vim-hybrid')
    let g:hybrid_custom_term_colors = 1
    let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
    colorscheme hybrid
else
    colorscheme desert
endif

" filetype {{{
autocmd BufWinEnter,BufNewFile SConstruct set filetype=python
autocmd BufWinEnter,BufNewFile *test*.py set filetype=python.test
autocmd BufNewFile,BufRead *.tex  setfiletype tex
autocmd BufNewFile,BufRead *.py  setfiletype python
autocmd BufNewFile,BufRead *.go  setfiletype go
autocmd BufNewFile,BufRead *.scala  setfiletype scala
autocmd BufNewFile,BufRead *.sage setfiletype python
autocmd BufNewFile,BufRead *.markdown setfiletype markdown
autocmd BufNewFile,BufRead *.plant setfiletype plantuml
autocmd BufNewFile,BufRead *.puml setfiletype plantuml
autocmd BufNewFile,BufRead *.iuml setfiletype plantuml
autocmd BufNewFile,BufRead *.uml setfiletype plantuml
autocmd BufNewFile,BufRead *.diag setfiletype blockdiag
autocmd BufNewFile,BufRead *.max setfiletype maxima
autocmd BufNewFile,BufRead *.gnu setfiletype gnuplot
autocmd BufNewFile,BufRead *.md setfiletype markdown
autocmd BufNewFile,BufRead *.mkd setfiletype markdown
" }}}

" system {{{
set conceallevel=0
set number
set relativenumber
set cursorline
highlight CursorLine ctermbg=235
set visualbell t_vb=
set mouse-=a
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

set noswapfile
set nobackup
set noundofile
set undodir=~/.vim/undo
set backupdir=~/.vim/backup
set directory=~/.vim/swp

set expandtab
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4

" json {{{
augroup Setting-Json
  autocmd!
  autocmd FileType json setlocal conceallevel=0
augroup END
" }}}

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
  autocmd FileType scala setlocal foldmethod=syntax
augroup END
" }}}

" plantuml {{{
augroup Setting-PlantUML
  autocmd!

  autocmd FileType plantuml setlocal textwidth=99
  autocmd FileType plantuml setlocal colorcolumn=100
  autocmd FileType plantuml setlocal tabstop=2
  autocmd FileType plantuml setlocal softtabstop=2
  autocmd FileType plantuml setlocal shiftwidth=2
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

" neosnippet {{{
augroup Setting-NeoSnippet
  autocmd!

  autocmd FileType neosnippet setlocal noexpandtab
augroup END
" }}}
" }}}

" commands {{{
command! Dog !shiba --detach %
command! Cd :cd %:h
" }}}

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
function! s:drawUnderLine(c)
    call append('.', repeat(a:c, len(getline('.')) + 2))
endfunction
command! -nargs=? UnderLine call s:drawUnderLine(<f-args>)
nnoremap <leader>u :UnderLine =<cr>
nnoremap <leader>U :UnderLine<space>
" }}}

" mapping {{{
" move by paragraph {{{
nnoremap <RIGHT> <NOP>
nnoremap <LEFT>  <NOP>
nnoremap <UP>    <NOP>
nnoremap <DOWN>  <NOP>
nnoremap L gt
nnoremap H gT
" }}}
" vimrc {{
nnoremap <space>. :e ~/.vimrc<cr>
nnoremap <space>. :tabnew      ~/dotfiles/vimrc<cr>
nnoremap <space>? :source ~/dotfiles/vimrc<cr>
nnoremap <c-n> <c-a><c-x>
nnoremap <leader>n /\d\d\d\d\/\d\d\/\d\d.*\n===<cr>
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

nmap <space>l :set list!<cr>
nmap <space>z :on<cr>
nmap <cr> za
" }}}
" }}}

syntax off
