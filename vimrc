""""""""""""""""""""""""""""""
" => Vundle
""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'


""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""
Bundle 'tpope/vim-markdown'
" Type :Note to make a note!
Bundle 'xolox/vim-notes'
let g:notes_directory = '~/.notes' " Set the notes to go in ~/.notes dir.


""""""""""""""""""""""""""""""
" => CSS/SASS
""""""""""""""""""""""""""""""
Bundle 'skammer/vim-css-color'


""""""""""""""""""""""""""""""
" => HTML / XML
""""""""""""""""""""""""""""""
Bundle 'matchit.zip'


""""""""""""""""""""""""""""""
" => PHP
""""""""""""""""""""""""""""""
Bundle 'afternoon/vim-phpunit'
Bundle 'johnhamelink/blade.vim'
Bundle 'Xdebug'
Bundle 'vol0da/phpcomplete.vim'
let php_folding = 1 " Enable folding for classes and functions.
" Use <alt>p to search php.net, but only when a php file is present. Fancy!
au BufRead,BufNewFile *.php map π <ESC>:! /usr/bin/open -a "/Applications/Google Chrome.app" 'http://uk.php.net/results.php?q=<C-R>=Search('Search php.net:')<CR>&l=en&p=all'<CR><CR>


""""""""""""""""""""""""""""""
" => JavaScript / JSON
""""""""""""""""""""""""""""""
Bundle 'pangloss/vim-javascript'
Bundle 'mmalecki/vim-node.js'
autocmd FileType json set equalprg=json_reformat " Auto-format JSON
autocmd fileType json set syntax=javascript      " Colourise JSON using the javascript syntax


""""""""""""""""""""""""""""""
" => Basics
""""""""""""""""""""""""""""""
syntax on                 " Syntax mode!
filetype plugin indent on " We want indenting
set nocompatible          " We don't need strict vi compatibility.
set ttyfast               " Tells vim we have a fast connection to the terminal
set clipboard=unnamed     " Allows you to copy/paste from within the terminal
set ttimeout              " Makes vim play nicely with tmux
set ttimeoutlen=25        " Makes vim play nicely with tmux0
set notimeout             " Makes vim play nicely with tmux
set autochdir



""""""""""""""""""""""""""""""
" => Columns and splits
""""""""""""""""""""""""""""""
set number                " Show line numbers
set nowrap                " Turn off line wrapping
set ruler
set colorcolumn=81        " Set the line wrap column
set splitright            " Set vertical splits to split to the right
set splitbelow            " Set horizontal splits to split to the bottom
au VimResized * :wincmd = " Resize splits when the window is resized
" Make resizing less painful by doing using a bit of maths...
nnoremap <C-w>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <C-w>- :exe "resize " . (winheight(0) * 2/3)<CR>


""""""""""""""""""""""""""""""
" => Backups, undos and
"    swap files
""""""""""""""""""""""""""""""
Bundle 'sjl/gundo.vim'
" Capital U toggle Gundo
nnoremap U :GundoToggle<CR>
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set backup
set noswapfile

""""""""""""""""""""""""""""""
" => File Encoding & line
"    endings
""""""""""""""""""""""""""""""
set ffs=unix,mac,dos " Default file types
set encoding=utf-8   " Set encoding to UTF-8 by default


""""""""""""""""""""""""""""""
" => Dictionary
""""""""""""""""""""""""""""""
set dictionary=/usr/share/dict/words " Use the default words dictionary


""""""""""""""""""""""""""""""
" => Advanced Selections
"    and traversal
""""""""""""""""""""""""""""""
" Lets us select 'around' things.
Bundle 'tpope/vim-surround'
" Helps us align our code nicely with :Tabularize /<string>
Bundle 'godlygeek/tabular'
" Allows us to manipulate columns of text without
" defining their boundaries.
Bundle 'coderifous/textobj-word-column.vim'

""""""""""""""""""""""""""""""
" => Sessions
""""""""""""""""""""""""""""""
" Jump to last cursor position when opening a file.
" Don't do it when writing a commit log entry.
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction


""""""""""""""""""""""""""""""
" => Colourscheme
""""""""""""""""""""""""""""""
" Our lovely theme
"Bundle 'chriskempson/vim-tomorrow-theme'
"colorscheme Tomorrow-Night-Bright
Bundle 'KevinGoodsell/vim-csexact'
Bundle 'vydark'
colorscheme vydark

if has("gui_running")
    set fuopt+=maxhorz            " Get rid of menubars that are visible by default.
    set guioptions-=T             " Remove the toolbar
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=e             " Remove Macvim tabs
    set stal=1                    " Show the internal vim tabs only if there's >1 tab open

    set guifont=Monaco:h12        " Set the font to something nicer than the defaults
    set fuoptions=maxvert,maxhorz " Full screen means FULL screen
    " Turn off the visual/audio bell
    set vb t_vb=
endif


""""""""""""""""""""""""""""""
" => Healthy Habits
""""""""""""""""""""""""""""""
if has("gui_running") " If we're running Macvim
    " Fuck you, help key.
    noremap  <F1> :set invfullscreen<CR>
    inoremap <F1> <ESC>:set invfullscreen<CR>a
