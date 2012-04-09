
""""""""""""""""""""""""""""""
" => pathogen bundles
""""""""""""""""""""""""""""""
filetype off                               " Turn off filetype while we run the bundles
call pathogen#helptags()                   " Generate all the helpfiles
call pathogen#runtime_append_all_bundles() " Run the bundles
filetype on                                " Turn filetype on again


""""""""""""""""""""""""""""""
" => Basics
""""""""""""""""""""""""""""""
syntax on                 " Syntax mode!
filetype plugin indent on " We want indenting
set nocompatible " We don't need strict vi compatibility.
set ttyfast " Tells vim we have a fast connection to the terminal
set clipboard=unnamed     " Allows you to copy/paste from within the terminal


""""""""""""""""""""""""""""""
" => Explorer
""""""""""""""""""""""""""""""
" Hide .swp, .DS_Store and .localized files
let g:netrw_list_hide= '.*\.swp$,.DS_Store,.localized'


""""""""""""""""""""""""""""""
" => Tabbing and indenting
""""""""""""""""""""""""""""""
set tabstop=4     " Number of spaces a tab is worth
set shiftwidth=4  " Number of spaces used in an autoindent
set softtabstop=4 " Number of spaces a tab counts for when editing
set expandtab     " When in insert mode, number of spaces a tab counts for
set ai            " Auto Indent
set si            " Smart indent


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


""""""""""""""""""""""""""""""
" => Backups, undos and
"    swap files
""""""""""""""""""""""""""""""
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set backup
set noswapfile


""""""""""""""""""""""""""""""
" => File Encoding & line
"    endings
""""""""""""""""""""""""""""""
set ffs=unix,dos,mac " Default file types
set encoding=utf-8   " Set encoding to UTF-8 by default


""""""""""""""""""""""""""""""
" => Dictionary
""""""""""""""""""""""""""""""
set dictionary=/usr/share/dict/words " Use the default words dictionary


""""""""""""""""""""""""""""""
" => Searching
""""""""""""""""""""""""""""""
set incsearch  " Find the next match as we type the search
set hlsearch   " Highlight searches by default
set ignorecase " Ignore the casing of the search
set smartcase  " Only case about casing when caps are used


""""""""""""""""""""""""""""""
" => Tab completion
""""""""""""""""""""""""""""""
set wildmenu                                     " Turn on tab completion
set wildmode=list:longest,list:full              " Set it to the best sort
set wildignore+=*.rbc,*.class,vendor/gems/*      " Ignore ruby stuff
set wildignore+=.hg,.svn                    " Version control
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
" => Traversal
""""""""""""""""""""""""""""""
" Map the tab key to the tab matching command (%)
map <tab> %
set iskeyword-=_ " Vim now sees underscores as non-word characters.
autocmd BufEnter * silent! lcd %:p:h " Automatically move into current dir.
" Create a shortcut to do the same thing for good measure.
map <leader>cd :lcd %:p:h<cr>


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
" => Colour Schemes
""""""""""""""""""""""""""""""
colorscheme mustang " Set the theme to mustang

if has("gui_macvim")       " If we're running Macvim
        set fuopt+=maxhorz " Get rid of menubars that are visible by default.
        set guioptions-=T  " Remove the toolbar
        set guioptions-=r
        set guioptions-=R
        set guioptions-=l
        set guioptions-=e  " Remove Macvim tabs
        set stal=1         " Show the internal vim tabs only if there's >1 tab open

        set guifont=Monaco:h12 " Set the font to something nicer than the defaults
        set fuoptions=maxvert,maxhorz " Full screen means FULL screen
        " Turn off the visual/audio bell
        set vb t_vb=
endif


""""""""""""""""""""""""""""""
" => Healthy Habits
""""""""""""""""""""""""""""""
if has("gui_macvim") " If we're running Macvim
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
" => JSON
""""""""""""""""""""""""""""""
autocmd FileType json set equalprg=json_reformat " Auto-format JSON
autocmd fileType json set syntax=javascript " Colourise JSON using the javascript syntax


""""""""""""""""""""""""""""""
" => Source Control
""""""""""""""""""""""""""""""
autocmd filetype svn,*commit* setlocal spell " Spell check when writing commit logs


""""""""""""""""""""""""""""""
" => vimrc
""""""""""""""""""""""""""""""
" Automatically source the vimrc file after saving it changes appear
" without restarting vim
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif


""""""""""""""""""""""""""""""
" => Whitespace
""""""""""""""""""""""""""""""
" Display tabs and trailing spaces
set list
set listchars=tab:→⋅,trail:✜,nbsp:⋅
set list
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
" => NodeJS
""""""""""""""""""""""""""""""
let $JS_CMD='node' " Use node when evaluating JS syntax


""""""""""""""""""""""""""""""
" => Exuberant CTags
""""""""""""""""""""""""""""""
set tags+=./tags; " Look for tags file recursively backwards


""""""""""""""""""""""""""""""
" => Gist
""""""""""""""""""""""""""""""
" When sending code, copy
" resultant URL
" to the clipboard.
let g:github_token = ''            " Set your github token
let g:github_user  = ''            " Set your username
let g:gist_detect_filetype = 1                          " Set the filetype detection to on, so your paste is syntax highlighted
let g:gist_clip_command = 'pbcopy'                      " Set the command used to send the URL to the clipboard
let g:gist_private = 1                                  " Set the Gist to private by default


""""""""""""""""""""""""""""""
" => Ctrlp
""""""""""""""""""""""""""""""
" \h gives you history switching
map <leader>h :CtrlPMRU<CR>
" \b gives you buffer switching
map <leader>b :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = '\.git$'

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
set laststatus=2 " Always hide the statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


""""""""""""""""""""""""""""""
" => Powerline
""""""""""""""""""""""""""""""
if has("gui_macvim")                  " If we're running Macvim
    let g:Powerline_symbols = 'fancy' " Use Powerline's custom fonts to make our terminal pretty
endif


""""""""""""""""""""""""""""""
" => Symfony
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.twig setfiletype htmldjango " Twig support for Symfony


""""""""""""""""""""""""""""""
" => Threesome
""""""""""""""""""""""""""""""
" Make the local leader different from the
" global leader, for the sake of the threesome
" plugin.
let maplocalleader = ","
