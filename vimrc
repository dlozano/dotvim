call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on               "activa els colors, etcètera
set number              "mostra els números de línia a la part esquerra de la pantalla
set ruler               "mostra la línia en que ens trobem i la posició dins d'aquesta
set showmode            "ens mostra si estem en mode edició, substitució o cap
set hlsearch            "ressalta el text buscat
set autoindent          "opcions d'indentació
set cindent             "opcions d'indentació
set ignorecase          "fa la cerca insensible a majúscules i minúscules
set nocompatible        "treu la compatibilitat amb altres vim's per tal d'usar eines més potents (normalment necessari)
set backspace=2         "opcions per a que la tecla d'esborrar ens esborri sempre, no sols el text que acabem d'inserir
set tabstop=2           "per indicar al vim quina ha de ser la mida d'un tabulador quan el mostra per pantalla
set shiftwidth=2        "indica al vim quina és la mida d'un tabulador quan l'insereixes en mode edició
set softtabstop=2
set expandtab
set bg=dark
set nowrap              "d'aquesta manera no talla les línies al final de pantalla
set showmatch           "mostra l'altra banda d'una clau o d'un parèntesis quan ens situem al damunt
set completeopt=preview "opcions d'autocompletatge. Alternativa (vim 7): set completeopt=preview,menu
set pastetoggle=<F10>   "defineixes la tecla d'enganxar (paste) al F10
set diffopt=iwhite      "opcions per vimdiff: ignore white spaces
colorscheme obsidian2  
:filetype plugin on
set mouse=a
set incsearch
set hidden
let mapleader=","
set history=1000
set wildmode=list:longest
set title
set smartcase
set backup             
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
au! BufRead,BufNewFile *.json setfiletype json 
set visualbell
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

set confirm
let g:CSApprox_konsole=1
set t_Co=256
set laststatus=2                                          " statusline setup
if has('statusline')
  set statusline=   " clear the statusline, allow for rearranging parts
  set statusline+=%f                "Path to the file, as typed or relative to current dir
  set statusline+=%#errormsg#        "change color
  set statusline+=%{&ff!='unix'?'['.&ff.']':''}   "display a warning if fileformat isnt unix
  set statusline+=%*                "reset color to normal statusline color
  set statusline+=%#errormsg#       "change color
  set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}   "display a warning if file encoding isnt utf-8
  set statusline+=%*                "reset color to normal statusline color
  set statusline+=\ %y              "filetype
  set statusline+=%([%R%M]%)        "read-only (RO), modified (+) and unmodifiable (-) flags between braces
  set statusline+=%#StatusLineNC#%{&ff=='unix'?'':&ff.'\ format'}%* "shows '!' if file format is not platform default
  set statusline+=%{'~'[&pm=='']}   "shows a '~' if in patchmode
  set statusline+=\ %{fugitive#statusline()}  "show Git info, via fugitive.git
  "set statusline+=\ (%{synIDattr(synID(line('.'),col('.'),0),'name')}) "DEBUG : display the current syntax item name
  set statusline+=%#error#          "change color
  set statusline+=%{&paste?'[paste]':''}    "display a warning if &paste is set
  set statusline+=%*                "reset color to normal statusline color
  set statusline+=%=                "right-align following items
  set statusline+=#%n               "buffer number
  set statusline+=\ %l/%L,          "current line number/total number of lines,
  set statusline+=%c                "Column number
  set statusline+=%V                " -{Virtual column number} (Not displayed if equal to 'c')
  set statusline+=\ %p%%            "percentage of lines through the file%
  set statusline+=\                 "trailing space
  if has('title')
    "set titlestring=%t%(\ [%R%M]%)
  endif
endif
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
set showcmd                   " show incomplete cmds down the bottom
set smarttab                  " tab and backspace are smart
set showfulltag               " show full completion tags
set diffopt=filler        " insert filler to make lines match up
set diffopt+=iwhite       " ignore all whitespace
set diffopt+=vertical     " make :diffsplit default to vertical
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
" open all folds
nmap <LocalLeader>fo  :%foldopen!<cr>
" close all folds
nmap <LocalLeader>fc  :%foldclose!<cr>
" ,nn will toggle NERDTree on and off
nmap <LocalLeader>nn :NERDTreeToggle<cr>
" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %
" use \rci to indent ruby cody with ruby-code-indenter
nmap <Leader>rci :%!ruby-code-indenter<cr>
" Space will toggle folds! (maybe get rid of this?)
nnoremap <space> za
