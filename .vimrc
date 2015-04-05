" Modeline and Notes {{{
" vim: sw=4 ts=4 sts=4 et tw=80 foldmarker={{{,}}} foldlevel=0 foldmethod=marker
"
"   This is the personal .vimrc file of Dewdrops (v_v_4474@126.com). some code are
"   stolen from spf13-vim (https://github.com/spf13/spf13-vim).
" }}}

" Environment {{{

    " Load basic configuration
    source ~/.vimrc_tiny

    " Set up NeoBundle Support
    if has('vim_starting')
        if &compatible | set nocompatible | endif

        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif

    call neobundle#begin(expand('~/.vim/bundle/'))

    NeoBundleFetch 'Shougo/neobundle.vim'

" }}}

" Bundles {{{

    " Bundle group configuration {{{
        if !exists('g:dewdrops_bundle_groups')
            let g:dewdrops_bundle_groups = [
                        \     'general',
                        \     'programming',
                        \     'textobj',
                        \     'ycm',
                        \     'git',
                        \     'unite',
                        \     'lisp',
                        \     'vimproc',
                        \     'haskell',
                        \     'misc'
                        \ ]
        endif
    " }}}

    " General {{{
        if count(g:dewdrops_bundle_groups, 'general')

            " Tree File Manager {{{
                NeoBundle 'scrooloose/nerdtree',
                            \ {'autoload': {'commands': ['NERDTreeToggle', 'NERDTreeFind']}}
                " map <Leader>nt :NERDTreeToggle<cr>
                " map <Leader>nf :NERDTreeFind<cr>
                let NERDTreeShowBookmarks               = 1
                let NERDTreeIgnore                      = ['\.pyc', '\.elc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
                let NERDTreeChDirMode                   = 0
                let NERDTreeQuitOnOpen                  = 1
                let NERDTreeMouseMode                   = 2
                let NERDTreeShowHidden                  = 1
                let NERDTreeKeepTreeInNewTab            = 1
                let g:nerdtree_tabs_open_on_gui_startup = 0

                NeoBundle 'jistr/vim-nerdtree-tabs'
                map <Leader>nt <plug>NERDTreeTabsToggle<cr>
                map <Leader>nf <plug>NERDTreeTabsFind<cr>

                NeoBundleLazy 'troydm/easytree.vim',
                            \ {'autoload': {'commands': ['EasyTree', 'EasyTreeToggle']}}
                map <Leader>et :EasyTreeToggle<cr>
            " }}}

            " Seek {{{
                NeoBundle 'goldfeld/vim-seek'
                " let g:SeekKey                         = 'S'
                " let g:SeekBackKey                     = '<leader>S'
                " let g:seekJumpPresentialInnerKey      = 'gz'
                " let g:seekBackJumpPresentialInnerKey  = 'gZ'
                " let g:seekJumpRemoteInnerKey          = 'gu'
                " let g:seekBackJumpRemoteInnerKey      = 'gU'
                " let g:seekJumpPresentialAroundKey     = 'z'
                " let g:seekBackJumpPresentialAroundKey = 'Z'
                " let g:seekJumpRemoteAroundKey         = 'u'
                " let g:seekBackJumpRemoteAroundKey     = 'U'
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

                if executable('fortune') && executable('cowsay')
                    let g:startify_custom_header =
                                \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
                else
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
                endif
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

            " vim-swoop {{{
                NeoBundleLazy 'pelodelfuego/vim-swoop',
                            \ {'autoload': {'functions': ['Swoop', 'SwoopSelection',
                            \ 'SwoopMulti', 'SwoopMultiSelection'],
                            \ 'commands': ['Swoop']}}

                let g:swoopUseDefaultKeyMap = 0
                nmap <leader>ms :call Swoop()<cr>
                vmap <leader>ms :call SwoopSelection()<cr>
                nmap <leader>ml :call SwoopMulti()<cr>
                vmap <leader>ml :call SwoopMultiSelection()<cr>

                function! Multiple_cursors_before()
                    if exists('*SwoopFreezeContext') != 0
                        call SwoopFreezeContext()
                    endif
                endfunction
                function! Multiple_cursors_after()
                    if exists('*SwoopUnFreezeContext') != 0
                        call SwoopUnFreezeContext()
                    endif
                endfunction
            " }}}

            " Window and buffer {{{
                " NeoBundle 'bling/vim-bufferline'
                " let g:bufferline_echo = 0

                NeoBundle 'techlivezheng/vim-plugin-minibufexpl'
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

                NeoBundleLazy 'troydm/easybuffer.vim',
                            \ {'autoload': {'commands': 'EasyBuffer'}}
                nmap <leader>bs :EasyBuffer<cr>
            " }}}

            " Edit {{{
                NeoBundle 'tpope/vim-speeddating'
                NeoBundle 'jiangmiao/auto-pairs'
                NeoBundle 'tpope/vim-surround'
                NeoBundle 'terryma/vim-multiple-cursors'
                NeoBundle 'tpope/vim-repeat'
                NeoBundle 'chrisbra/NrrwRgn'
                NeoBundle 'vim-scripts/ReplaceWithRegister'
                NeoBundle 'junegunn/vim-peekaboo'

                NeoBundle 'tpope/vim-abolish.git'
                nnoremap <leader>sv :%Subvert/

                NeoBundle 'Dewdrops/vim-unimpaired'
                nmap <c-up> [e
                nmap <c-down> ]e
                vmap <c-up> [e
                vmap <c-down> ]e

                NeoBundleLazy 'Shougo/vinarise.vim',
                            \ {'autoload': {'commands': 'Vinarise'}}
                nmap <leader>xx :Vinarise<cr>

                NeoBundleLazy 'vim-scripts/DrawIt',
                            \ {'autoload': {'mappings': '<Plug>DrawItStart'}}
                nmap <unique> <Leader>di <Plug>DrawItStart

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

                NeoBundleLazy 'mbbill/undotree',
                            \ {'autoload': {'commands': 'UndotreeToggle'}}
                nnoremap <Leader>ut :UndotreeToggle<cr>
            " }}}

            " Motion {{{
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
                let g:EasyMotion_mapping_F = '<space><space>'

                if count(g:dewdrops_bundle_groups, 'textobj')
                    NeoBundle 'wellle/targets.vim'
                    NeoBundle 'jeetsukumaran/vim-indentwise'
                    NeoBundle 'kana/vim-textobj-user'
                    NeoBundle 'kana/vim-textobj-indent'
                    NeoBundle 'thinca/vim-textobj-between'
                else
                    NeoBundle 'PeterRincker/vim-argumentative'
                endif
            " }}}

            " UI {{{
                NeoBundle 'szw/vim-maximizer'

                NeoBundle 'bling/vim-airline'
                let g:airline#extensions#hunks#non_zero_only = 1
                let g:airline_exclude_preview                = 1

                NeoBundle 'Dewdrops/vim-tomorrow-theme'
                nmap <leader>cor :colo ron<cr>
                nmap <leader>cod :colo desert<cr>
                nmap <leader>cot :colo Tomorrow-Night-Eighties<cr>

                NeoBundleLazy 'junegunn/goyo.vim',
                            \ {'autoload': {'commands': 'Goyo'}}
                nnoremap <silent><leader>gy :Goyo<cr>

                NeoBundleLazy 'junegunn/limelight.vim',
                            \ {'autoload': {'commands': 'Limelight'}}
                let g:limelight_conceal_ctermfg = 'gray'
                let g:limelight_conceal_guifg   = 'DarkGray'
                function! GoyoBefore()
                    Limelight
                endfunction
                function! GoyoAfter()
                    Limelight!
                endfunction
                let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]
            " }}}

            " Misc {{{
                NeoBundle 'Dewdrops/SearchComplete'
                NeoBundle 'ConradIrwin/vim-bracketed-paste'
                NeoBundle 'vim-scripts/LargeFile'
                " NeoBundle 'mtth/scratch.vim'
                NeoBundle 'justinmk/vim-gtfo'
                NeoBundle 'chrisbra/vim-diff-enhanced'
                NeoBundle 'tpope/vim-eunuch'
                NeoBundle 'exvim/ex-visincr'
                NeoBundle 'chrisbra/Recover.vim'
                NeoBundle 'AndrewRadev/linediff.vim'
                NeoBundle 'tpope/vim-characterize'
                " NeoBundle 'nicwest/QQ.vim'
                NeoBundle 'thinca/vim-prettyprint'
                " NeoBundle 'MattesGroeger/vim-bookmarks'

                " NeoBundle 'thinca/vim-ref'
                " let g:ref_perldoc_auto_append_f = 1

                " NeoBundle 'kshenoy/vim-signature'
                " nnoremap <leader>sg :SignatureToggle<cr>

                NeoBundleLazy 'dahu/vim-lotr',
                            \ {'autoload': {'mappings': '<plug>LOTRToggle'}}
                nmap <leader>lr <plug>LOTRToggle

                NeoBundleLazy 'ryanss/vim-hackernews',
                            \ {'autoload': {'commands': 'HackerNews'}}

                NeoBundleLazy 'Shougo/junkfile.vim',
                            \ {'autoload':{'commands':'JunkfileOpen',
                            \ 'unite_sources':['junkfile','junkfile/new']}}

                NeoBundleLazy 'Dewdrops/vim-interestingwords',
                            \ {'autoload': {'functions':
                            \ ['InterestingWords', 'UncolorAllWords', 'WordNavigation']}}
                let g:interestingWordsDefaultMappings = 0
                nnoremap <silent> <leader>hl :call InterestingWords() \| nohls<cr>
                nnoremap <silent> <leader>/ :call UncolorAllWords() \| nohls<cr>
                nnoremap <silent> n :call WordNavigation(1)<cr>zz
                nnoremap <silent> N :call WordNavigation(0)<cr>zz

                NeoBundleLazy 'vim-scripts/sessionman.vim',
                            \ {'autoload': {'commands': ['SessionList', 'SessionSave']}}
                let sessionman_save_on_exit = 0
                nmap <leader>sl :SessionList<cr>
                nmap <leader>ss :SessionSave<cr>

                NeoBundleLazy 'mbbill/fencview',
                            \ {'autoload': {'commands': 'FencAutoDetect'}}

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
            NeoBundle 'octol/vim-cpp-enhanced-highlight'
            NeoBundle 'tpope/vim-dispatch'
            NeoBundle 'bruno-/vim-man'

            " NeoBundle 'scrooloose/syntastic'
            " let g:syntastic_enable_perl_checker = 1

            NeoBundle 'AndrewRadev/splitjoin.vim'
            let g:splitjoin_split_mapping = 'cS'
            let g:splitjoin_join_mapping  = 'cJ'

            NeoBundle 'matchit.zip'
            let b:match_ignorecase = 1

            NeoBundle 'SirVer/ultisnips'
            NeoBundle 'Dewdrops/vim-snippets'
            let g:UltiSnipsExpandTrigger       = "<c-k>"
            let g:UltiSnipsJumpForwardTrigger  = "<c-k>"
            let g:UltiSnipsJumpBackwardTrigger = "<c-j>"

            NeoBundleLazy 'szw/vim-ctrlspace',
                        \ {'autoload': {'commands': 'CtrlSpace'}}
            map <leader><space> :CtrlSpace<cr>

            NeoBundleLazy 'Chiel92/vim-autoformat',
                        \ {'autoload': {'commands': 'Autoformat'}}
            nnoremap <leader>gq :Autoformat<cr>

            NeoBundleLazy 'jaxbot/semantic-highlight.vim',
                        \ {'autoload': {'commands': 'SemanticHighlight'}}
            nnoremap <leader>sh :SemanticHighlight<cr>

            NeoBundleLazy 'AndrewRadev/switch.vim',
                        \ {'autoload': {'commands': 'Switch'}}
            nnoremap - :Switch<cr>

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
                nmap <silent><leader>C yygccp
                vmap <silent><leader>C ygvgc'>p
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

                vnoremap <silent> <space> :EasyAlign<cr>
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
                    NeoBundle 'ludovicchabant/vim-gutentags'
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

    " Unite & CtrlP {{{
        if count(g:dewdrops_bundle_groups, 'unite')
            " Unite {{{
                NeoBundle 'Shougo/unite.vim'

                NeoBundleLazy 'Shougo/neomru.vim', {'autoload': {'unite_sources':'file_mru'}}
                NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload': {'unite_sources':'colorscheme'}}
                NeoBundleLazy 'tsukkee/unite-tag', {'autoload': {'unite_sources':['tag','tag/file']}}
                NeoBundleLazy 'Shougo/unite-outline', {'autoload': {'unite_sources':'outline'}}
                NeoBundleLazy 'Shougo/unite-help', {'autoload': {'unite_sources':'help'}}

                let bundle_unite = neobundle#get('unite.vim')
                function! bundle_unite.hooks.on_source(_)
                    call unite#filters#matcher_default#use(['matcher_fuzzy'])
                    call unite#filters#sorter_default#use(['sorter_rank'])
                    call unite#custom_source(
                                \ 'file_rec,file_rec/async,file_mru,file,buffer,grep',
                                \ 'ignore_pattern', join([
                                \ '\.git/', 'node_modules/', 'dist/', '.elc', '.pyc'],
                                \ '\|'))
                endfunction

                if count(g:dewdrops_bundle_groups, 'vimproc')
                    nnoremap <C-p> :<C-u>Unite -start-insert file_rec/async:!<cr>
                else
                    nnoremap <C-p> :<C-u>Unite -start-insert file_rec<cr>
                endif

                let g:unite_enable_start_insert             = 1
                let g:unite_data_directory                  = "~/.unite"
                let g:unite_source_history_yank_enable      = 1
                let g:unite_split_rule                      = "botright"
                let g:unite_update_time                     = 200
                let g:unite_source_file_mru_limit           = 1000
                let g:unite_source_rec_max_cache_files      = 5000
                let g:unite_cursor_line_highlight           = 'TabLineSel'
                let g:unite_source_file_mru_filename_format = ':~:.'
                let g:unite_source_file_mru_time_format     = ''

                nnoremap <silent> \r :<C-u>Unite -buffer-name=register register<CR>
                nnoremap <silent> \b :<C-u>Unite -quick-match -buffer-name=buffers buffer<CR>
                nnoremap <silent> \y :<C-u>Unite -buffer-name=yanks history/yank<CR>
                nnoremap <silent> \o :<C-u>Unite -buffer-name=outline -vertical outline<CR>
                nnoremap <silent> \a :<C-u>Unite -buffer-name=sources source<CR>
                nnoremap <silent> \f :<C-u>Unite -buffer-name=files file file/new<CR>
                nnoremap <silent> \F :<C-u>Unite -buffer-name=files_rec file_rec file/new<CR>
                nnoremap <silent> \g :<C-u>Unite -buffer-name=grep grep:.<CR>
                nnoremap <silent> \h :<C-u>Unite -auto-resize -buffer-name=help help<CR>
                nnoremap <silent> \l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>
                nnoremap <silent> \m :<C-u>Unite -buffer-name=mru buffer file_mru<CR>
                nnoremap <silent> \M :<C-u>Unite -buffer-name=mappings mapping<CR>
                nnoremap <silent> \n :<C-u>Unite -buffer-name=find find:.<CR>
                nnoremap <silent> \c :<C-u>Unite -buffer-name=commands command<CR>
                nnoremap <silent> \C :<C-u>Unite -auto-preview -buffer-name=colorschemes colorscheme<cr>
                nnoremap <silent> \; :<C-u>Unite -buffer-name=history -default-action=edit history/command command<CR>
                nnoremap <silent> \t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<cr>
                nnoremap <silent> \j :<C-u>Unite -auto-resize -buffer-name=junk junkfile junkfile/new<cr>

                " Custom Unite settings
                autocmd FileType unite call s:unite_settings()
                function! s:unite_settings()
                    nmap <buffer> Q <Plug>(unite_exit)
                    nmap <buffer> <ESC> <Plug>(unite_exit)
                    imap <buffer> <ESC> <Plug>(unite_exit)
                    imap <buffer> <C-g> <Plug>(unite_insert_leave)
                    imap <buffer> <C-c> <Plug>(unite_insert_leave)
                    imap <buffer> <C-j> <Plug>(unite_select_next_line)
                    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
                    imap <buffer> ' <Plug>(unite_quick_match_default_action)

                    let unite = unite#get_current_unite()
                    if unite.buffer_name =~# '^search'
                        inoremap <silent><buffer><expr> <c-r> unite#do_action('replace')
                    else
                        inoremap <silent><buffer><expr> <c-r> unite#do_action('rename')
                    endif
                endfunction

                NeoBundle 'Shougo/vimfiler.vim'
                let g:vimfiler_as_default_explorer = 1
            " }}}
        else
            " CtrlP {{{
                NeoBundle 'kien/ctrlp.vim'
                let g:ctrlp_custom_ignore = {
                    \ 'dir': '\.git$\|\.hg$\|\.svn$',
                    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc|\.elc$'
                    \ }
                let g:ctrlp_user_command = {
                    \ 'types': {
                        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                    \ },
                    \ 'fallback': 'find %s -type f'
                \ }

                let g:ctrlp_cmd = 'CtrlPMixed'
                let g:ctrlp_working_path_mode = 'rc'
                let g:ctrlp_clear_cache_on_exit = 1
                let g:ctrlp_max_height = 40
                let g:ctrlp_follow_symlinks = 1
                let g:ctrlp_max_files = 10000
                let g:ctrlp_mruf_max = 20
                let g:ctrlp_cache_dir = '~/.vim/.cache/ctrlp'
                let g:ctrlp_reuse_window = 'startify'
                let g:ctrlp_extensions = ['funky']

                nnoremap \ <nop>
                nnoremap \t :CtrlPBufTag<cr>
                nnoremap \T :CtrlPTag<cr>
                nnoremap \l :CtrlPLine<cr>
                nnoremap \o :CtrlPFunky<cr>
                nnoremap \b :CtrlPBuffer<cr>

                NeoBundleLazy 'tacahiroy/ctrlp-funky',
                            \ {'autoload': {'commands': ['CtrlPFunky']}}
            " }}}
        endif
    " }}}

    " Git {{{
        if count(g:dewdrops_bundle_groups, 'git')
            NeoBundle 'mhinz/vim-signify'
            NeoBundle 'jaxbot/github-issues.vim'
            NeoBundle 'junegunn/vim-github-dashboard'
            NeoBundle 'tpope/vim-git'

            NeoBundle 'mattn/webapi-vim'
            NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}

            NeoBundle 'esneider/YUNOcommit.vim'
            let g:YUNOcommit_after = 10

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

            NeoBundle 'idanarye/vim-merginal'
            nnoremap <leader>gM :Merginal<cr>

            NeoBundleLazy 'int3/vim-extradite',
                        \ {'depends': ['tpope/vim-fugitive'], 'autoload': {'commands': 'Extradite'}}
            nnoremap <leader>ge :Extradite<cr>

            NeoBundleLazy 'gregsexton/gitv',
                        \ {'depends': ['tpope/vim-fugitive'], 'autoload': {'commands': 'Gitv'}}
            nnoremap <leader>gv :Gitv<cr>

            NeoBundleLazy 'rhysd/git-messenger.vim',
                        \ {'autoload': {'commands': 'GitMessengerToggle'}}
            nnoremap <leader>gm :GitMessengerToggle<cr>
        endif
    " }}}

    " AutoComplete {{{
        if count(g:dewdrops_bundle_groups, 'neocomplete')
            " neocomplcache and neocomplete {{{

                let g:acp_enableAtStartup = 0

                if ( has('lua') && (v:version > 703 || v:version == 703 && has('patch885')) )
                            \ && count(g:dewdrops_bundle_groups, 'unite')
                    NeoBundle 'Shougo/neocomplete'

                    if count(g:dewdrops_bundle_groups, 'vimproc')
                        NeoBundle 'osyo-manga/vim-marching'
                    endif

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
                else
                    NeoBundle 'Shougo/neocomplcache'

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
                endif
            " }}}
        elseif count(g:dewdrops_bundle_groups, 'ycm')
            " YouCompleteMe {{{
                NeoBundle 'Valloric/YouCompleteMe'
                au FileType c,cpp,objc,python nnoremap <buffer> <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<cr>
                au FileType c,cpp,objc,python nnoremap <buffer> <leader>ja :YcmDiags<cr>
                let g:ycm_complete_in_comments_and_strings = 1
                let g:ycm_key_list_select_completion       = ['<tab>', '<C-n>', '<Down>']
                let g:ycm_key_list_previous_completion     = ['<s-tab>', '<C-p>', '<Up>']
                let g:ycm_global_ycm_extra_conf            = '~/.ycm_extra_conf.py'
                let g:ycm_confirm_extra_conf               = 0
                let g:ycm_enable_diagnostic_signs          = 0
                let g:ycm_semantic_triggers                = {}
                let g:ycm_semantic_triggers.html           = [' ']
                let g:ycm_semantic_triggers.xhtml          = [' ']
                let g:ycm_semantic_triggers.haskell        = ['.']
            "}}}
        else
            NeoBundle "ajh17/VimCompletesMe"
        endif

    " }}}

    " vimproc {{{
        if count(g:dewdrops_bundle_groups, 'vimproc')
            NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }

            NeoBundle 'Shougo/vimshell.vim'
            let g:vimshell_prompt = ""
            let g:vimshell_prompt_expr =
                        \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
            let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
        endif
    " }}}

    " PHP {{{
        if count(g:dewdrops_bundle_groups, 'php')
            NeoBundle 'StanAngeloff/php.vim'
            NeoBundle 'arnaud-lb/vim-php-namespace'
            NeoBundle 'shawncplus/phpcomplete.vim'

            NeoBundle 'spf13/PIV'
            let g:DisableAutoPHPFolding = 0
            "let g:PIVAutoClose = 0
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
            let g:pymode_options           = 0
        endif
    " }}}

    " Lisp {{{
        if count(g:dewdrops_bundle_groups, 'lisp')
            NeoBundle 'losingkeys/vim-niji'

            NeoBundleLazy 'guns/vim-sexp',
                        \ {'autoload': {'filetypes': ['lisp', 'scheme', 'clojure']}}
            au FileType lisp,scheme,clojure let maplocalleader = '-'
            au FileType lisp,scheme,clojure map <buffer> <leader>jb <Plug>(sexp_move_to_prev_element_head)
            au FileType lisp,scheme,clojure map <buffer> <leader>jw <Plug>(sexp_move_to_next_element_head)
            au FileType lisp,scheme,clojure map <buffer> <leader>jge <Plug>(sexp_move_to_prev_element_tail)
            au FileType lisp,scheme,clojure map <buffer> <leader>je <Plug>(sexp_move_to_next_element_tail)
            au FileType lisp,scheme,clojure nmap <buffer> <leader>jk <Plug>(sexp_swap_element_backward)
            au FileType lisp,scheme,clojure nmap <buffer> <leader>jj <Plug>(sexp_swap_element_forward)
            let g:sexp_enable_insert_mode_mappings = 0
            let g:sexp_insert_after_wrap           = 0
            let g:sexp_mappings = {
                        \ 'sexp_select_prev_element': '[j',
                        \ 'sexp_select_next_element': ']j',
                        \ 'sexp_emit_tail_element': '<c-left>',
                        \ 'sexp_capture_next_element': '<c-right>'
                        \ }
        endif
    " }}}

    " Clojure {{{
        if count(g:dewdrops_bundle_groups, 'clojure')
            NeoBundle 'guns/vim-clojure-static'
            NeoBundle 'tpope/vim-fireplace'
            NeoBundle 'guns/vim-clojure-highlight'
            NeoBundle 'tpope/vim-classpath'
            NeoBundle 'tpope/vim-leiningen'
            NeoBundle 'typedclojure/vim-typedclojure'
        endif
    " }}}

    " Haskell {{{
        if count(g:dewdrops_bundle_groups, 'haskell')
            NeoBundleLazy 'travitch/hasksyn',
                        \ {'autoload': {'filetypes': 'haskell'}}
            NeoBundleLazy 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM',
                        \ {'autoload': {'commands': ['GhciFile', 'GhciRange', 'GhciReload']}}

            if count(g:dewdrops_bundle_groups, 'vimproc')
                NeoBundleLazy 'eagletmt/ghcmod-vim',
                            \ {'autoload': {'filetypes': 'haskell'}}
                au Filetype haskell nnoremap <buffer> <leader>jt :GhcModType<cr>
                au Filetype haskell nnoremap <buffer> <leader>jj :GhcModTypeClear<cr>
                au Filetype haskell nnoremap <buffer> <leader>jc :GhcModCheck<cr>
                au Filetype haskell nnoremap <buffer> <leader>jl :GhcModLint<cr>
                au Filetype haskell nnoremap <buffer> <leader>je :GhcModExpand<cr>

                NeoBundleLazy 'eagletmt/neco-ghc',
                            \ {'autoload': {'filetypes': 'haskell'}}
                au FileType haskell setlocal omnifunc=necoghc#omnifunc
            endif
        endif
    " }}}

    " HTML {{{
        if count(g:dewdrops_bundle_groups, 'html')
            NeoBundle 'othree/html5.vim'
            NeoBundle 'othree/xml.vim'
            NeoBundle 'greyblake/vim-preview'
            NeoBundle 'hail2u/vim-css3-syntax'
            NeoBundle 'gorodinskiy/vim-coloresque'

            NeoBundle 'gcmt/breeze.vim'
            au Filetype html,xhtml,xml nnoremap <buffer> <cr> :BreezeJumpF<cr>
            au Filetype html,xhtml,xml nnoremap <buffer> <leader><cr> :BreezeJumpB<cr>
            au Filetype html,xhtml,xml nnoremap <buffer> <leader>jn :BreezeNextSibling<cr>
            au Filetype html,xhtml,xml nnoremap <buffer> <leader>jp :BreezePrevSibling<cr>
            au Filetype html,xhtml,xml nnoremap <buffer> <leader>jf :BreezeFirstSibling<cr>
            au Filetype html,xhtml,xml nnoremap <buffer> <leader>jl :BreezeLastSibling<cr>
            au Filetype html,xhtml,xml nnoremap <buffer> <leader>ju :BreezeParent<cr>

            NeoBundle 'mattn/emmet-vim'
            let g:user_emmet_leader_key = '<c-g>'            " use C-g as trigger key
            let g:user_emmet_mode       = 'i'
        endif
    " }}}

    " Misc {{{
        if count(g:dewdrops_bundle_groups, 'misc')
            " NeoBundle 'kchmck/vim-coffee-script'
            NeoBundle 'chrisbra/csv.vim'
            " NeoBundle 'tpope/vim-haml'
            " NeoBundle 'fatih/vim-go'
            NeoBundle 'petRUShka/vim-opencl'
            NeoBundle 'andreimaxim/vim-io'
            " NeoBundle 'tpope/timl'
            " NeoBundle 'JuliaLang/julia-vim'
            " NeoBundle 'Rykka/riv.vim'

            " NeoBundle 'chilicuil/vim-sml-coursera'
            NeoBundle 'rgrinberg/vim-ocaml'
            NeoBundle 'def-lkb/vimbufsync'
            NeoBundle 'the-lambda-church/merlin', {'rtp': 'vim/merlin/'}
            let g:syntastic_ocaml_checkers = ['merlin']

            " NeoBundle 'oscarh/vimerl'
            " NeoBundle 'elixir-lang/vim-elixir'

            " NeoBundle 'wting/rust.vim'
            " NeoBundle 'cespare/vim-toml'

            " NeoBundle 'vim-ruby/vim-ruby'
            " NeoBundle 'ecomba/vim-ruby-refactoring'
            " NeoBundle 'sheerun/rspec.vim'
            " NeoBundle 'tpope/vim-rails'

            " NeoBundle 'vim-perl/vim-perl'
            " NeoBundle 'c9s/perlomni.vim'

            " NeoBundle 'othree/yajs.vim'
            " NeoBundle 'marijnh/tern_for_vim'
            " NeoBundle 'othree/javascript-libraries-syntax.vim'

            " NeoBundle 'leshill/vim-json'
            " NeoBundle 'tpope/vim-jdaddy'

            " NeoBundle 'tpope/vim-cucumber'
            " NeoBundle 'quentindecock/vim-cucumber-align-pipes'

            " NeoBundle 'derekwyatt/vim-sbt'
            " NeoBundle 'derekwyatt/vim-scala'

            " NeoBundle 'xolox/vim-misc'
            " NeoBundle 'xolox/vim-lua-ftplugin'
            " NeoBundle 'xolox/vim-lua-inspect'

            NeoBundle 'dhruvasagar/vim-dotoo'

            NeoBundle 'jceb/vim-orgmode'
            au FileType org setlocal fdm=expr

            " NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
            " let g:LatexBox_Folding = 1
        endif
    " }}}

" }}}

" Finish initializations {{{

    call neobundle#end()

    filetype plugin indent on

    syntax enable

    NeoBundleCheck

    " this should be placed after neobundle#end()
    colo Tomorrow-Night-Eighties

" }}}

