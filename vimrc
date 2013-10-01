call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif
set number              "mostra els números de línia a la part esquerra de la pantalla
set numberwidth=5

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
if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  colorscheme  railscasts
else
  colorscheme railscasts
endif

:filetype plugin on
set mouse=a
set incsearch
set hidden
let mapleader=","
set history=1000
set wildmode=list:longest
set title
set smartcase
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
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
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
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
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
set showcmd                   " show incomplete cmds down the bottom
set smarttab                  " tab and backspace are smart
set showfulltag               " show full completion tags
set diffopt=filler        " insert filler to make lines match up
set diffopt+=iwhite       " ignore all whitespace
set diffopt+=vertical     " make :diffsplit default to vertical

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

"folding settings
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set nofoldenable
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

let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_auto_loc_list=2
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()


set guifont="Monospace\ Regular\ 9"

" Mode Indication -Prominent!
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=red
    set cursorcolumn
  elseif a:mode == 'r'
    hi statusline guibg=blue
  else
    hi statusline guibg=white
  endif
endfunction

function! InsertLeaveActions()
  hi statusline guibg=darkgreen
  set nocursorcolumn
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveActions()

" to handle exiting insert mode via a control-C
inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>

" default the statusline to green when entering Vim
hi statusline guibg=darkgreen

" have a permanent statusline to color
set laststatus=2



let g:changes_autocmd=0
let g:changes_vcs_check=1
let g:changes_vcs_system='git'
let g:changes_verbose=0

nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>
set wildignore=*.o,*.obj,.git,.hg,public/images,public/media,doc,vendor/cache
let g:CommandTMaxFiles=50000


"save with ctrl-s
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
imap <c-s> <c-o><c-s>
nnoremap <silent> <c-t> :tabnew<CR>


set list
set listchars=tab:▸\ ,trail:▝


" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif



" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'


