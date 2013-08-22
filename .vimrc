" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
"
"   This is the personal .vimrc file of Dewdrops. The structure and most code are
"   stolen from spf13-vim (https://github.com/spf13/spf13-vim).
" }

" Environment {

    " Basics {
        set nocompatible        " Must be first line
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier
        if has('win32') || has('win64')
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after

          " Be nice and check for multi_byte even if the config requires
          " multi_byte support most of the time
          if has("multi_byte")
            " Windows cmd.exe still uses cp850. If Windows ever moved to
            " Powershell as the primary terminal, this would be utf-8
            set termencoding=cp850
            " Let Vim use utf-8 internally, because many scripts require this
            set encoding=utf-8
            setglobal fileencoding=utf-8
            " Windows has traditionally used cp1252, so it's probably wise to
            " fallback into cp1252 instead of eg. iso-8859-15.
            " Newer Windows files might contain utf-8 or utf-16 LE so we might
            " want to try them first.
            set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15
          endif
        endif
    " }

    " Setup Bundle Support {
        " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype on
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " }

" }

" Bundles {
    " Deps
        Bundle 'gmarik/vundle'
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
        if executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            Bundle 'mileszs/ack.vim'
        elseif executable('ack')
            Bundle 'mileszs/ack.vim'
        elseif executable('ag')
            let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
            Bundle 'mileszs/ack.vim'
        endif

    if !exists('g:dewdrops_bundle_groups')
        let g:dewdrops_bundle_groups = ['general', 'theme', 'completion', 'programming', 'ruby', 'perl', 'python', 'javascript', 'haskell', 'html', 'misc']
    endif

    " General
        if count(g:dewdrops_bundle_groups, 'general')
            Bundle 'scrooloose/nerdtree'
            Bundle 'mhinz/vim-startify'
            Bundle 'tpope/vim-surround'
            Bundle 'Dewdrops/vim-autoclose'
            Bundle 'kien/ctrlp.vim'
            Bundle 'vim-scripts/sessionman.vim'
            Bundle 'matchit.zip'
            Bundle 'bufexplorer.zip'
            Bundle 'terryma/vim-multiple-cursors'
            Bundle 'bling/vim-airline'
            Bundle 'Lokaltog/vim-easymotion'
            Bundle 'godlygeek/csapprox'
            Bundle 'jistr/vim-nerdtree-tabs'
            Bundle 'mbbill/undotree'
            Bundle 'nathanaelkane/vim-indent-guides'
            Bundle 'vim-scripts/restore_view.vim'
            Bundle 'airblade/vim-gitgutter'
            Bundle 'tpope/vim-abolish.git'
            Bundle 'Dewdrops/vim-unimpaired'
            Bundle 'tpope/vim-repeat'
            Bundle 'terryma/vim-expand-region'
            Bundle 'vim-scripts/sudo.vim'
        endif

    " Color Themes
        if count(g:dewdrops_bundle_groups, 'theme')
            Bundle 'Dewdrops/vim-tomorrow-theme'
            Bundle 'jnurmine/Zenburn'
            Bundle 'tomasr/molokai'
            Bundle 'spf13/vim-colors'
            Bundle 'flazz/vim-colorschemes'
        endif

    " General Programming
        if count(g:dewdrops_bundle_groups, 'programming')
            " Pick one of the checksyntax, jslint, or syntastic
            Bundle 'scrooloose/syntastic'
            Bundle 'tpope/vim-fugitive'
            Bundle 'scrooloose/nerdcommenter'
            Bundle 'junegunn/vim-easy-align'
            Bundle 'thinca/vim-quickrun'
            if executable('ctags')
                Bundle 'majutsushi/tagbar'
            endif
        endif

    " Snippets & AutoComplete
        if count(g:dewdrops_bundle_groups, 'snipmate')
            Bundle 'garbas/vim-snipmate'
            Bundle 'honza/vim-snippets'
            " Source support_function.vim to support vim-snippets
            if filereadable(expand("~/.vim/bundle/vim-snippets/snippets/support_functions.vim"))
                source ~/.vim/bundle/vim-snippets/snippets/support_functions.vim
            endif
        elseif count(g:dewdrops_bundle_groups, 'completion')
            if has('lua') && (v:version > 703 || v:version == 703 && has('patch885'))
                Bundle 'Shougo/unite.vim'
                Bundle 'Shougo/neocomplete'
            else
                Bundle 'Shougo/neocomplcache'
            endif
            Bundle 'Shougo/neosnippet'
            Bundle 'honza/vim-snippets'
        endif

    " PHP
        if count(g:dewdrops_bundle_groups, 'php')
            Bundle 'spf13/PIV'
            Bundle 'arnaud-lb/vim-php-namespace'
            Bundle 'beyondwords/vim-twig'
        endif

    " Python
        if count(g:dewdrops_bundle_groups, 'python')
            " Pick either python-mode or pyflakes & pydoc
            Bundle 'klen/python-mode'
            Bundle 'python.vim'
            Bundle 'python_match.vim'
            Bundle 'pythoncomplete'
        endif

    " Javascript
        if count(g:dewdrops_bundle_groups, 'javascript')
            Bundle 'elzr/vim-json'
            Bundle 'pangloss/vim-javascript'
            Bundle 'briancollins/vim-jst'
            Bundle 'kchmck/vim-coffee-script'
        endif

    " Scala
        if count(g:dewdrops_bundle_groups, 'scala')
            Bundle 'derekwyatt/vim-scala'
            Bundle 'derekwyatt/vim-sbt'
        endif

    " Haskell
        if count(g:dewdrops_bundle_groups, 'haskell')
            Bundle 'travitch/hasksyn'
            Bundle 'dag/vim2hs'
            Bundle 'lukerandall/haskellmode-vim'
        endif

    " HTML
        if count(g:dewdrops_bundle_groups, 'html')
            Bundle 'amirh/HTML-AutoCloseTag'
            Bundle 'hail2u/vim-css3-syntax'
            Bundle 'cakebaker/scss-syntax.vim'
            Bundle 'groenewege/vim-less'
            Bundle 'mattn/emmet-vim'
            Bundle 'tpope/vim-haml'
        endif

    " Ruby
        if count(g:dewdrops_bundle_groups, 'ruby')
            Bundle 'tpope/vim-rails'
            let g:rubycomplete_buffer_loading = 1
            "let g:rubycomplete_classes_in_global = 1
            "let g:rubycomplete_rails = 1
        endif

    " Perl
        if count(g:dewdrops_bundle_groups, 'perl')
            Bundle 'vim-perl/vim-perl'
        endif

    " Lua
        if count(g:dewdrops_bundle_groups, 'lua')
            Bundle 'xolox/vim-misc'
            Bundle 'xolox/vim-lua-ftplugin'
        endif

    " Go Lang
        if count(g:dewdrops_bundle_groups, 'go')
            Bundle 'jnwhiteh/vim-golang'
            Bundle 'spf13/vim-gocode'
        endif

    " Cucumber
        if count(g:dewdrops_bundle_groups, 'cucumber')
            Bundle 'tpope/vim-cucumber'
            Bundle 'quentindecock/vim-cucumber-align-pipes'
        endif

    " Puppet
        if count(g:dewdrops_bundle_groups, 'puppet')
            Bundle 'Puppet-Syntax-Highlighting'
        endif

    " Misc
        if count(g:dewdrops_bundle_groups, 'misc')
            Bundle 'tpope/vim-markdown'
            Bundle 'chrisbra/csv.vim'
        endif

