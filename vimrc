set nocompatible                                    "We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                      "Make backspace behave like every other editor.
let mapleader = ','                                 "The default is \, but a comma is much better.
set number                                          "Let's activate line numbers.
set noerrorbells visualbell t_vb=                   "No damn bells!
set autowriteall                                    "Automatically write the file when switching buffers.
set complete=.,w,b,u                                "Set our desired autocompletion matching.
set nofoldenable
set undofile                                        " Maintain undo history between sessions
"-------------Visuals--------------"
colorscheme nord
set t_CO=256                                        "Use 256 colors. This is useful for Terminal Vim.
set guifont=menlo\ for\ powerline:h14

set guioptions-=e 
set linespace=15                                    "Macvim-specific line-height.

set guioptions-=l                                   "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R

"We'll fake a custom left padding for each window.
hi LineNr guibg=bg
set foldcolumn=1
hi foldcolumn guibg=bg

"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg



"-------------Search--------------"
set hlsearch                                "Highlight all matched terms.
set incsearch                               "Incrementally highlight, as we type.

"-------------Split Management--------------"
set splitbelow                              "Make splits default to below...
set splitright                              "And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"------ Varios-------"
set virtualedit=all       " allow for cursor beyond last character
set history=1000          " Store a ton of history (default is 20)
set hidden                " allow buffer switching without saving
set nonumber                " display line numbers
set cursorline            " highlight the current line
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8        " set file encoding to utf-8, the only encoding to use
set tabstop=4
set nowrap                " Don't wrap text by default
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase
set smarttab
set tags=tags
set expandtab
set autoindent
set showcmd
scriptencoding utf-8
set encoding=utf-8
set autowrite             " Save on buffer switch
set autoread              " Check when a file is edited by another program
set visualbell
set directory=$HOME/.vim/swp//
set backupdir=~/.vim/.backup//

" enable project specific vimrc
set exrc

" Languages {
    " PHP settings {
        " PHP shortcuts
        autocmd FileType php inoremap <C--> ->
        autocmd FileType php inoremap <C-=>> =>

        " phpDoc
        autocmd FileType php inoremap <buffer> <LocalLeader>d <ESC>:call PhpDocSingle()<CR>i
        autocmd FileType php nnoremap <buffer> <LocalLeader>d :call PhpDocSingle()<CR>
        autocmd FileType php vnoremap <buffer> <LocalLeader>d :call PhpDocRange()<CR>

        " PHP Namespace remaps
        autocmd FileType php noremap <buffer> <LocalLeader>n :call PhpInsertUse()<CR>
        autocmd FileType php noremap <buffer> <LocalLeader>e :call PhpExpandClass()<CR>

        " PHP Parsing & Checking commands
        autocmd FileType php noremap <buffer> <C-M> :w!<CR>:!php %<CR>
        autocmd FileType php noremap <buffer> <LocalLeader>l :w!<CR>:!php -l %<CR>
        autocmd FileType php noremap <buffer> <LocalLeader>b :w!<CR>:!vendor/bin/behat<CR>
        autocmd FileType php noremap <buffer> <LocalLeader>u :w!<CR>:!vendor/bin/phpunit<CR>
        autocmd FileType php noremap <buffer> <LocalLeader>s :w!<CR>:!vendor/bin/phpspec run -v<CR>

        " Cucumber
        autocmd FileType cucumber noremap <buffer> <LocalLeader>b :w!<CR>:!vendor/bin/behat %<CR>

        autocmd FileType php nnoremap <buffer> <f8> :exe ':!phpctags --flags="+aim" --exclude=".git" --exclude="vendor/pdepend" --exclude="composer.phar" --sort=yes --memory=-1 --recurse=yes -f "' . g:project_tags .'" .'<CR>
        autocmd FileType php nnoremap <buffer> execute "set tags=" . g:project_tags

        autocmd FileType php setlocal ts=4 sts=4 sw=4

        " Strip trailing white space from .php files
        autocmd BufWritePre *.php :%s/\s\+$//e

        " Indentation rules
        autocmd FileType php set expandtab

        " PHPDoc settings
        if !exists("g:pdv_cfg_Author")
            let g:pdv_cfg_Author = "Pablo E. Medina <pablo.medina@gmail.com>"
        endif

        " Set up syntax checker
        let g:syntastic_php_checkers=['php', '/usr/local/bin/phpcs', '/usr/local/bin/phpmd']

        " Refactoring
        let g:php_refactor_command='php ~/bin/refactor.phar'

        " CS Fixer
        let g:php_cs_fixer_path = "/uar/local/bin/php-cs-fixer"
        let g:php_cs_fixer_level = "all"    
        let g:php_cs_fixer_fixers_list="-psr2"
        let g:php_cs_fixer_config = "default"
        let g:php_cs_fixer_php_path = "php"
        let g:php_cs_fixer_enable_default_mapping = 1
        let g:php_cs_fixer_dry_run = 0
        let g:php_cs_fixer_verbose = 1
    " }

    " Javascript {
        " 2 space indents
        autocmd FileType javascript setlocal ts=2 sts=2 sw=2
    " }

    " Coffeescript {
        " 2 space indents
        autocmd FileType coffee setlocal ts=2 sts=2 sw=2
    " }

    " HTML {
        " 2 space indents
        autocmd FileType html setlocal ts=2 sts=2 sw=2
    " }

    " Go {
        au FileType go nmap <Leader>s <Plug>(go-implements)
        au FileType go nmap <Leader>i <Plug>(go-info)
        au FileType go nmap <Leader>gd <Plug>(go-doc)
        au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
        au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
        au FileType go nmap <leader>r <Plug>(go-run)
        au FileType go nmap <leader>b <Plug>(go-build)
        au FileType go nmap <leader>t <Plug>(go-test)
        au FileType go nmap <leader>c <Plug>(go-coverage)
        au FileType go nmap <Leader>ds <Plug>(go-def-split)
        au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
        au FileType go nmap <Leader>dt <Plug>(go-def-tab)
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_structs = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1
    " }
