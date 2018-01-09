set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
" set the runtime path to include Vundle and initialize

" ColorScheme
" OK, Now I just use colors/railscast
" Plug 'thinkpixellab/flatland', {'rtp': 'Vim/'}
" Plug 'mhumeSF/one-dark.vim'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'altercation/vim-colors-solarized'

" NERDTree Git Plug
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeWinSize = 26


" " Vim & tmux auto focus & blur
Plug 'sjl/vitality.vim'

Plug 'tpope/vim-fugitive'
" https://github.com/tpope/vim-fugitive/blob/aac85a268e89a6c8be79341e130ac90256fadbd6/plugin/fugitive.vim#L2351V
let g:fugitive_github_domains = ['https://github.intra.douban.com', 'github.com']
" https://github.com/tpope/vim-fugitive/blame/master/plugin/fugitive.vim#L2381
Plug 'tpope/vim-rhubarb'
let g:github_enterprise_urls = ['https://github.intra.douban.com']

" vim-gitgutter
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed = '|'
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 0

Plug 'tpope/vim-commentary'
" Plug 'scrooloose/nerdcommenter'

" " CTags
Plug 'craigemery/vim-autotag'

" JS editing
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
" tern
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDefSplit<CR>
" autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
"
" Syntax
Plug 'moll/vim-node'
Plug 'othree/html5.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'

" Markdown
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_new_list_item_indent = 2

" Vim Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'
" Run vim cmd in tmux
Plug 'benmills/vimux'
" BrowserReload
Plug 'tell-k/vim-browsereload-mac'
let g:returnApp = "iTerm"
" let g:returnAppFlag = 0

Plug 'mattn/emmet-vim'
let g:user_emmet_expandabbr_key = '<c-y>,'
let g:user_emmet_mode= 'i'          " enable only in insert mode
let g:user_emmet_install_global = 0 " enable just for html/css
autocmd FileType html,css,markdown,jsx,js EmmetInstall
let g:user_emmet_settings = {
\  'wxss': {
\    'extends': 'css',
\  },
\  'wxml': {
\    'extends': 'html',
\    'aliases': {
\      'div': 'view',
\      'span': 'text',
\    },
\  },
\  'default_attributes': {
\     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
\     'navigator': [{'url': '', 'redirect': 'false'}],
\     'scroll-view': [{'bindscroll': ''}],
\     'swiper': [{'autoplay': 'false', 'current': '0'}],
\     'icon': [{'type': 'success', 'size': '23'}],
\     'progress': [{'precent': '0'}],
\     'button': [{'size': 'default'}],
\     'checkbox-group': [{'bindchange': ''}],
\     'checkbox': [{'value': '', 'checked': ''}],
\     'form': [{'bindsubmit': ''}],
\     'input': [{'type': 'text'}],
\     'label': [{'for': ''}],
\     'picker': [{'bindchange': ''}],
\     'radio-group': [{'bindchange': ''}],
\     'radio': [{'checked': ''}],
\     'switch': [{'checked': ''}],
\     'slider': [{'value': ''}],
\     'action-sheet': [{'bindchange': ''}],
\     'modal': [{'title': ''}],
\     'loading': [{'bindchange': ''}],
\     'toast': [{'duration': '1500'}],
\     'audio': [{'src': ''}],
\     'video': [{'src': ''}],
\     'image': [{'src': '', 'mode': 'scaleToFill'}],
\   },
\}


" Gist Vim
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'



" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9

" Async syntax checker
Plug 'w0rp/ale'
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '--'
nmap <silent> <C-N> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = '~/.nvm/versions/node/v8.0.0/bin/eslint'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'base16_eighties'
" let g:solarized_base16 = 1
" let g:airline_solarized_normal_green = 1
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:syntastic_stl_format = "[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

Plug 'ervandew/supertab'
" Vim Snippets Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Plug 'justinj/vim-react-snippets'
" To use python version 2.x: >
" let g:UltiSnipsUsePythonVersion = 2
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"
" indentLines
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
let g:indentLine_color_term = 237
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', 'md', 'json']
let g:indentLine_leadingSpaceChar = '·'
" For a better indent, no longer see quote in json.vim, sad.
" let g:indentLine_setConceal = 0

" Search Files
Plug 'mileszs/ack.vim'
" Files Open efficiently
Plug 'ctrlpvim/ctrlp.vim'

" Motion
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" JavaScript indentation and syntax support.
Plug 'pangloss/vim-javascript'
let g:javascript_enable_domhtmlcss = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1


" CSS3
Plug 'hail2u/vim-css3-syntax'
" Styled-components
Plug 'fleischie/vim-styled-components'

" Syntax Hightlight of jsx
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0  " Allow JSX in normal js files
" Typescript *.ts *tsx
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" Goyo Write mode
Plug 'junegunn/goyo.vim'
" Here END
" iA write emulator
Plug 'amix/vim-zenroom2'

" WakaTime
Plug 'wakatime/vim-wakatime'
" let g:wakatime_ScreenRedraw = 1

" call vundle#end()            " required
call plug#end()
filetype plugin indent on    " required
