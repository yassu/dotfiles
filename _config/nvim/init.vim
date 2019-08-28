scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis

let mapleader = "\<Space>"

" vim-plug {{{

if empty(glob('~/.local/share/nvim/plugged'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 導入Ref: http://txtbokwrm.hatenablog.com/entry/2018/08/06/165041
call plug#begin('~/.local/share/nvim/plugged')

Plug 'kana/vim-textobj-user'

Plug 'kana/vim-operator-user'

Plug 'kana/vim-textobj-indent'

Plug 'Shougo/neosnippet' " {{{
let g:neosnippet#snippets_directory = '~/.vim/snippets/'
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

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

"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'
" }}}

Plug 'kana/vim-textobj-entire'

Plug 'glidenote/memolist.vim'

Plug 'danro/rename.vim'

Plug 'tomtom/tcomment_vim'
if !exists('g:tcomment_types')
    let g:tcomment_types = {}
endif
let g:tcomment_types['plantuml']="' %s"
let g:tcomment_types['toml']="# %s"

Plug 'thaerkh/vim-workspace'
let g:workspace_autocreate =0
let g:workspace_autosave_always = 0
let g:workspace_autosave = 0
nnoremap <Leader>S :ToggleWorkspace<CR>

Plug 'lambdalisue/gina.vim'
command! -nargs=* Gadd :Gina add <args>
command! -nargs=* Gbr :Gina branch <args>
command! -nargs=* Gco :Gina commit <args>
command! -nargs=* Gdiff :Gina diff <args>
command! -nargs=* Glog :Gina log <args>
command! -nargs=* Gglog :Gina log --graph --oneline <args>
command! -nargs=* Gsta :Gina status <args>
command! -nargs=* Gcout :Gina checkout <args>

Plug 'vim-jp/vimdoc-ja'
set helplang=ja,en

Plug 'rhysd/vim-operator-surround'
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)
let g:operator#surround#blocks =
\ {
\   '-' : [
\       { 'block' : ['"""', '"""'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['@'] },
\   ]
\ }

Plug 'thinca/vim-quickrun'
let quickrun_no_default_key_mappings = 0
silent! map <unique> <Leader>r <Plug>(quickrun)

Plug 'vim-scripts/twilight256.vim'

Plug 'sjl/badwolf'

Plug 'w0ng/vim-hybrid'

Plug 'chriskempson/vim-tomorrow-theme'

Plug 'gkjgh/cobalt'

Plug 'robertmeta/nofrils'

Plug 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_confirm=0
let g:strip_whitespace_on_save=1

Plug 'parkr/vim-jekyll'
let g:jekyll_post_template = [
\ '---',
\ 'layout: post',
\ 'title: "JEKYLL_TITLE"',
\ 'date: "JEKYLL_DATE"',
\ 'tags:',
\  '-',
\ '---',
\ '']

Plug 'cocopon/vaffle.vim'
let g:vaffle_show_hidden_files = 1
nnoremap <leader>v :Vaffle<cr>
nnoremap <leader>V :tabnew<cr>:Vaffle<cr>

Plug 'w0rp/ale' " {{{
let g:ale_linters = {
\   'javascript': ['eslint', 'eslint-plugin-vue'],
\   'python': ['pyflakes', 'flake8', 'pep8'],
\   'ruby': ['rubocop'],
\   'tex': ['textlint'],
\   'markdown': ['textlint'],
\   'css': ['stylelint'],
\}
let g:ale_fixers = {
\ 'ruby': ['rubocop'],
\ 'python': ['black', 'isort'],
\}
let g:ale_python_auto_pipenv = 1
let g:ale_fix_on_save = 1

let g:ale_statusline_format = ['E%d', 'W%d', 'ok']
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
nmap <silent> <C-n> <Plug>(ale_next_wrap)
autocmd FileType python nnoremap <leader>a :ALEToggle<cr>
" }}}

Plug 'thinca/vim-template'
function! s:loaded_plugin_template()
    if search('<CURSOR>')
\  |   execute 'normal! "_da>'
\  | endif
endfunction
autocmd User plugin-template-loaded call s:loaded_plugin_template()

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=white
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=white

Plug 'thinca/vim-ft-markdown_fold'

Plug 'vim-scripts/python_fold'

Plug 'lucapette/vim-textobj-underscore'

Plug 'osyo-manga/vim-textobj-multiblock'
let g:textobj_multiblock_blocks = [["`", "`"]]
omap a; <Plug>(textobj-multiblock-a)
omap i; <Plug>(textobj-multiblock-i)
vmap a; <Plug>(textobj-multiblock-a)
vmap i; <Plug>(textobj-multiblock-i)

Plug 't9md/vim-quickhl'
nmap <leader>* <Plug>(quickhl-manual-this)
xmap <leader>* <Plug>(quickhl-manual-this)
nmap <leader>@ <Plug>(quickhl-manual-reset)
xmap <leader>@ <Plug>(quickhl-manual-reset)

Plug 'simeji/winresizer'
let g:winresizer_start_key='<c-s>'
let g:winresizer_vert_resize = 3
let g:winresizer_horiz_resize = 3

Plug 'kana/vim-operator-replace'
map R <Plug>(operator-replace)

Plug 'AndrewRadev/switch.vim'
let g:switch_mapping = "<leader>s"

Plug 'junegunn/fzf', { 'do': './install --all' }

Plug 'junegunn/fzf.vim'
nnoremap <silent><leader>gf :GFiles<CR>
nnoremap <silent><leader>gF :GFiles?<CR>
nnoremap <silent><leader>fh :History<CR>
nnoremap <silent><leader>fl :BLines<CR>

Plug 'rhysd/committia.vim'

call plug#end()

" }}}

set background=dark
colorscheme desert
highlight CursorLine cterm=None

" filetype {{{
autocmd BufWinEnter,BufNewFile SConstruct set filetype=python
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
autocmd BufNewFile,BufRead *.toml setfiletype toml
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
set statusline=%F%m%r%h%w:\[TYPE=%Y]:\[POS=%04l,%04v](%{gina#component#repo#branch()})
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

  autocmd FileType python setlocal textwidth=99
  autocmd FileType python setlocal colorcolumn=100
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal shiftwidth=4
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
command! Lcd :lcd %:h
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
nnoremap <leader>. :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>. :tabnew      ~/.config/nvim/init.vim<cr>
nnoremap <leader>? :source ~/.config/nvim/init.vim<cr>
nnoremap <silent><space>h :<c-u>nohlsearch<cr>
nnoremap <c-n> <c-a><c-x>
nnoremap <leader>n /\d\d\d\d\/\d\d\/\d\d.*\n===<cr>
" }}
" normal mode {{{
nnoremap <space><space> :<c-u>help<Space>
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
