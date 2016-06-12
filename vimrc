set nocompatible              " be iMproved, required
filetype off                  " required

" fix windows backspace
set backspace=2

"http://superuser.com/questions/878333/how-to-i-map-ctrl-g-to-open-nerdtree
:nnoremap <C-g> :NERDTree<CR>

"http://superuser.com/questions/387777/what-could-cause-strange-characters-in-vim
let g:NERDTreeDirArrows=0
set nocompatible
filetype off
set t_Co=256
set nu
syntax on " enabled syntax highlighting
:set number " line numbers
:set ai " autoindent
:set tabstop=2 " sets tabs to 4 characters
:set shiftwidth=2
:set expandtab
:set softtabstop=2 " makes the spaces feel like real tabs
" CSS (tabs = 2, lines = 79)
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2
" JavaScript (tabs = 4, lines = 79)
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
" autocmd FileType javascript set tw=79
 
autocmd FileType jade set omnifunc=jadecomplete#CompleteJade
autocmd FileType jade set sw=2
autocmd FileType jade set ts=2
autocmd FileType jade set sts=2
 
" Highlight current line only in insert mode
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline
 
" Makefiles require TAB instead of whitespace
autocmd FileType make setlocal noexpandtab
 
" Highlight cursor
highlight CursorLine ctermbg=8 cterm=NONE

set nocompatible
set nu
filetype off
set laststatus=2
if has('win32') || has('win64')
  set rtp+=~/vimfiles/Vundle.vim/
  call vundle#begin('$HOME/vimfiles/bundle/')
  if has("gui_running")
  if has("gui_gtk2")
    set guifont=Courier\ New\ 11
  elseif has("gui_photon")
    set guifont=Courier\ New:s11
  elseif has("gui_kde")
    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Consolas:h11:cDEFAULT
  endif
endif
else
  " Usual quickstart instructions
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  set guifont=Monaco:h13
endif

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'EasyMotion'
" Now we can turn our filetype functionality back on
filetype plugin indent on

Plugin 'ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'dkprice/vim-easygrep'
call vundle#end()
nmap <F8> :TagbarToggle<CR>
" JSHINT CHECKER
let g:syntastic_javascript_checkers = ['jshint']


Bundle "pangloss/vim-javascript"
syntax enable
set background=dark
colorscheme vividchalk 

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

let g:EasyGrepMode=0
let g:EasyGrepCommand=0
let g:EasyGrepRecursive=1
let g:EasyGrepSearchCurrentBufferDir=1
let g:EasyGrepIgnoreCase=1
let g:EasyGrepHidden=0
let g:EasyGrepFilesToInclude=''
let g:EasyGrepFilesToExclude='*.swp,*~'
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepWindow=0
let g:EasyGrepReplaceWindowMode=0
let g:EasyGrepOpenWindowOnMatch=1
let g:EasyGrepEveryMatch=0
let g:EasyGrepJumpToMatch=1
let g:EasyGrepInvertWholeWord=0
let g:EasyGrepPatternType='regex'
let g:EasyGrepFileAssociationsInExplorer=0
let g:EasyGrepExtraWarnings=0
let g:EasyGrepOptionPrefix='<leader>vy'
let g:EasyGrepReplaceAllPerFile=0 
let g:EasyGrepFilesToExclude=".svn,.git,node_modules"
