" The commands in this are executed when the GUI is started.

set mousehide

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

let c_comment_strings=1

"set guifont=Menlo\ Regular:h12
"set guifont=Inconsolata-dz:h12
"set guifont=Terminus:h14 noantialias
set guifont=7x14:h14 noantialias
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions+=c

" These are some coloschemes I like:
"colorscheme pyte         "perfect for gvimdiff
"colorscheme zenburn
"coloschemes candycode
"colorscheme desert
"colorscheme desertEx
"colorscheme dusk
"colorscheme metacosm
"colorscheme molokai
"colorscheme Mustang
"colorscheme kib_plastic "good for Python files.
"colorscheme habiLight
"colorscheme professional
"colorscheme moria
"color silent

"color ps_color
"highlight FoldColumn guibg=#000000

" Solarized colorscheme, :help solarized
syntax enable
set background=light
colorscheme solarized
source ${HOME}/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim


" When we are in diff mode, 'pyte' is a better choice
"if &diff
"  colorscheme pyte
"endif

" Highligth everything that goes beyond the 80th column.
highlight OverLength guibg=#ffdd88


""""""""""""""""""""""""""""""""
" For use with :TOhtml
let html_use_css=1
let use_xhtml=1
