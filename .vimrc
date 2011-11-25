filetype plugin indent on
syntax on
set noexpandtab
set tabstop=2
set shiftwidth=2
set showtabline=2
set number
set nowrap

" -- display tabs and trailing spaces
set list
set listchars=tab:»⋅,trail:⋅,nbsp:⋅
set list

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

" -- Mouse settings for terminal
set mouse=a
set ttymouse=xterm2


" -- tell the term ir has 256 colors available
set t_Co=256


" -- display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
	set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" -- display a warning if there's a syntax problem
set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

" --- Autocompletion stuff
set complete-=k complete+=k

" --- NERDTree Stuff
map § :NERDTreeToggle Sites<CR>

" --- Pretty stuff
colorscheme xoria256

if has("gui_macvim")
	set fuopt+=maxhorz
	set guioptions-=T
	"	set transparency=7
	set guifont=Monaco:h12
endif

cabbr te tabedit

" --- Ruby Stuff
au BufNew,BufRead Gemfile set syntax=ruby
au BufNew,BufRead irb_tempfile.rb.* set syntax=ruby

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
