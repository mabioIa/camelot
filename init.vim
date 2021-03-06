syntax on
set ma
set textwidth=79
set mouse=a
set cursorline
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set incsearch
set hlsearch
set ignorecase
set smartcase

set hidden
set showcmd
set ttyfast
set backspace=indent,eol,start

set autoread
set nobackup
set nowritebackup
set noswapfile
set nu
set foldlevelstart=99
set scrolloff=7

" Use y and p with the system clipboard
set clipboard=unnamedplus

set complete-=i
set omnifunc=syntaxcomplete#Complete

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_winsize=20
let g:netrw_browse_split=4

call plug#begin('~/.config/nvim/autoload/')
Plug 'arzg/vim-colors-xcode'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
" Pluig 'neoclide/coc.nvim', {'branch': 'release'} # :CocInstall coc-clangd coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-python coc-java
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'dense-analysis/ale'
Plug 'cloudhead/neovim-fuzzy'
Plug 'danilo-augusto/vim-afterglow'
Plug 'tmsvg/pear-tree'
Plug 'jhawthorn/fzy'
Plug 'tomlion/vim-solidity'
Plug 'phaazon/hop.nvim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'fatih/vim-go'
Plug 'rhysd/vim-grammarous'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fannheyward/telescope-coc.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'TimUntersberger/neogit'
Plug 'folke/todo-comments.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'frazrepo/vim-rainbow'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'mattn/emmet-vim'
call plug#end()

colorscheme xcodedarkhc

set encoding=UTF-8
let mapleader = " "

nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bf :bfirst<CR>
nnoremap <leader>bl :blast<CR>
nnoremap <C-p> :FuzzyOpen<CR>

nnoremap ccd :CocList diagnostics<CR>

nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ne :Telescope file_browser<CR>
nnoremap <leader>f :call CocAction('format')<CR>

autocmd StdinReadPre * let s:std

let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

noremap ff :resize 100 <CR> <BAR> :vertical resize 220<CR>
noremap fm <C-w>=

autocmd CursorHold * silent call CocActionAsync('highlight')

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

let g:pear_tree_repeatable_expand = 0
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 1
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '???${name}???'
let g:mkdp_filetypes = ['markdown']

nnoremap <C-p> :MarkdownPreview

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
nnoremap <leader>p :Prettier<CR> :ALEFix<CR>

let g:closetag_filenames = '*.html,*.js,*.jsx,*.tsx,*.njk,*.vue'
let g:closetag_xhtml_filenames = '*.js,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,js,jsx,tsx,vue,njk'
let g:closetag_xhtml_filetypes = 'js,jsx,tsx'
let g:closetag_shortcut = '>'
