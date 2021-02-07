" source ~/.vim/plugin.vim
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'wakatime/vim-wakatime'

" ColorScheme
Plug 'jacoborus/tender.vim'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'

" Initialize plugin system

call plug#end()

set nocompatible
set encoding=utf-8

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

syntax on
filetype plugin on      " use the file type plugins
filetype indent on


" colorscheme onedark
" colorscheme papercolor
" colorscheme railscasts
" colorscheme solarized
" colorscheme koehler
" colorscheme tender
colorscheme molokai
if has('gui_running')
    set background=light
else
    set background=dark
endif
" colorscheme solarized

set guifont=Fira\ Code:h16


let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

" Have fantastic italic Comment in vim
" https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
" highlight Comment cterm=italic
" highlight Keyword cterm=italic
" hi javaScrptFunction guifg=#CC7833 ctermfg=167 cterm=italic
" hi htmlArg guifg=#CC7833 ctermfg=167 cterm=italic
" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

" Set nocursorline when FocusLost
let g:vitality_tmux_can_focus = 1
au VimEnter,WinEnter,BufWinEnter,FocusGained,CmdwinEnter * setlocal cursorline
au WinLeave,FocusLost,CmdwinLeave * setlocal nocursorline

" safe write
set backupcopy=yes
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set timeoutlen=500 ttimeoutlen=0
set history=1000        " boost commands and search patterns history
set undolevels=1000     " boost undo levels
" Use system Clipboard
set clipboard=unnamed
" Non-tmux-env use clipboard
" if $TMUX == ''
"   set clipboard+=unnamed
" endif
set ai                  " auto indenting
set ruler               " show the cursor position
set hlsearch
set incsearch           " highlight dynamically as pattern is typed
set ignorecase
set smartcase
set gdefault
set cmdheight=1         " better with airline line-height
set autoread
" Always show status line
set laststatus=2
" status bar
" set statusline=%F%m%r%h%w\  "fullpath and status modified sign
" set statusline+=\ %y "filetype
" set statusline+=\ %{fugitive#statusline()}
" Show the current mode
set showmode
" Highlight cursorline
set cursorline
" Made command-line easy
set wildmenu
" Use zsh full menu
set wildmode=full
" Show the filename in the window titlebar
set title
" Use zsh for command-line
set shell=zsh
let g:is_bash=1

set wrap
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Show line number
set number
set nolist
" Show invisible characters
set listchars=eol:←,nbsp:_
" Indicator chars
set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
set linebreak
set showbreak=↪\
" repeat the search performed on one buffer or another
set gdefault

" Disable swap files; systems don't crash that often these days
set updatecount=0

" Allow cursor keys in insert mode
set esckeys
set autoindent
set breakindent
" Allow backspace in insert mode
set backspace=indent,eol,start
set complete-=i
" Optimize for fast terminal connections
set ttyfast
set lazyredraw

set scrolljump=1    " minimal number of lines to scroll vertically
set scrolloff=4     " number of lines to keep above and below the cursor
"   typing zz sets current line at the center of window
set sidescroll=1    " minimal number of columns to scroll horizontally
set sidescrolloff=4 " minimal number of columns to keep around the cursor

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set showcmd

" 定义快捷键的前缀，即<Leader>
let mapleader=","

" window resizing
" Try fix
noremap <S-Left> <C-w><
map <S-Down> <C-w>-
map <S-Up> <C-w>+
map <S-Right> <C-w>>

" NERDTree shortcut keys
" Must added after mapleader
nnoremap <Leader>nn :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>

" Prompt for a command to run map
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vm :VimuxPromptCommand("make ")<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
let VimuxUseNearest = 0

" Goyo Write Mode
nnoremap <silent> <leader>z :Goyo<cr>

" yank to system clipboard
map <Leader>y "*y
" Reload current file
noremap <silent> <Leader>r :e!<CR>

