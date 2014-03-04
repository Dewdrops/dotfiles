" Modeline and Notes {{{
" vim: sw=4 ts=4 sts=4 et tw=80 foldmarker={{{,}}} foldlevel=0 foldmethod=marker
"
"   This is the personal .vimrc file of Dewdrops (v_v_4474@126.com). some code are
"   stolen from spf13-vim (https://github.com/spf13/spf13-vim).
" }}}

" Environment {{{

    " Load basic configuration
    source ~/.vimrc_tiny

    " Set up NeoBundle Support {{{
        set rtp+=~/.vim/bundle/neobundle.vim
        call neobundle#rc(expand('~/.vim/bundle/'))
        NeoBundleFetch 'Shougo/neobundle.vim'
    " }}}

" }}}

" Bundles {{{

    " Bundle group configuration {{{
        if !exists('g:dewdrops_bundle_groups')
            let g:dewdrops_bundle_groups = [
                        \     'general',
                        \     'programming',
                        \     'git',
                        \     'ycm',
                        \     'misc'
                        \ ]
        endif
    " }}}

    " General {{{
        if count(g:dewdrops_bundle_groups, 'general')

            " CtrlP {{{
                NeoBundle 'kien/ctrlp.vim'
                let g:ctrlp_custom_ignore       = {
                    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc|\.elc$'
                    \ }
                let g:ctrlp_user_command        = {
                    \ 'types': {
                        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                    \ },
                    \ 'fallback': 'find %s -type f'
                \ }

                let g:ctrlp_cmd                 = 'CtrlPMixed'
                let g:ctrlp_working_path_mode   = 'rc'
                let g:ctrlp_clear_cache_on_exit = 1
                let g:ctrlp_max_height          = 40
                let g:ctrlp_follow_symlinks     = 1
                let g:ctrlp_max_files           = 10000
                let g:ctrlp_mruf_max            = 20
                let g:ctrlp_cache_dir           = '~/.vim/.cache/ctrlp'
                let g:ctrlp_reuse_window        = 'startify'
                let g:ctrlp_extensions          = ['funky']

                nnoremap \ <nop>
                nnoremap \t :CtrlPBufTag<cr>
                nnoremap \T :CtrlPTag<cr>
                nnoremap \l :CtrlPLine<cr>
                nnoremap \o :CtrlPFunky<cr>
                nnoremap \b :CtrlPBuffer<cr>

                NeoBundleLazy 'tacahiroy/ctrlp-funky',
                            \ {'autoload': {'commands': ['CtrlPFunky']}}
            " }}}

            " NerdTree {{{
                NeoBundleLazy 'scrooloose/nerdtree',
                            \ {'autoload': {'commands': ['NERDTreeToggle', 'NERDTreeFind']}}
                map <Leader>nt :NERDTreeToggle<cr>
                map <Leader>nf :NERDTreeFind<cr>

                let NERDTreeShowBookmarks               = 1
                let NERDTreeIgnore                      = ['\.pyc', '\.elc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
                let NERDTreeChDirMode                   = 0
                let NERDTreeQuitOnOpen                  = 1
                let NERDTreeMouseMode                   = 2
                let NERDTreeShowHidden                  = 1
                let NERDTreeKeepTreeInNewTab            = 1
                let g:nerdtree_tabs_open_on_gui_startup = 0
            " }}}

            " Seek {{{
                NeoBundle 'goldfeld/vim-seek'
                let g:SeekKey                         = 'S'
                let g:SeekBackKey                     = '<leader>S'
                let g:seekJumpPresentialInnerKey      = 'gz'
                let g:seekBackJumpPresentialInnerKey  = 'gZ'
                let g:seekJumpRemoteInnerKey          = 'gu'
                let g:seekBackJumpRemoteInnerKey      = 'gU'
                let g:seekJumpPresentialAroundKey     = 'z'
                let g:seekBackJumpPresentialAroundKey = 'Z'
                let g:seekJumpRemoteAroundKey         = 'u'
                let g:seekBackJumpRemoteAroundKey     = 'U'
                let g:seek_enable_jumps               = 1
            " }}}

            " vim-lion {{{
                NeoBundleLazy 'tommcdo/vim-lion',
                            \ {'autoload': {'mappings':
                            \ ['<Plug>LionRight', '<Plug>VLionRight',
                            \ '<Plug>LionLeft', '<Plug>VLionLeft',
                            \ '<Plug>LionEqual', '<Plug>VLionEqual',
                            \ '<Plug>LionColon', '<Plug>VLionColon']}}
                let g:lion_create_maps = 0
                nmap <silent> gl <Plug>LionRight
                vmap <silent> gl <Plug>VLionRight
                nmap <silent> gL <Plug>LionLeft
                vmap <silent> gL <Plug>VLionLeft
                nmap <silent> g= <Plug>LionEqual
                vmap <silent> g= <Plug>VLionEqual
                nmap <silent> g: <Plug>LionColon
                vmap <silent> g: <Plug>VLionColon
            " }}}

            " Startify {{{
                NeoBundle 'mhinz/vim-startify'
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
            " }}}

            " EasyGrep {{{
                NeoBundleLazy 'vim-scripts/EasyGrep',
                            \ {'autoload': {'mappings': ['<plug>EgMapGrepOptions',
                            \ '<plug>EgMapGrepCurrentWord_v', '<plug>EgMapGrepSelection_v',
                            \ '<plug>EgMapGrepCurrentWord_V', '<plug>EgMapGrepSelection_V',
                            \ '<plug>EgMapGrepCurrentWord_a', '<plug>EgMapGrepSelection_a',
                            \ '<plug>EgMapGrepCurrentWord_A', '<plug>EgMapGrepSelection_A',
                            \ '<plug>EgMapGrepCurrentWord_r', '<plug>EgMapGrepSelection_r',
                            \ '<plug>EgMapGrepCurrentWord_R', '<plug>EgMapGrepSelection_R',
                            \ ]}}
                map <Leader>vo <plug>EgMapGrepOptions
                map <Leader>vv <plug>EgMapGrepCurrentWord_v
                vmap <Leader>vv <plug>EgMapGrepSelection_v
                map <Leader>vV <plug>EgMapGrepCurrentWord_V
                vmap <Leader>vV <plug>EgMapGrepSelection_V
                map <Leader>va <plug>EgMapGrepCurrentWord_a
                vmap <Leader>va <plug>EgMapGrepSelection_a
                map <Leader>vA <plug>EgMapGrepCurrentWord_A
                vmap <Leader>vA <plug>EgMapGrepSelection_A
                map <Leader>vr <plug>EgMapReplaceCurrentWord_r
                vmap <Leader>vr <plug>EgMapReplaceSelection_r
                map <Leader>vR <plug>EgMapReplaceCurrentWord_R
                vmap <Leader>vR <plug>EgMapReplaceSelection_R
            " }}}

            " Window and buffer {{{
                NeoBundle 'techlivezheng/vim-plugin-minibufexpl'
                NeoBundle 'kien/tabman.vim'

                NeoBundle 'bufexplorer.zip'
                let g:bufExplorerDefaultHelp      = 0            " Do not show default help.
                let g:bufExplorerShowRelativePath = 1            " Show relative paths.
                let g:bufExplorerSortBy           = 'mru'        " Sort by most recently used.
                let g:bufExplorerSplitRight       = 0            " Split left.
                let g:bufExplorerSplitVertical    = 1            " Split vertically.
                let g:bufExplorerSplitVertSize    = 30           " Split width
                let g:bufExplorerUseCurrentWindow = 1            " Open in new window
                au BufWinEnter \[Buf\ List\] setlocal nonumber

                " NeoBundle 'spolu/dwm.vim'
                " nmap <leader>. <Plug>DWMFocus
                " nmap <leader>dn <Plug>DWMNew
                " nmap g. <Plug>DWMRotateClockwise
                " nmap g/ <Plug>DWMRotateCounterclockwise

                " NeoBundle 'bling/vim-bufferline'
                let g:bufferline_echo = 0

                nnoremap <leader>1 :e#1<cr>
                nnoremap <leader>2 :e#2<cr>
                nnoremap <leader>3 :e#3<cr>
                nnoremap <leader>4 :e#4<cr>
                nnoremap <leader>5 :e#5<cr>
                nnoremap <leader>6 :e#6<cr>
                nnoremap <leader>7 :e#7<cr>
                nnoremap <leader>8 :e#8<cr>
                nnoremap <leader>9 :e#9<cr>
                nnoremap <leader>0 :e#10<cr>
                nnoremap \1 :e#11<cr>
                nnoremap \2 :e#12<cr>
                nnoremap \3 :e#13<cr>
                nnoremap \4 :e#14<cr>
                nnoremap \5 :e#15<cr>
                nnoremap \6 :e#16<cr>
                nnoremap \7 :e#17<cr>
                nnoremap \8 :e#18<cr>
                nnoremap \9 :e#19<cr>
                nnoremap \0 :e#20<cr>
            " }}}

            " Edit {{{
                NeoBundle 'DrawIt'
                NeoBundle 'jiangmiao/auto-pairs'
                NeoBundle 'tpope/vim-surround'
                NeoBundle 'terryma/vim-multiple-cursors'
                NeoBundle 'tpope/vim-speeddating'
                NeoBundle 'tpope/vim-repeat'
                NeoBundle 'chrisbra/NrrwRgn'

                NeoBundle 'tpope/vim-abolish.git'
                nnoremap <leader>sv :%Subvert/

                NeoBundle 'Dewdrops/vim-unimpaired'
                nmap <c-up> [e
                nmap <c-down> ]e
                vmap <c-up> [e
                vmap <c-down> ]e

                NeoBundleLazy 'sketch.vim',
                            \ {'autoload': {'functions': 'ToggleSketch'}}
                nmap <leader>sk :call ToggleSketch()<cr>

                NeoBundleLazy 'osyo-manga/vim-over',
                            \ {'autoload': {'commands': 'OverCommandLine'}}
                nnoremap <leader>ov :OverCommandLine<cr>:%s/

                NeoBundleLazy 'tommcdo/vim-exchange',
                            \ {'autoload': {'mappings': ['<Plug>(Exchange)', '<Plug>(ExchangeLine)']}}
                let g:exchange_no_mappings = 1
                nmap gx <Plug>(Exchange)
                vmap gx <Plug>(Exchange)
                nmap gxc <Plug>(ExchangeClear)
                nmap gxx <Plug>(ExchangeLine)

                NeoBundleLazy 'sjl/gundo.vim',
                            \ {'autoload': {'commands': 'GundoToggle'}}
                nnoremap <Leader>ut :GundoToggle<cr>
            " }}}

            " Motion {{{
                NeoBundle 'thinca/vim-visualstar'
                NeoBundle 'bruno-/vim-vertical-move'

                NeoBundle 'dahu/vim-fanfingtastic'
                map <unique><silent> <leader><leader> <Plug>fanfingtastic_,

                NeoBundleLazy 'takac/vim-easymotion',
                            \ {'autoload': {'mappings': ['<Plug>(easymotion-f)',
                            \ '<Plug>(easymotion-F)']}}
                nmap <space> <Plug>(easymotion-f)
                nmap g<space> <Plug>(easymotion-F)
                let EasyMotion_leader_key  = '<leader>em'
                let g:EasyMotion_mapping_f = '<space>'
                let g:EasyMotion_mapping_F = 'g<space>'

                if count(g:dewdrops_bundle_groups, 'textobj')
                    NeoBundle 'wellle/targets.vim'
                    NeoBundle 'kana/vim-textobj-user'
                    NeoBundle 'kana/vim-textobj-indent'
                    NeoBundle 'thinca/vim-textobj-between'
                endif
            " }}}

            " UI {{{
                NeoBundle 'szw/vim-maximizer'

                NeoBundle 'bling/vim-airline'
                let g:airline#extensions#hunks#non_zero_only = 1

                NeoBundle 'Dewdrops/vim-tomorrow-theme'
                nmap <leader>cor :colo ron<cr>
                nmap <leader>cod :colo desert<cr>
                nmap <leader>cot :colo Tomorrow-Night-Eighties<cr>
                " colo Tomorrow-Night-Eighties

                NeoBundleLazy 'bilalq/lite-dfm',
                            \ {'autoload': {'commands': 'LiteDFMToggle'}}
                nnoremap <silent><leader>ld :LiteDFMToggle<cr>
            " }}}

            " Misc {{{
                NeoBundle 'goldfeld/ctrlr.vim'
                NeoBundle 'justinmk/vim-gtfo'
                NeoBundle 'thinca/vim-prettyprint'

                NeoBundle 'thinca/vim-ref'
                let g:ref_perldoc_auto_append_f = 1

                NeoBundle 'kshenoy/vim-signature'
                nnoremap <leader>sg :SignatureToggle<cr>

                NeoBundleLazy 'Dewdrops/vim-highlight-pattern',
                            \ {'autoload': {'mappings':
                            \ ['<Plug>(VHP_HighlightWordToggle)', '<Plug>(VHP_HighlightRegionToggle)',
                            \ '<Plug>(VHP_HighlightPattern)', '<Plug>(VHP_HighlightClear)']}}
                nmap <leader>hl <Plug>(VHP_HighlightWordToggle)
                vmap <leader>hl <Plug>(VHP_HighlightRegionToggle)
                nmap <leader>hp <Plug>(VHP_HighlightPattern)
                nmap <leader>/ <Plug>(VHP_HighlightClear)

                NeoBundleLazy 'vim-scripts/sessionman.vim',
                            \ {'autoload': {'commands': ['SessionList', 'SessionSave']}}
                let sessionman_save_on_exit = 0
                nmap <leader>sl :SessionList<cr>
                nmap <leader>ss :SessionSave<cr>

                NeoBundleLazy 'mattn/calendar-vim',
                            \ {'autoload': {'commands': ['Calendar', 'CalendarH']}}
                nnoremap <leader>cal :Calendar<cr>
                nnoremap <leader>caL :CalendarH<cr>

                NeoBundleLazy 'arecarn/crunch',
                            \ {'autoload': {'commands': ['Crunch', 'CrunchBlock', 'CrunchLine']}}
                nnoremap <leader>cr :Crunch<space>

                NeoBundleLazy 'tyru/open-browser.vim',
                            \ {'autoload': {'commands': 'OpenBrowserSearch',
                            \ 'mappings': '<Plug>(openbrowser-open)'}}
                nmap <Leader>fu <Plug>(openbrowser-open)
                vmap <Leader>fu <Plug>(openbrowser-open)
                nnoremap <Leader>fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
            " }}}

        endif
    " }}}

    " General Programming {{{
        if count(g:dewdrops_bundle_groups, 'programming')
            NeoBundle 'tpope/vim-endwise'
            NeoBundle 'Dewdrops/swap-parameters'
            NeoBundle 'amdt/vim-niji'
            NeoBundle 'tpope/vim-dispatch'
            " NeoBundle 'scrooloose/syntastic'

            NeoBundle 'AndrewRadev/splitjoin.vim'
            let g:splitjoin_split_mapping = 'cS'
            let g:splitjoin_join_mapping  = 'cJ'

            NeoBundle 'matchit.zip'
            let b:match_ignorecase = 1

            NeoBundleLazy 'Chiel92/vim-autoformat',
                        \ {'autoload': {'commands': 'Autoformat'}}
            nnoremap <leader>gq :Autoformat<cr>

            NeoBundleLazy 'a.vim',
                        \ {'autoload': {'commands': ['A']}}
            nnoremap <leader>aa :A<cr>

            NeoBundleLazy 'thinca/vim-quickrun',
                        \ {'autoload': {'commands': ['QuickRun']}}
            nnoremap <leader>kr :QuickRun -outputter/buffer/into 1<cr>

            " tcomment {{{
                NeoBundleLazy 'tomtom/tcomment_vim',
                        \ {'autoload': {'commands': ['TCommentMaybeInline'],
                        \ 'functions': ['tcomment#SetOption', 'tcomment#Operator', 'tcomment#OperatorLine',
                        \ 'TCommentMaybeInline', 'tcomment#OperatorAnyway', 'tcomment#OperatorLineAnyway']}}
                nnoremap <silent> gc :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#Operator<cr>g@
                nnoremap <silent> gcc :let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLine<cr>g@$
                xnoremap <silent> gc :TCommentMaybeInline<cr>
                nnoremap <silent> gC :let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorAnyway<cr>g@
                nnoremap <silent> gCc :let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLineAnyway<cr>g@$
                xnoremap <silent> gC :TCommentMaybeInline!<cr>
                nmap <silent><leader>ci gcc
                vmap <silent><leader>ci gc
                nmap <silent><leader>cc yygccP
                vmap <silent><leader>cc ygvgcP
                nmap <silent><leader>cy yygcc
                vmap <silent><leader>cy ygvgc
            " }}}

            " EasyAlign {{{
                NeoBundleLazy 'junegunn/vim-easy-align',
                        \ {'autoload': {'commands': 'EasyAlign'}}
                let g:easy_align_delimiters = {
                            \ '>': { 'pattern': '>>\|=>\|>' },
                            \ '"': { 'pattern': '"', 'ignore_groups': [] },
                            \ '/': { 'pattern': '//\+\|/\*\|\*/', 'ignore_groups': ['String'] },
                            \ '#': { 'pattern': '#\+', 'ignore_groups': ['String'], 'delimiter_align': 'l' },
                            \ ']': {
                            \     'pattern':       '[[\]]',
                            \     'left_margin':   0,
                            \     'right_margin':  0,
                            \     'stick_to_left': 0
                            \   },
                            \ ')': {
                            \     'pattern':       '[()]',
                            \     'left_margin':   0,
                            \     'right_margin':  0,
                            \     'stick_to_left': 0
                            \   },
                            \ 'd': {
                            \     'pattern': ' \(\S\+\s*[;=]\)\@=',
                            \     'left_margin': 0,
                            \     'right_margin': 0
                            \   }
                            \ }

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
            " }}}

            " Ack {{{
                if executable('ack') || executable('ag')
                    NeoBundleLazy 'dyng/ctrlsf.vim',
                        \ {'autoload': {'commands': 'CtrlSF'}}
                elseif executable('ack-grep')
                    let g:ctrlsf_ackprg = 'ack-grep'
                    NeoBundleLazy 'dyng/ctrlsf.vim',
                        \ {'autoload': {'commands': 'CtrlSF'}}
                endif
                nnoremap <leader>ak :CtrlSF<space>
            " }}}

            " ctags {{{
                if executable('ctags')
                    " NeoBundle 'xolox/vim-easytags'
                    NeoBundleLazy 'majutsushi/tagbar',
                                \ {'autoload': {'commands': 'TagbarToggle'}}

                    set tags=./tags;/,~/.vimtags;../tags;.../tags

                    nnoremap <silent><leader>tt :TagbarToggle<cr>
                    nnoremap <silent><f8> :TagbarToggle<cr>
                    inoremap <silent><f8> <esc>:TagbarToggle<cr>a

                    " And make sure gotags is in your path
                    if count(g:dewdrops_bundle_groups, 'go')
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
                    endif
                endif
            " }}}

            if count(g:dewdrops_bundle_groups, 'indent')
                NeoBundle 'nathanaelkane/vim-indent-guides'
                let g:indent_guides_start_level           = 2
                let g:indent_guides_guide_size            = 1
                let g:indent_guides_enable_on_vim_startup = 1
                let g:indent_guides_exclude_filetypes     = ['help', 'nerdtree', 'startify', 'vundle']

                if !has('gui_running')
                    let g:indent_guides_auto_colors = 0
                    hi IndentGuidesOdd  ctermbg=black
                    hi IndentGuidesEven ctermbg=darkgrey
                endif
            endif
        endif
    " }}}

    " Git {{{
        if count(g:dewdrops_bundle_groups, 'git')
            NeoBundle 'mhinz/vim-signify'

            NeoBundle 'tpope/vim-fugitive'
            nnoremap <leader>gs :Gstatus<cr>
            nnoremap <leader>gd :Gdiff<cr>
            nnoremap <leader>gc :Gcommit<cr>
            nnoremap <leader>ga :Gcommit --amend<cr>
            nnoremap <leader>gb :Gblame<cr>
            nnoremap <leader>gl :Glog<cr>
            nnoremap <leader>gp :Git push https://github.com/Dewdrops/
            " add :w to trigger gitgutter
            nnoremap <leader>gr :Gwrite<cr>:w<cr>
            autocmd FileType gitcommit nmap <buffer> U :Git checkout -- <C-r><C-g><CR>
            autocmd BufReadPost fugitive://* set bufhidden=delete

            NeoBundleLazy 'gregsexton/gitv',
                        \ {'depends': ['tpope/vim-fugitive'], 'autoload': {'commands': 'Gitv'}}
            nnoremap <leader>gv :Gitv<cr>

            NeoBundleLazy 'rhysd/git-messenger.vim',
                        \ {'autoload': {'commands': 'GitMessengerToggle'}}
            nnoremap <leader>gm :GitMessengerToggle<cr>
        endif
    " }}}

    " Snippets & AutoComplete {{{

        if count(g:dewdrops_bundle_groups, 'neocomplete')

            " neocomplcache and neocomplete {{{
                if has('lua') && (v:version > 703 || v:version == 703 && has('patch885'))
                    NeoBundle 'Shougo/unite.vim'
                    NeoBundle 'Shougo/neocomplete'
                else
                    NeoBundle 'Shougo/neocomplcache'
                endif
                NeoBundle 'Shougo/neosnippet'
                NeoBundle 'honza/vim-snippets'

                let g:acp_enableAtStartup = 0

                if !( has('lua') && (v:version > 703 || v:version == 703 && has('patch885')) )
                    let g:neocomplcache_enable_at_startup            = 1
                    let g:neocomplcache_enable_camel_case_completion = 1
                    let g:neocomplcache_enable_smart_case            = 1
                    let g:neocomplcache_enable_underbar_completion   = 1
                    let g:neocomplcache_enable_auto_delimiter        = 1
                    let g:neocomplcache_max_list                     = 15
                    let g:neocomplcache_force_overwrite_completefunc = 1

                    " Define dictionary.
                    let g:neocomplcache_dictionary_filetype_lists = {
                                \ 'default' : '',
                                \ }

                    " Define keyword.
                    if !exists('g:neocomplcache_keyword_patterns')
                        let g:neocomplcache_keyword_patterns = {}
                    endif
                    let g:neocomplcache_keyword_patterns._ = '\h\w*'

                    inoremap <expr><C-g> neocomplcache#undo_completion()
                    inoremap <expr><C-l> neocomplcache#complete_common_string()
                    inoremap <expr><cr> neocomplcache#complete_common_string()

                    " <C-h>, <BS>: close popup and delete backword char.
                    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
                    inoremap <expr><C-y> neocomplcache#close_popup()

                    " Enable heavy omni completion.
                    if !exists('g:neocomplcache_omni_patterns')
                        let g:neocomplcache_omni_patterns = {}
                    endif
                    let g:neocomplcache_omni_patterns.php  = '[^. \t]->\h\w*\|\h\w*::'
                    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
                    let g:neocomplcache_omni_patterns.c    = '[^.[:digit:] *\t]\%(\.\|->\)'
                    let g:neocomplcache_omni_patterns.cpp  = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
                    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
                else
                    let g:neocomplete#enable_at_startup            = 1
                    let g:neocomplete#enable_camel_case_completion = 1
                    let g:neocomplete#enable_smart_case            = 1
                    let g:neocomplete#enable_underbar_completion   = 1
                    let g:neocomplete#enable_auto_delimiter        = 1
                    let g:neocomplete#max_list                     = 15
                    let g:neocomplete#force_overwrite_completefunc = 1

                    " Define dictionary.
                    let g:neocomplete#sources#dictionary#dictionaries = {
                                \ 'default' : '',
                                \ }

                    " Define keyword.
                    if !exists('g:neocomplete_keyword_patterns')
                        let g:neocomplete#keyword_patterns = {}
                    endif
                    let g:neocomplete#keyword_patterns._ = '\h\w*'

                    inoremap <expr><c-g> neocomplete#undo_completion()
                    inoremap <expr><c-l> neocomplete#complete_common_string()
                    inoremap <expr><cr> neocomplete#complete_common_string()

                    " <C-h>, <BS>: close popup and delete backword char.
                    inoremap <expr><bs> neocomplete#smart_close_popup()."\<C-h>"
                    inoremap <expr><c-y> neocomplete#close_popup()

                    " Enable heavy omni completion.
                    if !exists('g:neocomplete#sources#omni#input_patterns')
                        let g:neocomplete#sources#omni#input_patterns = {}
                    endif
                    let g:neocomplete#sources#omni#input_patterns.php  = '[^. \t]->\h\w*\|\h\w*::'
                    let g:neocomplete#sources#omni#input_patterns.c    = '[^.[:digit:] *\t]\%(\.\|->\)'
                    let g:neocomplete#sources#omni#input_patterns.cpp  = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
                    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
                    let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
                endif

                imap <C-k> <Plug>(neosnippet_expand_or_jump)
                smap <C-k> <Plug>(neosnippet_expand_or_jump)
                xmap <C-k> <Plug>(neosnippet_expand_target)

                " <TAB>: expand snippets or navigate in list
                imap <expr><tab> pumvisible() ? "\<C-n>" :
                            \ neosnippet#expandable_or_jumpable() ?
                            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
                imap <expr><s-tab> pumvisible() ? "\<C-p>" :
                            \ neosnippet#expandable_or_jumpable() ?
                            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<s-tab>"

                " Use honza's snippets.
                let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

                " Enable neosnippet snipmate compatibility mode
                let g:neosnippet#enable_snipmate_compatibility = 1

                " For snippet_complete marker.
                if has('conceal')
                    set conceallevel=2 concealcursor=i
                endif

                " Disable the neosnippet preview candidate window
                " when enabled, or there can be too much visual noise
                " especially when splits are used
                set completeopt-=preview
            " }}}

        elseif count(g:dewdrops_bundle_groups, 'ycm')

            " YouCompleteMe {{{
                NeoBundle 'Valloric/YouCompleteMe'
                " NeoBundle 'SirVer/ultisnips'

                let g:ycm_complete_in_comments_and_strings = 1
                let g:ycm_key_list_select_completion       = ['<tab>', '<C-n>', '<Down>']
                let g:ycm_key_list_previous_completion     = ['<s-tab>', '<C-p>', '<Up>']
                let g:ycm_filetype_blacklist               = {'unite': 1}
                let g:ycm_global_ycm_extra_conf            = '~/.ycm_extra_conf.py'
                let g:ycm_confirm_extra_conf               = 0
                let g:ycm_enable_diagnostic_signs          = 0

                " configuration of UltiSnips
                let g:UltiSnipsExpandTrigger               = "<c-k>"
                let g:UltiSnipsJumpForwardTrigger          = "<c-k>"
                let g:UltiSnipsJumpBackwardTrigger         = "<c-j>"
                let g:UltiSnipsSnippetsDir                 = '~/.vim/snippets'

                nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<cr>
            "}}}

        endif

    " }}}

    " PHP {{{
        if count(g:dewdrops_bundle_groups, 'php')
            NeoBundle 'spf13/PIV'
            let g:DisableAutoPHPFolding = 0
            "let g:PIVAutoClose = 0

            NeoBundle 'beyondwords/vim-twig'
            au FileType twig au BufWritePre <buffer> call StripTrailingWhitespace()
            au BufNewFile,BufRead *.html.twig set filetype=html.twig

            NeoBundle 'arnaud-lb/vim-php-namespace'
            NeoBundle 'shawncplus/phpcomplete.vim'
        endif
    " }}}

    " Python {{{
        if count(g:dewdrops_bundle_groups, 'python')
            NeoBundle 'hdima/python-syntax'
            NeoBundle 'python_match.vim'

            NeoBundle 'klen/python-mode'
            let g:pymode_doc      = 1
            let g:pymode_doc_bind = 'K'
            " Disable if python support not present
            if !has('python')
                let g:pymode = 1
            endif
            let g:pymode_lint_checker      = "pyflakes"
            let g:pymode_utils_whitespaces = 0
            let g:pymode_options           = 0
        endif
    " }}}

    " Scala {{{
        if count(g:dewdrops_bundle_groups, 'scala')
            NeoBundle 'derekwyatt/vim-scala'
            NeoBundle 'derekwyatt/vim-sbt'
        endif
    " }}}

    " Clojure {{{
        if count(g:dewdrops_bundle_groups, 'clojure')
            NeoBundle 'guns/vim-clojure-static'
            NeoBundle 'tpope/vim-fireplace'
            NeoBundle 'guns/vim-clojure-highlight'
            NeoBundle 'tpope/vim-classpath'
        endif
    " }}}

    " Haskell {{{
        if count(g:dewdrops_bundle_groups, 'haskell')
            NeoBundle 'travitch/hasksyn'
            NeoBundle 'dag/vim2hs'

            NeoBundle 'lukerandall/haskellmode-vim'
            let g:haddock_browser = "/usr/bin/opera"
        endif
    " }}}

    " HTML {{{
        if count(g:dewdrops_bundle_groups, 'html')
            NeoBundle 'tpope/vim-haml'
            NeoBundle 'Valloric/MatchTagAlways'

            NeoBundle 'amirh/HTML-AutoCloseTag'
            " Make it so AutoCloseTag works for xhtml files as well
            au FileType xhtml ru ftplugin/html/autoclosetag.vim

            NeoBundle 'mattn/emmet-vim'
            let g:user_emmet_leader_key = '<c-g>'            " use C-g instead
            let g:user_emmet_mode       = 'i'
        endif
    " }}}

    " CSS {{{
        if count(g:dewdrops_bundle_groups, 'css')
            NeoBundle 'hail2u/vim-css3-syntax'
            NeoBundle 'cakebaker/scss-syntax.vim'
            NeoBundle 'groenewege/vim-less'
        endif
    " }}}

    " Javascript {{{
        if count(g:dewdrops_bundle_groups, 'javascript')
            NeoBundle 'pangloss/vim-javascript'
            NeoBundle 'briancollins/vim-jst'
            NeoBundle 'kchmck/vim-coffee-script'

            NeoBundle 'elzr/vim-json'
            nmap <leader>jt <Esc>:%!python -m json.tool<cr><Esc>:set filetype=json<cr>
        endif
    " }}}

    " Ruby {{{
        if count(g:dewdrops_bundle_groups, 'ruby')
            NeoBundle 'vim-ruby/vim-ruby'
            NeoBundle 'tpope/vim-rails'

            autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading    = 1
            autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
            autocmd FileType ruby,eruby let g:rubycomplete_rails             = 1
        endif
    " }}}

    " Perl {{{
        if count(g:dewdrops_bundle_groups, 'perl')
            NeoBundle 'vim-perl/vim-perl'
        endif
    " }}}

    " CSharp {{{
        if count(g:dewdrops_bundle_groups, 'csharp')
            NeoBundle 'nosami/Omnisharp'
        endif
    " }}}

    " Lua {{{
        if count(g:dewdrops_bundle_groups, 'lua')
            NeoBundle 'xolox/vim-misc'
            NeoBundle 'xolox/vim-lua-ftplugin'
        endif
    " }}}

    " Go Lang {{{
        if count(g:dewdrops_bundle_groups, 'go')
            NeoBundle 'jnwhiteh/vim-golang'
            NeoBundle 'spf13/vim-gocode'

            au FileType go au BufWritePre <buffer> Fmt
        endif
    " }}}

    " Cucumber {{{
        if count(g:dewdrops_bundle_groups, 'cucumber')
            NeoBundle 'tpope/vim-cucumber'
            NeoBundle 'quentindecock/vim-cucumber-align-pipes'
        endif
    " }}}

    " Puppet {{{
        if count(g:dewdrops_bundle_groups, 'puppet')
            NeoBundle 'Puppet-Syntax-Highlighting'
        endif
    " }}}

    " Misc {{{
        if count(g:dewdrops_bundle_groups, 'misc')
            NeoBundle 'tpope/vim-markdown',
            NeoBundle 'chrisbra/csv.vim'
            NeoBundle 'xml.vim'

            NeoBundle 'jceb/vim-orgmode'
            au FileType org setlocal fdm=expr

            NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
            let g:LatexBox_Folding = 1
        endif
    " }}}

" }}}

" Finish initializations {{{
    filetype plugin indent on
    syntax enable
    NeoBundleCheck
" }}}
