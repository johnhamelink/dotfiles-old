
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" John's .vimrc of awesomeness.                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Many (infact probably most) of the parts of this        "
" config are not my own work, but have been stolen        "
" from other dotfiles and other stuff hanging around      "
" the web. While I haven't given credit (mainly because   "
" my vimrc is the amalgamation of about 3 months of       "
" incremental improvement based on need), I give out      "
" muchos-respectos to all those who I stole code snippets "
" from. Thanks collective community!                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
syntax on
set noexpandtab
set tabstop=2
set shiftwidth=2
set showtabline=2
set number
set nowrap
set ruler
set colorcolumn=80
set nocp


" -- display tabs and trailing spaces
set list
set listchars=tab:→⋅,trail:✜,nbsp:⋅
set list

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

" -- Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*


" -- Mouse settings for terminal
set mouse=a
set ttymouse=xterm2

" -- Force myself to use the correct keys!
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


" -- tell the term ir has 256 colors available
set t_Co=256


"" -- display a warning if fileformat isnt unix
"set statusline+=%#warningmsg#
	"set statusline+=%{&ff!='unix'?'['.&ff.']':''}
"set statusline+=%*

"" -- display a warning if there's a syntax problem
set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"set statusline+=%h      "help file flag
"set statusline+=%y      "filetype
"set statusline+=%r      "read only flag
"set statusline+=%m      "modified flag

" --- Autocompletion stuff
set complete-=k complete+=k

" --- Toggle NERDTree when the § key
"     is pressed in order to allow
"     easy navigation.
set autochdir
let NERDTreeChDirMode=2
map § :NERDTreeToggle .<CR>
" --- When opening a new tab, assume the PWD
"     of the previously focussed tab
au TabEnter silent! lcd g:path_frombefore
au TabLeave silent! let g:path_frombefore=expand("%:p:h")

" --- Set tagbar to behave similarly to
"     NERDTree, then set ± to toggle it.
let g:tagbar_autofocus = 1
let g:tagbar_singleclick = 1
let g:tagbar_usearrows = 1
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
map ± :TagbarToggle<CR>

" --- Pretty stuff
colorscheme xoria256

if has("gui_macvim")
	" Get rid of menubars that
	" are visible by default.
	set fuopt+=maxhorz
	set guioptions-=T

	"	Set the font to something
	"	nicer than the defaults
	set guifont=Monaco:h12
endif

cabbr te tabedit

" -- Trailing spaces are now coloured green
hi ExtraWhitespace guifg=#5fdf5f
" -- Define whitespace when entering the buffer
au BufEnter * match ExtraWhitespace /\s\+$/
" -- Define whitespace when inserting text
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" -- Define whitespace when leaving insert mode
au InsertLeave * match ExtraWhiteSpace /\s\+$/
" -- lastly, define the colour of non-trailing tabs
"    (Not as lurid as trailing space - a nice quiet grey).
hi SpecialKey guifg=#3a3a3a

hi ColorColumn guibg=#3a3a3a


" --- Ruby Stuff
au BufNew,BufRead Gemfile set syntax=ruby
au BufNew,BufRead irb_tempfile.rb.* set syntax=ruby

" --- Jade syntax
au BufNew,BufRead *.jade set filetype=jade

" --- JS Stuff
let $JS_CMD='node'
" JS code folding that works:
function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn sync fromstart
		syn sync maxlines=100
		syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen


" Auto-format JSON
autocmd FileType json set equalprg=json_reformat
" Colourise JSON using the javascript syntax
autocmd fileType json set syntax=javascript

" Lets save and load folding options, otherwise it's a pain in the ass!
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" -- Lets get a syntax-checker on the go
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1


" -- jump to last cursor position when opening a file
"    dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

" -- spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell


" -- Use * in visual mode to search forwards for the highlighted
"    text within the document.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" -- Use # in visual mode to search backwards for the highlighted
"    text within the document.
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" -- Automatic pipe-delimited table tabulariser (Courtesy Tim Pope)
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" ## automatically source the vimrc file after saving it changes appear
" without restarting vim
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" When saving a file trailing whitespace will automatically removed
augroup DeleteTrailingWhitespaces
  autocmd!
  " remember the position using ks| |'s
  autocmd BufWritePre * |call DeleteTrailingWhitespaces()|
augroup END

function! DeleteTrailingWhitespaces()
 let l = line(".")
 let c = col(".")
 execute "%s/\\s\\+$//ge"
 let last_search_removed_from_history = histdel('s', -1)
 call cursor(l, c)
endfunction


if exists("t:NERDTreeBufName")
	map <silent> <space> <CR>
endif