" move to the position where the last change was made
noremap gI `.
" Quickly select the text that was just pasted. This allows you to, e.g.,
" indent it after pasting.
noremap gV `[v`]`]`
" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
" I use dot opreator instead now.
" vnoremap < <gv
" vnoremap > >gv

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e.
" the same as yy).
noremap Y y$
" Make Ctrl-e jump to the end of the current line in the insert mode. This is
" handy when you are in the middle of a line and would like to go to its end
" without switching to the normal mode.
inoremap <silent> <C-e> <C-o>$

" move cursor wihout leaving insert mode
try
  redir => s:backspace
  silent! execute 'set ' 't_kb?'
  redir END
  if s:backspace !~ '\^H'
    inoremap <C-h> <C-o>h
    inoremap <C-j> <C-o>j
    inoremap <C-k> <C-o>k
    inoremap <C-l> <C-o>l
  endif
finally
  redir END
endtry

inoremap <silent>jj <ESC>
" shortcuts for :tabn X
noremap <silent><tab>t :tabnew<cr>
noremap <silent><tab>x :tabclose<cr>
noremap <silent><tab>n :tabn<cr>
noremap <silent><tab>p :tabp<cr>
noremap <silent><leader>t :tabnew<cr>
noremap <silent><leader>g :tabclose<cr>
noremap <silent><leader>1 :tabn 1<cr>
noremap <silent><leader>2 :tabn 2<cr>
noremap <silent><leader>3 :tabn 3<cr>
noremap <silent><leader>4 :tabn 4<cr>
noremap <silent><leader>5 :tabn 5<cr>
noremap <silent><leader>6 :tabn 6<cr>
noremap <silent><leader>7 :tabn 7<cr>
noremap <silent><leader>8 :tabn 8<cr>
noremap <silent><leader>9 :tabn 9<cr>
noremap <silent><leader>0 :tabn 10<cr>
noremap <silent><s-tab> :tabnext<cr>
inoremap <silent><s-tab> <ESC>:tabnext<cr>

" set terminal and map alt+n or alt+shift+n to "<ESC>]{0}n~"
if !has('gui_running')
  noremap <silent><ESC>{0}1~ :tabn 1<cr>
  noremap <silent><ESC>{0}2~ :tabn 2<cr>
  noremap <silent><ESC>{0}3~ :tabn 3<cr>
  noremap <silent><ESC>{0}4~ :tabn 4<cr>
  noremap <silent><ESC>{0}5~ :tabn 5<cr>
  noremap <silent><ESC>{0}6~ :tabn 6<cr>
  noremap <silent><ESC>{0}7~ :tabn 7<cr>
  noremap <silent><ESC>{0}8~ :tabn 8<cr>
  noremap <silent><ESC>{0}9~ :tabn 9<cr>
  noremap <silent><ESC>{0}0~ :tabn 10<cr>
  inoremap <silent><ESC>{0}1~ <ESC>:tabn 1<cr>
  inoremap <silent><ESC>{0}2~ <ESC>:tabn 2<cr>
  inoremap <silent><ESC>{0}3~ <ESC>:tabn 3<cr>
  inoremap <silent><ESC>{0}4~ <ESC>:tabn 4<cr>
  inoremap <silent><ESC>{0}5~ <ESC>:tabn 5<cr>
  inoremap <silent><ESC>{0}6~ <ESC>:tabn 6<cr>
  inoremap <silent><ESC>{0}7~ <ESC>:tabn 7<cr>
  inoremap <silent><ESC>{0}8~ <ESC>:tabn 8<cr>
  inoremap <silent><ESC>{0}9~ <ESC>:tabn 9<cr>
  inoremap <silent><ESC>{0}0~ <ESC>:tabn 10<cr>
endif
" Fix quickfix buffer
set switchbuf=useopen,usetab,newtab
" <leader>w writes the whole buffer to the current file
nnoremap <silent> <leader>w :w!<CR>
inoremap <silent> <leader>w <ESC>:w!<CR>
" <leader>W save a file as root (;W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" <leader>q quits the current window
nnoremap <silent> <leader>q :q<CR>
inoremap <silent> <leader>q <ESC>:q<CR>

" fix vue syntax highlights
nnoremap <silent> ff :syntax sync fromstart<CR>
" let g:vue_disable_pre_processors=1

" <Tab> indents if at the beginning of a line; otherwise does completion
" function! InsertTabWrapper()
"   let col = col('.') - 1
"   if !col || getline('.')[col - 1] !~ '\k'
"     return "\<tab>"
"   else
"     return "\<c-n>"
"   endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-p>

" undo in insert model
inoremap <C-U> <C-G>u<C-U>

let g:SuperTabDefaultCompletionType = '<C-n>'
" Use Ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets = "<c-s-Tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit= "vertical"
" Maybe try this
" let g:UltiSnipsSnippetsDir='/Users/[user_name]/.vim/mysnippets'
" let g:UltiSnipsSnippetDirectories=["mysnippets"]

" Fix arrow keys abcd in normal & insert mode ...
imap OA <ESC>ki
imap OB <ESC>ji
imap OC <ESC>li
imap OD <ESC>hi
nmap OA <ESC>k
nmap OB <ESC>j
nmap OC <ESC>l
nmap OD <ESC>h


" paste lines from unnamed register and fix indentation
nmap <leader>p pV`]=
nmap <leader>P PV`]=

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" Strip trailing whitespace (;ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>


" Red whitespace
" autocmd BufEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

" toggle between last open buffers
" nnoremap <leader><leader> <c-^>

" auto set relative / absolute number
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber
"
" set relative / absolute number toggle
" function! NumberToggle()
"   if(&relativenumber != 1)
"     set relativenumber
"   else
"     set number
"   endif
" endfunc

" nnoremap <leader>n :call NumberToggle()<cr>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Resize splits when the window is resized
autocmd VimResized * :wincmd =
" disable Ex mode
nnoremap Q <nop>"

" Backup ------------------------------------ "
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile " no swap files"


" Split ------------------------------------ "
set splitright
set splitbelow
" Fugitive
command! GdiffInTab tabedit %|vsplit|Gdiff
nnoremap <leader>sd :GdiffInTab<cr>
nnoremap <leader>D :tabclose<cr>
nnoremap <leader>S :Gstatus<cr>

" TODO Vim script
" standard-format -w [filename]

" Browser Reload
nnoremap <silent> <leader>br :ChromeReload<cr>

" Easymotion
" Move to word
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
xmap <Leader><Leader>w <Plug>(easymotion-bd-w)
omap <Leader><Leader>w <Plug>(easymotion-bd-w)
" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Small functions ----------------------------- "

" Rename file with <leader>rn "
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
nnoremap <leader>rn :call RenameFile()<cr>

" " Run standard-format and save
" function! RunStandardFormat()
"   let file = expand('%')
"   let cmd = 'standard-format -w'. file
"   :call VimuxRunCommand(cmd)
" endfunction
" nnoremap <leader>fm :call RunStandardFormat()<cr>

function! RunJSTests()
  let cwd = getcwd()
  let cmd = 'npm test'

  if match(expand("%"), '\(_spec.js\|_test.js\)$') != -1
    let t:test_file = expand("%")
  endif

  if exists("t:test_file")
    if filereadable("node_modules/jest-cli/bin/jest.js")
      if match(cwd, '\<partners_ui\>') != -1
        let cmd = E_PATH=build/cjs jest '. t:test_file
      else
        let cmd = 'jest '. t:test_file
      endif
    endif
  endif

  :call VimuxRunCommand(cmd)
endfunction
" nnoremap <Leader>t :call RunJSTests()<CR>

function! RunAllJSTests()
  :call VimuxRunCommand('npm test')
endfunction
nnoremap <Leader>T :call RunAllJSTests()<CR>

function! BuildJS()
  let cwd = getcwd()
  call VimuxRunCommand('clear; npm run build')
endfunction
" nnoremap <Leader>b :call BuildJS()<CR>

augroup ensure_directory_exists
  autocmd!
  autocmd BufNewFile * call s:EnsureDirectoryExists()
augroup END

function! s:EnsureDirectoryExists()
  let required_dir = expand("%:h ")

  if !isdirectory(required_dir)
    " Remove this if-clause if you don't need the confirmation
    if !confirm("Directory '" . required_dir . "' doesn't exist. Create it?")
      return
    endif

    try
      call mkdir(required_dir, 'p')
    catch
      echoerr "Can't create '" . required_dir . "'"
    endtry
  endif
endfunction

" goto require File
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

if has("autocmd")
    " Enable file type detection
    " filetype on
    autocmd FileType .vimrc setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 textwidth=79 expandtab
    autocmd Filetype gitcommit setlocal spell textwidth=72
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
    " Vue
    autocmd FileType vue syntax sync fromstart
    autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.es6 setlocal filetype=javascript
    autocmd BufNewFile,BufRead .babelrc setlocal filetype=json
    autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
    " Standard JS Code style
    " autocmd bufwritepost *.js silent !standard-format -w %
    " Treat .wxss as .css / .wxml as .html
    autocmd BufNewFile,BufRead *.wxss setlocal filetype=css
    autocmd BufNewFile,BufRead *.wxml setlocal filetype=html
endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown,hbs setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end


" -- spell checking ------------------------------------------------------------
set spelllang=en  " English only
set nospell       " disabled by default

if has("autocmd")
  augroup spell
    autocmd!
    " autocmd filetype vim setlocal spell " enabled when editing .vimrc
  augroup END
endif


" Autoreload .vimrc when saved
set autoread
" Sometimes not working properly
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

if !has('gui_running')
  set t_Co=256
endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('hbs', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jsx', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('es6', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff','#151515')

let g:NERDTreeNodeDelimiter = "\u00a0"

" vim:set ft=vim et sw=2:
