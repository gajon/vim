
set nocompatible

" The default for 'backspace' is very confusing to new users, so change it to a
" more sensible value.  Add "set backspace&" to your ~/.vimrc to reset it.
set backspace+=indent,eol,start

" Disable localized menus for now since only some items are translated (e.g.
" the entire MacVim menu is set up in a nib file which currently only is
" translated to English).
set langmenu=none

set autoindent
set background=dark
set backup
set backupdir=~/.vim/backupfiles,~/tmp,.
set cmdheight=2
set expandtab
set fillchars=vert:\ ,fold:-
set foldcolumn=0
set hidden
set history=1000
set hlsearch
set incsearch
set ignorecase
set laststatus=2
set list
set listchars=eol:\ ,tab:»·,trail:∙,extends:»,precedes:«
set nowrap
set nojoinspaces
set relativenumber
set ruler
set scrolloff=3
set sessionoptions-=options
set shiftwidth=4
set showcmd
set showmatch
set smartcase "Override 'ignorecase' when search contains upper case chars.
set softtabstop=4
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set title
set visualbell
set wildignore=.git,.hg,.svn,*.a,*.class,*.gif,*.jpg,*.o,*.obj,*.png,*.pyc,*.so,*.swp,*.fasl,*.fas,*.lib
set wildmenu
set wildmode=full


execute pathogen#infect()
syntax enable
filetype plugin indent on

colorscheme solarized


" -------------------------------------------------
" Options for vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" -------------------------------------------------
" MAPPINGS

" Complete previous lines
inoremap  

" Move to a window and maximize the area.
nmap <C-K> <C-W>k<C-W>_<C-W><Bar>
nmap <C-J> <C-W>j<C-W>_<C-W><Bar>
nmap <C-H> <C-W>h84<C-W><Bar>
nmap <C-L> <C-W>l84<C-W><Bar>
"nmap <C-H> <C-W>h<C-W>_<C-W><Bar>
"nmap <C-L> <C-W>l<C-W>_<C-W><Bar>

" Stop highlighting
nnoremap <leader><space> :noh<cr>

" Strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Search for selected text on open buffers
"vmap <leader>vg "vy:vimgrep /<C-R>v/ app/**/*
vmap <leader>vg "vy:Ack <C-R>v app lib

" Open files in the same directory as the current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%

" Open graphical undo tree
nnoremap <F5> :GundoToggle<CR>

" Running tests
" Adapted from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc

map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write all buffers and run tests for the given filename
    :wa
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!time bundle exec rspec " . a:filename
        else
            exec ":!time rspec " . a:filename
        end
    end
endfunction


" Promote a variable to rspec let.
" From https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
function! PromoteToLet()
  normal! dd
  normal! P
  .s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  normal ==
endfunction
nnoremap <leader>p :call PromoteToLet()<cr>


" -------------------------------------------------
" AUTOCOMMANDS

autocmd FileType text setlocal textwidth=78

autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set sw=2 sts=2

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif


