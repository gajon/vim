" vim:set ts=2 sts=2 sw=2 expandtab:

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set autoindent
set background=dark
set backup
set backupdir=~/.vim/backupfiles,~/tmp,.
set cmdheight=2
set expandtab
set fillchars=vert:\ ,fold:-
set hidden
set history=1000
set hlsearch
set ignorecase
set laststatus=2
set list
set listchars=eol:\ ,tab:»·,trail:∙,extends:»,precedes:«
set nowrap
set nojoinspaces
set relativenumber
set sessionoptions-=options
set showmatch
set smartcase
set statusline=%<%f\ %m%r%w%y%q%=%-14.(%l,%c%V%)\ %P
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set title
set visualbell
set wildignore=.git,.hg,.svn,*.a,*.class,*.gif,*.jpg,*.o,*.obj,*.png,*.pyc,*.so,*.swp,*.fasl,*.fas,*.lib
set wildmenu


"------------------------------------------------
" PATHOGEN
"------------------------------------------------
execute pathogen#infect()


"------------------------------------------------
" AUTOCOMMANDS
"------------------------------------------------
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber
    \ set ai sw=2 sts=2 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass
  autocmd BufRead,BufNewFile *.psql setfiletype pgsql

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END


"------------------------------------------------
" netrw (although better use NERDTree)
"------------------------------------------------
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_preview=1
let g:netrw_winsize=30
let g:netrw_liststyle=3


"------------------------------------------------
" Custom Mappings
"------------------------------------------------

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
vmap <leader>vg "vy:Ack <C-R>v app lib config spec

" Open files in the same directory as the current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%

" Toggle NERDTree
nmap ,tr :NERDTreeToggle<CR>

" Cycle buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>


"------------------------------------------------
" RUNNING TESTS
" Adapted from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"------------------------------------------------
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
        elseif filereadable("bin/rspec")
            exec ":!time ./bin/rspec " . a:filename
        "elseif filereadable("Gemfile")
            "exec ":!time bundle exec rspec " . a:filename
        else
            exec ":!time rspec " . a:filename
        end
    end
endfunction


"------------------------------------------------
" PROMOTE A VARIABLE TO RSPEC LET.
" From https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"------------------------------------------------
function! PromoteToLet()
  normal! dd
  normal! P
  .s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  normal ==
endfunction
nnoremap <leader>p :call PromoteToLet()<cr>


"------------------------------------------------
" COLORSCHEME
"------------------------------------------------
colorscheme solarized

