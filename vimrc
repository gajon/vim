" A system initialization file is located at /usr/share/vim/vimrc
" That file is read first, we only need to add new settings here.

" GLOBAL OPTIONS ------------------------------------------------------------

set backupdir=~/.vim/backupfiles,~/tmp,.
set cmdheight=2
set fillchars=vert:\ ,fold:-
set foldcolumn=4
set hidden
set history=1000
set ignorecase
set listchars=eol:¶,tab:»·,trail:·,extends:»,precedes:«
set nowrap
set number
set scrolloff=3
set showmatch
set smartcase "Override 'ignorecase' when search contains upper case chars.
set title
set visualbell
set wildignore=.git,.hg,.svn,*.a,*.class,*.gif,*.jpg,*.o,*.obj,*.png,*.pyc,*.so,*.swp
set wildmenu

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
let g:DirDiffExcludes = "CVS,*.class,*.exe,*.EXE,.*.swp,*.mdb,*.db,*.pdf,*.PDF,*.jpg,*.JPG,*.pyc,*.class"

let g:lisp_rainbow = 1

" Highligth everything that goes beyond the 80th column.
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.*/
