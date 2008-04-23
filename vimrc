" A system initialization file is located at /usr/share/vim/vimrc
" That file is read first, we only need to add new settings here.

set backupdir=~/.vim/backupfiles,~/tmp,.
set listchars=eol:¶,tab:»·
set fillchars=vert:\ ,fold:-
set number
set showmatch
set ch=2
set foldcolumn=4
set hidden
set visualbell
set wildmenu
set wildignore=*.pyc

color desert

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

" Switch-On Unicode processing.
runtime scripts/set_utf8.vim

