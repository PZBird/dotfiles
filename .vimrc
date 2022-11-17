if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'AffanIndo/vim-todo-color'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-surround'

call plug#end()

autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript


let g:pear_tree_repeatable_expand = 0

" NerdTree
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['.pyc$', 'node_modules', '\.git']
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeBookmarksFile = $HOME.'/.vim/.NERDTreeBookmarks'
let NERDTreeMapUpdir = 'h'
let NERDTreeMapChangeRoot = 'l'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close vim if there is only nerdtree
nnoremap <C-f> :NERDTreeToggle<cr>

" Tab and indent
set autoindent
set shiftwidth=4 " The number of space characters that will be inserted when performing >> or <<
set softtabstop=4 " The number of space characters that will be inserted when the tab key is pressed,
set expandtab " Insert space characters whenever the tab key is pressed


" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Order imports
nmap <leader>i :CocCommand tsserver.organizeImports<cr>

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>
