" The commands in this are executed when the GUI is started.

set mousehide

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

let c_comment_strings=1

set guifont=Terminus\ 12
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=L
set guioptions+=c

" These are some coloschemes I like:
"colorscheme pyte         "perfect for gvimdiff
"colorscheme zenburn
"colorscheme desert
"colorscheme dusk
"colorscheme metacosm
"colorscheme kib_plastic "good for Python files.
"colorscheme habiLight
"colorscheme professional
"colorscheme moria

color ps_color
highlight FoldColumn guibg=#000000

" When we are in diff mode, 'pyte' is a better choice
if &diff
  colorscheme pyte
endif

" Highligth everything that goes beyond the 80th column.
highlight OverLength guibg=#ffdd88
