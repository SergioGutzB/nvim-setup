set number
set mouse=r
set numberwidth=1
set clipboard=unnamedplus
syntax on
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set shiftwidth=2
set tabstop=2 softtabstop=2
set cmdheight=2
set mat=2
set nojoinspaces
set smartcase
set noswapfile
set autoindent
set smartindent
set backupcopy=yes

set guifont=Inconsolata\ Nerd\ Font\ 14
" set guifont=DroidSansMono\ Nerd\ Font\ 11

filetype on



set nocompatible

call plug#begin('~/.vim/plugged')

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'thanethomson/vim-jenkinsfile'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Themes
Plug 'morhetz/gruvbox'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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
Plug 'honza/vim-snippets'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-eslint', 'coc-yaml', 'coc-deno', 'coc-cssmodules', 'coc-powershell', 'coc-sh', 'coc-groovy', 'coc-snippets', 'coc-todolist', 'coc-clangd', 'coc-cmake', 'coc-clang-format-style-options', 'coc-docker']

" let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-eslint', 'coc-yaml', 'coc-styleint', 'coc-deno', 'coc-cssmodules', 'coc-dot-complete', 'coc-highlight', 'coc-nginx', 'coc-powershell', 'coc-python', 'coc-rome', 'coc-sh']


" Javascript
Plug 'othree/javascript-libraries-syntax.vim'

" TSX
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

" Test
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'

" IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'dimercel/todo-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'bkad/camelcasemotion'
Plug 'chiedo/vim-case-convert'


" git
Plug 'tpope/vim-fugitive'

call plug#end()

filetype plugin indent on    " required
let g:vim_json_syntax_conceal = 0

set t_Co=256

colorscheme gruvbox
set background=dark    " Setting dark mode


let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

autocmd vimenter * ++nested colorscheme gruvbox
" autocmd vimenter * luafile lua/treesitter.lua

hi Normal guibg=NONE ctermbg=NONE

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

" NERD Tree
let g:NERDCustomDelimiters = { 'c': { 'left': '/**', 'right': '*/'} }
let g:NERDDefaultAlign = 'right'
let g:NERDTreeQuitOnOpen=1
nmap <leader>nn :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>

" NERD Commenter
filetype plugin on
filetype plugin indent on

let g:NERDSpaceDelims = 2
let g:NERDCustomDelimiters={ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' } }

" Ident Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 6
let g:indent_guides_soft_pattern = ' '

" devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" let g:DevIconsEnableFolderExtensionPatternMatching = 0

if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif

if (has("termguicolors"))
  set termguicolors
endif


" VIM-AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" CtrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee|build\|public'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/dist/*,*/build/*

" javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,backbone,d3,react,jquery,vue,handlebars'


" UltiSnips
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']


" coc-snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" =========================================
" ========= RAINBOW ============
" =========================================

" let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
" let g:rainbow_active = 1

" let g:rainbow_active = 1

" let g:rainbow_load_separately = [
    " \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    " \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    " \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    " \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    " \ [ '*.{js,jsx,ts,tsx}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    " \ ]


" ===============================================================================================
" MAPING
" ===============================================================================================


let mapleader=","

" testing
nnoremap <Leader>t: TestNearest<CR>
nnoremap <Leader>T: TestFile<CR>
nnoremap <Leader>TT: TestSuite<CR>


" split resize
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>+ :vertical resize +10<CR>
nnoremap <silent> <Leader>- :vertical resize -10<CR>

nnoremap <Leader>ps :Rg<SPACE>

" folding
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> fzf

" Dimercel/todo-vim
nmap <F5> :TODOToggle<CR>

" quick semi
nnoremap <F2> :noa w  <CR><space>
nnoremap <C-F2> :noa wall  <CR><space>

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

" shorter commands
cnoreabbrev tree NERDTreeToggle
" cnoreabbrev blame Gblame
cnoreabbrev find NERDTreeFind
cnoreabbrev diff Gdiff

" plugs
nmap <leader>nn :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>

nmap <leader>s <Plug>(easymotion-s)

" vim-jsdoc
nmap <leader>jd <Plug>(jsdoc)

map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

" tmux navigator
nnoremap <silent> <Leader><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader><C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <Leader><C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <Leader><C-l> :TmuxNavigateRight<cr>

nnoremap <silent> <Leader><C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader><C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <Leader><C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <Leader><C-Up> :TmuxNavigateUp<cr>

" diagnostics
nnoremap <Leader>kp :let @*=expand("%")<cr>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" nmap <silent> gb <Plug>(Gblame)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>ff <Plug>(coc-fix-current)
nmap <leader>mm :CocAction coc-fix-current<CR>
nmap <leader>fe :CocCommand eslint.executeAutofix<CR>
" coc - prettier
nmap <leader>P :CocCommand prettier.formatFile<CR>


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction 


" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

autocmd BufNewFile,BufReadPre,BufEnter
  \ */myproject/*.{js,jsx,ts,tsx}
  \ call coc#config('eslint.enable', v:false)

autocmd BufLeave
  \ */myproject/*.{js,jsx,ts,tsx}
  \ call coc#config('eslint.enable', v:true)

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

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

