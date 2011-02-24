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
"set bg=dark
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
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
au! BufRead,BufNewFile *.json setfiletype json 
set visualbell
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

set confirm
let g:CSApprox_konsole=1
set t_Co=256

