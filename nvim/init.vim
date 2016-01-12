" vim:fdm=marker

" Skip initialization if we're running vim-tiny or vim-small
if !1 | finish | endif

" Plugins {{{

call plug#begin('~/.config/nvim/plugged')

" Statusbar {{{
Plug 'itchyny/lightline.vim'
" }}}

" Templates {{{
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': 'python ./install.py' }
" }}}

" Syntax Checking & Linting {{{
Plug 'benekastah/neomake'
" }}}

" Rails {{{
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'vim-ruby/vim-ruby' , { 'for': ['ruby', 'eruby'] }
Plug 'kana/vim-textobj-user', { 'for': ['ruby', 'eruby'] }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'eruby'] }
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby', 'eruby'] }
" }}}

" Elixir {{{
Plug 'awetzel/vim-elixir', { 'branch': 'nvim-rplugin' }
"Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'Thinca/vim-ref', { 'for': 'elixir' } " For documentation
Plug 'powerman/vim-plugin-AnsiEsc', { 'for': 'elixir' } " For handling coloured escape sequences in Elixir docs
Plug 'sanmiguel/helpex.vim', { 'for': 'elixir' } " For documentation & Autocomplete
" }}}

" CSS {{{
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'css'] }
Plug 'Rykka/colorv.vim', { 'for': ['scss', 'css'] }
" }}}

" Markdown {{{
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc', { 'for': 'markdown' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown', 'on': 'Goyo' }
" }}}

" Handlebars {{{
Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.handlebars' }
" }}}

" Git {{{
Plug 'airblade/vim-gitgutter'
Plug 'mattn/webapi-vim', { 'on': 'Gist' }
Plug 'mattn/gist-vim', { 'on': 'Gist' }
" }}}

" Search {{{
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'osyo-manga/vim-over'
" }}}

" Colours {{{
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'junegunn/rainbow_parentheses.vim'
" }}}

" NetRW {{{
Plug 'tpope/vim-vinegar'
Plug 'dbakker/vim-projectroot'
" }}}

" Terminal {{{
Plug 'kassio/neoterm'
" }}}

" EditorConfig {{{
Plug 'editorconfig/editorconfig-vim'
" }}}

" Wakatime {{{
Plug 'wakatime/vim-wakatime'
" }}}

call plug#end()

" }}}

" Configuration {{{

" Status Bar {{{
set laststatus=2
set encoding=utf-8
scriptencoding utf-8

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'component': {
  \   'readonly': '%{&readonly?"\uE0A2":""}'
  \ },
  \ 'separator': { 'left': "", 'right': "" },
  \ 'subseparator': { 'left': "|", 'right': "|" }
\ }
set shortmess=atTiOI
" }}}

" Gist {{{
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1
let g:gist_private = 1
" }}}

" Copy/paste {{{

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
"let g:indent_guides_enable_on_vim_startup = 1

" }}}

" Neomake {{{
autocmd! BufWritePost * Neomake
" }}}

" Unite {{{

" Excluded directories for unite
call unite#custom_source('file_rec/async,file_mru,file,buffer,grep',
  \ 'ignore_pattern', join([
  \ '\.git/',
  \ '\.sass-cache/',
  \ 'bower_components/',
  \ 'dist/',
  \ 'node_modules/',
  \ '\.divshot-cache/',
  \ '\.svn/',
  \ '\.hg/',
  \ '\.bundle/',
  \ 'vendor/',
  \ 'tmp/',
  \ 'log/',
  \ '_build',
  \ 'deps'
  \ ], '\|'))


" Ctrlp replacement
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Build the ctrlp function, using projectroot to define the
" working directory.
function! Unite_ctrlp()
  execute ':Unite  -buffer-name=files -start-insert file_rec/async'
endfunction

" Call these custom settings on all unite buffers:
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  imap <buffer> <c-a> <Plug>(unite_choose_action)

  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

if executable('pt')
  " Tell unite to use ag for searching
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
  " Tell ag.vim to use pt binary
  let g:agprg="pt --nogroup --nocolor --column"
  let g:ag_working_path_mode="r"
endif

nnoremap <C-P> :call Unite_ctrlp()<cr>
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <leader>s :Unite -quick-match buffer<cr>

" }}}

" Snippets {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
" }}}

" Search {{{
set nohlsearch
set incsearch
set ignorecase
set wildignore=*.swp,*.bak,*.pyc,*.class
set magic
set wildmode=longest:full,list:full

function! VisualFindAndReplace()
  :OverCommandLine%s/
  :w
endfunction

function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/
  :w
endfunction

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>


if executable('pt')
  " Tell unite to use ag for searching
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
  " Tell ag.vim to use pt binary
  let g:agprg="pt --column"
  let g:ag_working_path_mode="r"
endif

" }}}

" Terminal Bells {{{
set visualbell
set noerrorbells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" }}}

" Leader Key {{{
let mapleader="\\"
let g:mapleader="\\"
" }}}

" Colour Scheme {{{
syntax enable
set background=dark
colorscheme Tomorrow-Night-Bright


if has("gui_running")
  colorscheme jellybeans
  set guifont=PragmataPro\ 11
endif

" Activate Rainbow Parentheses
autocmd VimEnter * RainbowParentheses

" }}}

" NetRW {{{
let g:netrw_banner=0
" }}}

" Terminal {{{

" Move from the neovim terminal window to
" somewhere else - vim style.
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <esc>  <C-\><C-n>

" Using neoterm, run rspec tests
let g:neoterm_clear_cmd = "clear; printf '=%.0s' {1..80}; clear"
let g:neoterm_automap_keys = ',tt'
nnoremap <silent> ,qq :call neoterm#close()<cr>
" }}}

" Editor settings {{{
set nowrap
set number

set listchars=tab:▒\ ,trail:⎵
set list

" Make backspace work like you'd expect it to
set backspace=indent,eol,start 
" Disabled Q (ex)
nnoremap Q <nop>
" }}}

" Split settings {{{
set lazyredraw
au VimResized * :wincmd =
nnoremap <silent> <C-w>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <C-w>- :exe "resize " . (winheight(0) * 2/3)<CR>
" }}}

" Swapfile Settings {{{
set backupdir=~/.config/nvim/tmp/backup//
set directory=~/.config/nvim/tmp/swap//
set undodir=~/.config/nvim/tmp/undo//
" }}}

" .vimrc settings {{{
" Enable per-project vimrcs
set exrc   " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files
" }}}

" }}}
