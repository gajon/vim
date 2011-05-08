" A system initialization file is located at /usr/share/vim/vimrc
" That file is read first, we only need to add new settings here.

" GLOBAL OPTIONS ------------------------------------------------------------

set autoindent
set backup
set backupdir=~/.vim/backupfiles,~/tmp,.
set cmdheight=2
set fillchars=vert:\ ,fold:-
set foldcolumn=0
set hidden
set history=1000
set hlsearch
set incsearch
set ignorecase
set list
set listchars=eol:¶,tab:»·,trail:·,extends:»,precedes:«
set nowrap
"set number
set relativenumber
set ruler
set scrolloff=3
set shiftwidth=4
set showcmd
set showmatch
set smartcase "Override 'ignorecase' when search contains upper case chars.
set tabstop=4
set textwidth=76
set title
set visualbell
set wildignore=.git,.hg,.svn,*.a,*.class,*.gif,*.jpg,*.o,*.obj,*.png,*.pyc,*.so,*.swp,*.fasl,*.fas,*.lib
set wildmenu


filetype off
call pathogen#runtime_append_all_bundles()
syntax on
filetype plugin indent on

" Change the <Leader>
"let mapleader=","

color desert


" MAPPINGS ------------------------------------------------------------------

" Complete line.
inoremap  

" Browse through the buffers.
nmap <special> <C-Up> :bnext<CR>
nmap <special> <C-Down> :bprevious<CR>
" For the moment the above mapings of <C-Up/Down> are not working in rxvt, but
" the below mappings with the explicit key code do.
" XXX We should figure out why rxvt does not maps the keys correctly.
nmap Oa :bnext<CR>
nmap Ob :bprevious<CR>

" Move to a window and maximize the area.
nmap <C-K> <C-W>k<C-W>_<C-W><Bar>
nmap <C-J> <C-W>j<C-W>_<C-W><Bar>
nmap <C-H> <C-W>h<C-W>_<C-W><Bar>
nmap <C-L> <C-W>l<C-W>_<C-W><Bar>

" Currently I have Tab mapped to snippetsEmu
"nnoremap <Tab> %
"vnoremap <Tab> %

nnoremap <leader><space> :noh<cr>

"nnoremap / /\v
"vnoremap / /\v

nnoremap j gj
nnoremap k gk

nnoremap ; :

" reselect the text that was just pasted
nnoremap <leader>v V`]

" Strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>


" ADDITIONAL SCRIPTS AND PLUGINS --------------------------------------------

" Switch-On Unicode processing.
runtime scripts/set_utf8.vim


" OPTIONS FOR ADDITIONAL PLUGINS ---------------------------------------------

" Options for xml.vim plugin (see :help xml-plugin.txt)
let xml_use_xhtml=1

" Options for NERDTree plugin (see :help NERDTree).
let NERDTreeIgnore=['\.pyc$', '\~$']
nnoremap <silent> ,tr :NERDTreeToggle<CR>

" Options for taglist (see :help taglist.txt)
nnoremap <silent> ,tl :TlistToggle<CR>
let Tlist_Inc_Winwidth = 0 " terminal doesn't support changing the window width.
"let Tlist_Close_On_Select = 1 " close the taglist window when a tag is selected.
"let Tlist_Use_Right_Window = 1 " split taglist window on the rightmost side. 

" Quick buffer explorer (qbuf)
let g:qb_hotkey = ",b"

" Options for DirDiff plugin.
let g:DirDiffExcludes = "CVS,.git,.hg,*.class,*.exe,*.EXE,.*.swp,*.mdb,*.db,*.pdf,*.PDF,*.jpg,*.JPG,*.pyc,*.class"

let g:lisp_rainbow = 1

" Highligth everything that goes beyond the 80th column.
" Deprecated with Vim 7.3's new colorcolumn feature.
"highlight OverLength ctermbg=red ctermfg=white
"match OverLength /\%81v.*/

autocmd FileType text setlocal textwidth=78


" highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
autocmd FileType php let php_sql_query=1
autocmd FileType php let php_htmlInStrings=1
autocmd FileType php let php_noShortTags=1
autocmd FileType php let php_folding=1

autocmd FileType php setlocal makeprg=php\ -l\ %
autocmd FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l


"nmap <silent> <F4>
	"\ :!ctags -f ./tags
	"\ --langmap="php:+.inc"
	"\ -h ".php.inc" -R --totals=yes
	"\ --tag-relative=yes --PHP-kinds=+cf-v .<CR>


autocmd FileType ruby setlocal et sw=2 ts=2



" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif
