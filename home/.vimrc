""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMRC
"
" Bryan Woolsey
" https://github.com/ragnarkon
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

" Remap esc to jk
inoremap jk <esc>
inoremap kj <esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS AND SYNTAX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show line numbers
set number

" Show colors
if (has("termguicolors"))
  set termguicolors
else
  let g:onedark_termcolors=16
endif
filetype plugin indent on
syntax enable

" Set tabs character to two spaces
set tabstop=2
set softtabstop=2

" Fix backspace
set backspace=2

" Turn tabs into spaces
set expandtab

" Auto intenting
set ai
set si
set shiftwidth=2

" Folding
set foldmethod=indent
set foldnestmax=1

" Extension specific syntax highlighting for Puppet
augroup PuppetSyntax
  autocmd BufRead,BufNewFile *.eyaml set filetype=yaml
augroup END

" Golang likes 4-space tabs
augroup GoSyntax
  autocmd FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab!
augroup END

" Python also likes 4-space tabs, but not expandtab
augroup PySyntax
  autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

" Auto-remove trailing whitespace upon write
autocmd FileType puppet,ruby,go,python autocmd BufWritePre <buffer> %s/\s\+$//e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM INTERFACE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show current position
set ruler

" Highlight current line
set cursorline

" Hide buffer after it is abandoned
set hid

" Automatic line break on 500 characters
set lbr
set wrap " wrap lines

" Line wrap on Markdown files
augroup WrapLineInMDFile
  autocmd!
  autocmd FileType markdown setlocal tw=174
  autocmd FileType markdown setlocal fo+=aw
  autocmd FileType markdown setlocal fo-=l
augroup END

" Lazy redraw (improve performance)
set lazyredraw

" Height of command bar
set cmdheight=2

" Always show status line
set laststatus=2

" Format status line so I have something when lightline isn't installed
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCHING & HIGHLIGHTING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search automatically as characters are entered
set incsearch

" Highlight search results
set hlsearch

" Ignore case when searching
set ignorecase

" Try to be smart about case
set smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
try
  execute pathogen#infect()
catch
endtry

" OneDark
colorscheme onedark

" Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-g> <Plug>(ale_go_to_definition)
let g:lightline#ale#indicator_checking = 'L ..'
let g:ale_completion_enabled = 1

" FZF
nnoremap \ :Rg<CR>
nnoremap <C-T> :Files<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>s :BLines<cr>

" Lightline
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#unnamed     = '[No Name]'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch' ],
      \             [ 'readonly', 'filename', 'modified'],
      \             [ 'buffers' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'colorscheme': 'onedark',
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [['close']]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left'
      \ }
      \ }

" IndentLine
let g:indentLine_color_gui = '#4b5263'
let g:indentLine_fileTypeExclude = ['markdown', 'json']
let g:vim_json_syntax_conceal = 0

" Terraform
let g:terraform_align = 1
let g:terraform_fold_sections = 1
let g:terraform_fmt_on_save = 1

" polyglot
" NOTE: uninstalled for now, may reinstall later
" let g:polyglot_disabled = ['puppet']
" let g:csv_no_conceal = 1

" Git Gutter
set updatetime=500

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILE, BACKUPS, UNDO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search through subdirectories when finding a file
set path+=**

" Display matching files when we tab complete
set wildmenu

" Turn backup off
set nobackup
set nowb
set noswapfile