" }

" Key (re)Mappings {

    " Quick ESC
    imap jj <ESC>

    " Jump to the next row on long lines
    map <Down> gj
    map <Up>   gk
    nnoremap j gj
    nnoremap k gk

    " Resize buffers
    if bufwinnr(1)
      nmap Ä <C-W><<C-W><
      nmap Ö <C-W>><C-W>>
      nmap ö <C-W>-<C-W>-
      nmap ä <C-W>+<C-W>+
    endif

    " Map the space bar to open/close a fold
    nnoremap <Space> za

    " format the entire file
    nmap <leader>fef ggVG=

    " Map the buffer list
    nmap <leader>l :ls

    " Fast saves
    nmap <leader>w :w!<cr>

    " Edit todo list for project
    nmap ,todo :e todo.txt<cr>

    " Edit composer.json
    nmap <leader>lc :e composer.json<cr>

    "Load the current buffer in Chrome
    nmap ,c :!open -a Google\ Chrome<cr>

    " Open new buffers
    nmap <leader>s<left>   :leftabove  vnew<cr>
    nmap <leader>s<right>  :rightbelow vnew<cr>
    nmap <leader>s<up>     :leftabove  new<cr>
    nmap <leader>s<down>   :rightbelow new<cr>

    " Not quite working yet.
    nmap <leader>l <Plug>Ysurroundiw]%a(<C-R>*)<Esc>
    vmap <leader>l <Plug>Vsurroundiw]%a(<C-R>*)<Esc>

    " Tab between buffers
    noremap <tab> <c-w><c-w>

    " Switch between last two buffers
    nnoremap <leader><leader> <C-^>

    " Toggle numbers.vim
    nnoremap <F3> :NumbersToggle<CR>

"  }

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>




"-------------Mappings--------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" Bubble single lines
nmap <D-Down> ddp
nmap <D-Up> ddkP

" Bubble multiple lines
vmap <D-Up> xkP`[V`]
vmap <D-Down> xp`[V`]



"Make NERDTree easier to toggle.
nmap <D-1> :NERDTreeToggle<cr>
nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

let NERDTreeHijackNetrw = 0

nnoremap <Space> za
vnoremap <Space> za
" Fast saves
nmap <leader>w :w!<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"-------------Plugins--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'vendor|node_modules|\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:phpcomplete_index_composer_command = '/usr/local/bin/composer'

"/
"/ php-cs-fixer
"/
let g:php_cs_fixer_level = "psr2"

"/
"/vim-airline
"/
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
nmap <F8> :TagbarOpenAutoClose<CR>

"-----------Laravel framework commons------------"
nmap <Leader>lr :e app/Http/Routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader><Leader>v :e resources/views/<cr>
nmap <Leader>lca :e config/app.php<cr>81Gf(%O
nmap <Leader>lcd :e config/database.php<cr>
nmap <Leader>lc :e composer.json<cr>

nmap <Leader>qa  " Show/hide code sniffer and mess detector violations
nmap <Leader>qc  " Show/hide code coverage markers

abbrev gm !php artisan make:model
abbrev gc !php artisan make:controller
abbrev gmig !php artisan make:migration
abbrev srv !php artisan serve &

"-------------Auto-Commands--------------"            
"Automatically source the Vimrc file on save.


augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

set fdm=indent

set tabstop=4
set shiftwidth=4

autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

"-------------Tips and Reminders--------------"
" - Press 'zz' to instantly center the line where the cursor is located.