" }

" General {

    set background=dark         " Assume a dark background
    if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    endif
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has ('x') && has ('gui') " On Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui')          " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif

    " automatically switch to the current file directory when a new buffer is opened
    au BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    " Always switch to the current file directory

    set autowrite                       " Automatically write a file when leaving a modified buffer
    set autoread                        " reload automatically when file is changed outside
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set hidden                          " Allow buffer switching without saving
    set notimeout

    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

        " Add exclusions to mkview and loadview
        " eg: *.*, svn-commit.tmp
        let g:skipview_files = [
            \ ]
    " }

" }

" Vim UI {

    colo Tomorrow-Night-Eighties

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        "set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current directory
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    au BufEnter * set relativenumber      " relative line number for fast motion
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=1                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }

" Formatting {

    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent

    set smartindent                     " smart autoindent for C programs
    set cindent
    set cinoptions={0,t0,p2s,(03s,>1s,=1s,:1s

    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    au FileType c,cpp,java,go,php,javascript,python,twig,xml,yml au BufWritePre <buffer> call StripTrailingWhitespace()
    au FileType go au BufWritePre <buffer> Fmt
    au BufNewFile,BufRead *.html.twig set filetype=html.twig

" }

" Key (re)Mappings {

    let mapleader = ','

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk
    nnoremap gj j
    nnoremap gk k

    "map <S-H> gT
    "map <S-L> gt

    "use q as an unified way to exit various visual mode
    vnoremap q <esc>

    " Stupid shift key fixes
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>

    cmap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " swap 0 and ^ in normal mode
    nnoremap 0 ^
    nnoremap ^ 0

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<cr>
    nmap <leader>f1 :set foldlevel=1<cr>
    nmap <leader>f2 :set foldlevel=2<cr>
    nmap <leader>f3 :set foldlevel=3<cr>
    nmap <leader>f4 :set foldlevel=4<cr>
    nmap <leader>f5 :set foldlevel=5<cr>
    nmap <leader>f6 :set foldlevel=6<cr>
    nmap <leader>f7 :set foldlevel=7<cr>
    nmap <leader>f8 :set foldlevel=8<cr>
    nmap <leader>f9 :set foldlevel=9<cr>

    " Toggle search highlighting
    nmap <silent> <leader>/ :nohlsearch<cr>

    " Shortcuts in command line
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null
    nnoremap <leader>wf :w !sudo tee % >/dev/null<cr>

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:p:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=
    map <Leader>x0 <C-w>c
    map <Leader>x1 <C-w>o

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<cr>

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    inoremap <c-f> <right>
    inoremap <c-b> <left>
    "inoremap <c-d> <del>

    nnoremap <s-tab> :bp<cr>
    nnoremap <leader>bd :bd<cr>
    nnoremap <leader>q :q<cr>
    nnoremap <leader>wq :wq<cr>
    nnoremap <leader>wr :w<cr>
    nnoremap <leader>xa :xa<cr>
    nnoremap <leader>bp :bp<cr>
    nnoremap <leader>bn :bn<cr>
    nnoremap <leader>zd :set fdm=diff<cr>
    nnoremap <leader>za :set fdm=manual<cr>
    nnoremap <leader>zs :set fdm=syntax<cr>
    nnoremap <leader>zm :set fdm=marker<cr>
    nnoremap <leader>zi :set fdm=indent<cr>
    nnoremap <leader>ze :set fdm=expr<cr>
    nnoremap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
    nnoremap <leader>mk :make<cr>
    nnoremap <leader>sp :sp<cr>
    nnoremap <leader>vs :vs<cr>
    nnoremap <f5> :%TOhtml<cr>

" }

" Plugins {

    " PIV {
        let g:DisableAutoPHPFolding = 0
        "let g:PIVAutoClose = 0
    " }

    " Ack {
        nnoremap <leader>ak :Ack<space>
    " }

    " Startify {
    let g:startify_custom_header = [
                \ '         ____                   _                     ',
                \ '        |  _ \  _____      ____| |_ __ ___  _ __  ___ ',
                \ '        | | | |/ _ \ \ /\ / / _` | ''__/ _ \| ''_ \/ __|',
                \ '        | |_| |  __/\ V  V / (_| | | | (_) | |_) \__ \',
                \ '        |____/ \___| \_/\_/ \__,_|_|  \___/| .__/|___/',
                \ '                                           |_|        ',
                \ '                                                      ',
                \ '                                                      '
                \ ]
    " }

    " matchit {
        let b:match_ignorecase = 1
    " }

    " OmniComplete {
        if has("autocmd") && exists("+omnifunc")
            au Filetype *
                        \if &omnifunc == "" |
                        \setlocal omnifunc=syntaxcomplete#Complete |
                        \endif
        endif

        hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        " Some convenient mappings
        inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        inoremap <expr> <cr>       pumvisible() ? "\<C-y>" : "\<cr>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"

        " Automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif
        set completeopt=menu,preview,longest
    " }

    " Ctags {
        set tags=./tags;/,~/.vimtags;../tags
    " }

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
    " }

    " SnipMate {
        " Setting the author var
        let g:snips_author = 'Dewdrops <v_v_4474@126.com>'
    " }

    " NerdTree {
        map <Leader>nt :NERDTreeToggle<cr>:NERDTreeMirror<cr>
        map <leader>nf :NERDTreeFind<cr>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\.elc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    " }

    " EasyAlign {
        vnoremap <silent> <Enter> :EasyAlign<cr>
        nmap <Leader>a, :EasyAlign <space><cr>
        vmap <Leader>a, :EasyAlign <space><cr>
        nmap <Leader>a= :EasyAlign =<cr>
        vmap <Leader>a= :EasyAlign =<cr>
        nmap <Leader>a: :EasyAlign :<cr>
        vmap <Leader>a: :EasyAlign :<cr>
        nmap <Leader>a, :EasyAlign ,<cr>
        vmap <Leader>a, :EasyAlign ,<cr>
        nmap <Leader>a, :EasyAlign .<cr>
        vmap <Leader>a, :EasyAlign .<cr>
        nmap <Leader>a<Bar> :EasyAlign <Bar><cr>
        vmap <Leader>a<Bar> :EasyAlign <Bar><cr>
    " }

    " Session Manager {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :SessionList<cr>
        nmap <leader>ss :SessionSave<cr>
    " }

    " JSON {
        nmap <leader>jt <Esc>:%!python -m json.tool<cr><Esc>:set filetype=json<cr>
    " }

    " PyMode {
        let g:pymode_lint_checker = "pyflakes"
        let g:pymode_utils_whitespaces = 0
        let g:pymode_options = 0
    " }

    " ctrlp {
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_working_path_mode = 'rc'
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc|\.elc$' }

        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'find %s -type f'
        \ }
    "}

    " TagBar {
        nnoremap <silent><leader>tt :TagbarToggle<cr>
        nnoremap <silent><f8> :TagbarToggle<cr>
        inoremap <silent><f8> <esc>:TagbarToggle<cr>a

        " If using go please install the gotags program using the following
        " go install github.com/jstemmer/gotags
        " And make sure gotags is in your path
        let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
                \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
                \ 'r:constructor', 'f:functions' ],
            \ 'sro' : '.',
            \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
            \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }
    "}

    " PythonMode {
        " Disable if python support not present
        if !has('python')
            let g:pymode = 1
        endif
    " }

    " Fugitive {
        nnoremap <leader>gs :Gstatus<cr>
        nnoremap <leader>gd :Gdiff<cr>
        nnoremap <leader>gc :Gcommit<cr>
        nnoremap <leader>gb :Gblame<cr>
        nnoremap <leader>gl :Glog<cr>
        nnoremap <leader>gp :Git push https://github.com/Dewdrops/
        nnoremap <leader>gw :Gwrite<cr>:GitGutter<cr>
        nnoremap <leader>gr :Gwrite<cr>:GitGutter<cr>
        nnoremap <leader>gg :GitGutterToggle<cr>
    "}

    " neocomplcache and neocomple {
        if count(g:dewdrops_bundle_groups, 'completion')
            let g:acp_enableAtStartup = 0

            if !( has('lua') && (v:version > 703 || v:version == 703 && has('patch885')) )
                let g:neocomplcache_enable_at_startup = 1
                let g:neocomplcache_enable_camel_case_completion = 1
                let g:neocomplcache_enable_smart_case = 1
                let g:neocomplcache_enable_underbar_completion = 1
                let g:neocomplcache_enable_auto_delimiter = 1
                let g:neocomplcache_max_list = 15
                let g:neocomplcache_force_overwrite_completefunc = 1

                " Define dictionary.
                let g:neocomplcache_dictionary_filetype_lists = {
                            \ 'default' : '',
                            \ 'vimshell' : $HOME.'/.vimshell_hist',
                            \ 'scheme' : $HOME.'/.gosh_completions'
                            \ }

                " Define keyword.
                if !exists('g:neocomplcache_keyword_patterns')
                    let g:neocomplcache_keyword_patterns = {}
                endif
                let g:neocomplcache_keyword_patterns._ = '\h\w*'

                inoremap <expr><C-g> neocomplcache#undo_completion()
                inoremap <expr><C-l> neocomplcache#complete_common_string()
                inoremap <expr><cr> neocomplcache#complete_common_string()

                " <cr>: close popup
                " <s-CR>: close popup and save indent.
                inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<cr>" : "\<cr>"
                inoremap <expr><cr> pumvisible() ? neocomplcache#close_popup() : "\<cr>"

                " <C-h>, <BS>: close popup and delete backword char.
                inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
                inoremap <expr><C-y> neocomplcache#close_popup()

                " Enable heavy omni completion.
                if !exists('g:neocomplcache_omni_patterns')
                    let g:neocomplcache_omni_patterns = {}
                endif
                let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
                let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
                let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
                let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
                let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
            else
                let g:neocomplete#enable_at_startup = 1
                let g:neocomplete#enable_camel_case_completion = 1
                let g:neocomplete#enable_smart_case = 1
                let g:neocomplete#enable_underbar_completion = 1
                let g:neocomplete#enable_auto_delimiter = 1
                let g:neocomplete#max_list = 15
                let g:neocomplete#force_overwrite_completefunc = 1

                " Define dictionary.
                let g:neocomplete#sources#dictionary#dictionaries = {
                            \ 'default' : '',
                            \ 'vimshell' : $HOME.'/.vimshell_hist',
                            \ 'scheme' : $HOME.'/.gosh_completions'
                            \ }

                " Define keyword.
                if !exists('g:neocomplete_keyword_patterns')
                    let g:neocomplete#keyword_patterns = {}
                endif
                let g:neocomplete#keyword_patterns._ = '\h\w*'

                inoremap <expr><C-g> neocomplete#undo_completion()
                inoremap <expr><C-l> neocomplete#complete_common_string()
                inoremap <expr><cr> neocomplete#complete_common_string()

                " <cr>: close popup
                " <s-CR>: close popup and save indent.
                inoremap <expr><s-CR> pumvisible() ? neocomplete#close_popup()"\<cr>" : "\<cr>"
                inoremap <expr><cr> pumvisible() ? neocomplete#close_popup() : "\<cr>"

                " <C-h>, <BS>: close popup and delete backword char.
                inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
                inoremap <expr><C-y> neocomplete#close_popup()

                " Enable heavy omni completion.
                if !exists('g:neocomplete#sources#omni#input_patterns')
                    let g:neocomplete#sources#omni#input_patterns = {}
                endif
                let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
                let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
                let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
                let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
                let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
            endif

            " SuperTab like snippets behavior.
            imap <silent><expr><TAB> neosnippet#expandable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                        \ "\<C-e>" : "\<TAB>")
            smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

            imap <C-k> <Plug>(neosnippet_expand_or_jump)
            smap <C-k> <Plug>(neosnippet_expand_or_jump)

            " <TAB>: completion.
            inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
            inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

            " Enable omni completion.
            au FileType css setlocal omnifunc=csscomplete#CompleteCSS
            au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
            au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
            au FileType python setlocal omnifunc=pythoncomplete#Complete
            au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
            au FileType ruby setlocal omnifunc=rubycomplete#Complete

            " Use honza's snippets.
            let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

            " Enable neosnippet snipmate compatibility mode
            let g:neosnippet#enable_snipmate_compatibility = 1

            " For snippet_complete marker.
            if has('conceal')
                set conceallevel=2 concealcursor=i
            endif

            " Disable the neosnippet preview candidate window
            " When enabled, there can be too much visual noise
            " especially when splits are used.
            set completeopt-=preview
        endif
    " }

    " UndoTree {
        nnoremap <Leader>ut :UndotreeToggle<cr>
        " If undotree is opened, it is likely one wants to interact with it.
        let g:undotree_SetFocusWhenToggle=1
    " }

    " airline {
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#hunks#non_zero_only = 1
    " }

    " indent_guides {
        if !has('gui_running')
            let g:indent_guides_auto_colors = 0
            hi IndentGuidesOdd  ctermbg=black
            hi IndentGuidesEven ctermbg=darkgrey
        endif

        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    " }

    " EasyMotion {
        let EasyMotion_leader_key = "em"
        let g:EasyMotion_mapping_f = '<space>'
        let g:EasyMotion_mapping_F = 'g<space>'
    " }

    " NERDcommenter {
        let NERDCreateDefaultMappings=0
        function! s:CreateNERDCommeterMaps(target, combo)
            if !hasmapto(a:target, 'n')
                exec 'nmap ' . a:combo . ' ' . a:target
            endif
            if !hasmapto(a:target, 'v')
                exec 'vmap ' . a:combo . ' ' . a:target
            endif
        endfunction
        call s:CreateNERDCommeterMaps('<plug>NERDCommenterSexy',       '<leader>cs')
        call s:CreateNERDCommeterMaps('<plug>NERDCommenterToggle',     '<leader>ci')
        call s:CreateNERDCommeterMaps('<plug>NERDCommenterYank',       '<leader>cy')
    " }

    " haskellmode-vim {
        let g:haddock_browser="/usr/bin/opera"
    " }

    " Quickrun {
        nnoremap <leader>kr :QuickRun -outputter/buffer/into 1<cr>
        let g:quickrun_config = {'outputter/buffer/into': 1}
    " }

    " zencoding {
        let g:user_emmet_leader_key = '<c-g>'            " use C-g instead
        let g:user_emmet_mode = 'i'
    " }

    " BufExplorer {
        let g:bufExplorerDefaultHelp = 0                 " Do not show default help.
        let g:bufExplorerShowRelativePath = 1            " Show relative paths.
        let g:bufExplorerSortBy = 'mru'                  " Sort by most recently used.
        let g:bufExplorerSplitRight = 0                  " Split left.
        let g:bufExplorerSplitVertical = 1               " Split vertically.
        let g:bufExplorerSplitVertSize = 30              " Split width
        let g:bufExplorerUseCurrentWindow = 1            " Open in new window
        au BufWinEnter \[Buf\ List\] setl nonumber
    " }

" }

" GUI Settings {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
        if has("gui_gtk2")
            set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif has("gui_mac")
            set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
        elseif has("gui_win32")
            set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
        if has('gui_macvim')
            set transparency=5      " Make the window slightly transparent
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

" }

" Functions {

    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " Specify the directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories
        let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    " }

    " Initialize NERDTree as needed {
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }

" }

" Finish local initializations {
    call InitializeDirectories()
" }
