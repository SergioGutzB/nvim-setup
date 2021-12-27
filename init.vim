set number
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
syntax on
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set nocompatible

call plug#begin('~/.vim/plugged')

" Syntax
Plug 'sheerun/vim-polyglot'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'dikiaap/minimalist'

" Tree
Plug 'scrooloose/nerdtree'

" Typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" Tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Autocomplete 
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']


" TSX
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'


" Test
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'

" IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

" react
Plug 'mlaursen/vim-react-snippets'

call plug#end()


set t_Co=256
colorscheme minimalist

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase    " searches are case insensitive
set smartcase   " ... unless the containg at least one capital letter

" ===============================================================================================
" CONFIG PLUGS
" ===============================================================================================

" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

" autocmd VimEnter * FindFileCache .

" NERD Commenter
filetype plugin on

let g:NERDSpaceDelims = 2
let g:NERDCustomDelimiters={ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' } }


" VIM-AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" CtrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*

" javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,backbone,d3,react,jquery,vue,handlebars'


" ===============================================================================================
" MAPING
" ===============================================================================================


let mapleader=","

" testing
nnoremap <Leader>t: TestNearest<CR>
nnoremap <Leader>T: TestFile<CR>
nnoremap <Leader>TT: TestSuite<CR>


" split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

nnoremap <Leader>ps :Rg<SPACE>

" folding
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> fzf

" quick semi
nnoremap <F2> :noa w  <CR><space>
nnoremap <C-F2> :noa wall  <CR><space>

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

" shorter commands
cnoreabbrev tree NERDTreeToggle
cnoreabbrev blame Gblame
cnoreabbrev find NERDTreeFind
cnoreabbrev diff Gdiff

" plugs
nmap <leader>nn :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>

nmap <leader>s <Plug>(easymotion-s)

" vim-jsdoc
nmap <silent> <C-l> <Plug>(jsdoc)

map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

" tmux navigator
nnoremap <silent> <Leader><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader><C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <Leader><C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <Leader><C-l> :TmuxNavigateRight<cr>

" diagnostics
nnoremap <Leader>kp :let @*=expand("%")<cr>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" tab navigations
map <Leader>h :tabprevious<cr>
map <Leader>l :tabnext<cr>


" buffers
map <Leader>ob :Buffers<cr>

" faster scrolling
nnoremap <C-j> 10<C-e>
nnoremap <C-k> 10<C-y>
map <Leader>s <Plug>(easymotion-s2)


" git
nnoremap <Leader>G :G<cr>
nnoremap <Leader>gp :Gpush<cr>
nnoremap <Leader>gl :Gpull<cr>

" run current file
nnoremap <Leader>x :!node %<cr>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" :  coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