else
    noremap <F1> <nop>
    inoremap <F1> <nop>
endif

" Fuck you too, manual key.
nnoremap K <nop>

" Force yourself to use the correct
" keys when in visual mode
map <Left> :echoe "Use h"<CR>
map <Right> :echoe "Use l"<CR>
map <Up> :echoe "Use k"<CR>
map <Down> :echoe "Use j"<CR>

""""""""""""""""""""""""""""""
" => Console Vim
""""""""""""""""""""""""""""""
set t_Co=256 " Allow the terminal 256 colours if it can do it
" Enable mouse scrolling - stops the buffer scrollback buffer
" from misbehaving
set mouse=a


""""""""""""""""""""""""""""""
" => Whitespace
""""""""""""""""""""""""""""""
" Display tabs and trailing spaces
set list
set listchars=tab:→⋅,trail:✜,nbsp:⋅
set list
" Automatically indent
set autoindent
" Re-indent a line when the cinkeys are
" detected
set cindent
set cinkeys=0{,0},:,0#,!^F
" Set Tabs to 4 spaces wide
set tabstop=4
set shiftwidth=4
set expandtab

" Trailing spaces are now coloured green
hi ExtraWhitespace guifg=#5fdf5f
" Define whitespace when entering the buffer
au BufEnter * match ExtraWhitespace /\s\+$/
" Define whitespace when inserting text
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" Define whitespace when leaving insert mode
au InsertLeave * match ExtraWhiteSpace /\s\+$/
" Lastly, define the colour of non-trailing tabs
" (Not as lurid as trailing space - a nice quiet grey).
hi SpecialKey guifg=#3a3a3a
hi ColorColumn guibg=#3a3a3a
" When saving a file trailing whitespace will automatically removed
augroup DeleteTrailingWhitespaces
    autocmd!
    " Remember the position using ks| |'s
    autocmd BufWritePre * |call DeleteTrailingWhitespaces()|
augroup END

function! DeleteTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    execute "%s/\\s\\+$//ge"
    let last_search_removed_from_history = histdel('s', -1)
    call cursor(l, c)
endfunction


""""""""""""""""""""""""""""""
" => Exuberant CTags
""""""""""""""""""""""""""""""
set tags+=./tags; " Look for tags file recursively backwards

""""""""""""""""""""""""""""""
" => Explorer
""""""""""""""""""""""""""""""
" Hide .swp, .DS_Store and .localized files
let g:netrw_list_hide= '.*\.swp$,.DS_Store,.localized'


""""""""""""""""""""""""""""""
" => Tab completion
""""""""""""""""""""""""""""""
set wildmenu                                     " Turn on tab completion
set wildmode=list:longest,list:full              " Set it to the best sort
set wildignore+=*.rbc,*.class,vendor/gems/*      " Ignore ruby stuff
set wildignore+=.hg,.svn                         " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files


""""""""""""""""""""""""""""""
" => Source Control
""""""""""""""""""""""""""""""
autocmd filetype svn,*commit* setlocal spell " Spell check when writing commit logs

""""""""""""""""""""""""""""""
" => Git
""""""""""""""""""""""""""""""
Bundle 'tpope/vim-fugitive'

""""""""""""""""""""""""""""""
" => Gist
""""""""""""""""""""""""""""""
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
" When sending code, copy resultant URL to the clipboard.
let g:github_token = ''             " Set your github token
let g:github_user  = 'johnhamelink' " Set your username
let g:gist_detect_filetype = 1      " Set the filetype detection to on, so your paste is syntax highlighted
if has("mac")
    let g:gist_clip_command = 'pbcopy' " Set the command used to send the URL to the clipboard
elseif has ("unix")
    let g:gist_clip_command = 'xclip'  " Set the command used to send the URL to the clipboard
endif
let g:gist_private = 1              " Set the Gist to private by default


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
set laststatus=2 " Always show the statusline on the 2nd last row
set statusline+=%{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


""""""""""""""""""""""""""""""
" => Advanced code snippets
""""""""""""""""""""""""""""""
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
let g:snips_author = 'John Hamelink'


""""""""""""""""""""""""""""""
" => Syntax Checking
""""""""""""""""""""""""""""""
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'scrooloose/syntastic'


""""""""""""""""""""""""""""""
" => Searching
""""""""""""""""""""""""""""""
" Allows us to find with Ack
Bundle 'mileszs/ack.vim'
set incsearch  " Find the next match as we type the search
set hlsearch   " Highlight searches by default
set ignorecase " Ignore the casing of the search
set smartcase  " Only case about casing when caps are used


""""""""""""""""""""""""""""""
" => Search Online!
""""""""""""""""""""""""""""""
function! Search(prompt)
	call inputsave()
	let searchterm = input(a:prompt)
	call inputrestore()
	return searchterm
endfunction


""""""""""""""""""""""""""""""
" => Ctrlp
""""""""""""""""""""""""""""""
Bundle 'kien/ctrlp.vim'
" \h gives you history switching
map <leader>h :CtrlPMRU<CR>
" \b gives you buffer switching
map <leader>b :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = '\.git$'

filetype plugin indent on
