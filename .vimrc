" Modeline and Notes {{{
" vim: sw=4 ts=4 sts=4 et tw=80 foldmarker={{{,}}} foldlevel=0 foldmethod=marker
"
"   This is the personal .vimrc file of Dewdrops (v_v_4474@126.com). some code are
"   stolen from spf13-vim (https://github.com/spf13/spf13-vim).
" }}}

" Environment {{{

    " Load basic configuration
    source ~/.vimrc_tiny

    " Set up plugin manager
    call plug#begin('~/.vim/plugged')

" }}}

" Bundles {{{

    " Bundle group configuration {{{
        if !exists('g:dewdrops_bundle_groups')
            let g:dewdrops_bundle_groups = [
                        \     'general',
                        \     'programming',
                        \     'git',
                        \     'web',
                        \     'lisp',
                        \     'coc',
                        \ ]
        endif
    " }}}

    " General {{{
        if count(g:dewdrops_bundle_groups, 'general')

            " File Manager {{{
                " Plug 'scrooloose/nerdtree'
                " let NERDTreeShowBookmarks               = 1
                " let NERDTreeIgnore                      = ['\.pyc', '\.elc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
                " let NERDTreeChDirMode                   = 0
                " let NERDTreeQuitOnOpen                  = 1
                " let NERDTreeMouseMode                   = 2
                " let NERDTreeShowHidden                  = 1
                " let NERDTreeKeepTreeInNewTab            = 1
                " let g:nerdtree_tabs_open_on_gui_startup = 0
                "
                " Plug 'jistr/vim-nerdtree-tabs'
                " map <Leader>nt <plug>NERDTreeTabsToggle<cr>
                " map <Leader>nf <plug>NERDTreeTabsFind<cr>

                Plug 'Dewdrops/easytree.vim', {'on': 'EasyTreeToggle'}
                map <Leader>et :EasyTreeToggle<cr>

                " Plug 'justinmk/vim-dirvish'

                Plug 'francoiscabrol/ranger.vim', {'on': 'Ranger'}
                let g:ranger_map_keys = 0
            " }}}

            " Grep {{{
                Plug 'mhinz/vim-grepper'
                let g:grepper = {
                            \ 'tools': ['ag', 'ack', 'git', 'grep'],
                            \ 'open':  1,
                            \ 'jump':  1,
                            \ }
                nmap gs <plug>(GrepperOperator)
                xmap gs <plug>(GrepperOperator)

                " if executable('ack') || executable('ag')
                "     Plug 'dyng/ctrlsf.vim', {'on': 'CtrlSF'}
                " endif
                " nnoremap <leader>ak :CtrlSF<space>
            " }}}

            " CtrlP {{{
                Plug 'ctrlpvim/ctrlp.vim'
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
                nnoremap \f :CtrlPFunky<cr>
                nnoremap \b :CtrlPBuffer<cr>

                Plug 'tacahiroy/ctrlp-funky'
            " }}}

            " Startify {{{
                Plug 'mhinz/vim-startify'

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

            " Edit {{{
                " Plug 'tpope/vim-speeddating'
                Plug 'tpope/vim-surround'
                Plug 'terryma/vim-multiple-cursors'
                Plug 'tpope/vim-repeat'
                Plug 'ryvnf/readline.vim'
                Plug 'chrisbra/NrrwRgn'
                Plug 'junegunn/vim-peekaboo'
                " Plug 'Shougo/vinarise.vim', {'on_cmd': 'Vinarise'}
                Plug 'tpope/vim-abolish'
                Plug 'arthurxavierx/vim-caser'
                " Plug 'dhruvasagar/vim-table-mode'
                Plug 'Dewdrops/vim-unimpaired'
                Plug 'chrisbra/unicode.vim'

                Plug 'vim-scripts/ReplaceWithRegister'
                nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
                nmap <Leader>rr <Plug>ReplaceWithRegisterLine
                xmap <Leader>r  <Plug>ReplaceWithRegisterVisual

                Plug 'jiangmiao/auto-pairs'
                autocmd Filetype ocaml let b:AutoPairs = {'(':')', '[':']', '{':'}', '"':'"', '(*':'*)'}

                Plug 'machakann/vim-highlightedyank'
                let g:highlightedyank_highlight_duration = 200

                " Plug 'vim-scripts/DrawIt'
                " Plug 'vim-scripts/sketch.vim'
                " nmap <leader>sk :call ToggleSketch()<cr>

                " Plug 'dahu/vim-lotr'
                " nmap <leader>lr <plug>LOTRToggle

                " Plug 'osyo-manga/vim-over'
                " noremap <leader>ov :OverCommandLine<cr>:%s/

                Plug 'markonm/traces.vim'

                Plug 'tommcdo/vim-exchange'
                let g:exchange_no_mappings = 1
                nmap gx <Plug>(Exchange)
                vmap gx <Plug>(Exchange)
                nmap gxc <Plug>(ExchangeClear)
                nmap gxx <Plug>(ExchangeLine)

                Plug 'mbbill/undotree'
                nnoremap <Leader>ut :UndotreeToggle<cr>
            " }}}

            " Motion {{{
                Plug 'wellle/targets.vim'
                " Plug 'jeetsukumaran/vim-indentwise'
                Plug 'kana/vim-textobj-user'
                Plug 'kana/vim-textobj-indent'
                Plug 'thinca/vim-textobj-between'
                Plug 'bruno-/vim-vertical-move'
                Plug 'brooth/far.vim'

                Plug 'unblevable/quick-scope'
                augroup qs_colors
                    autocmd!
                    autocmd ColorScheme Tomorrow-Night-Eighties highlight QuickScopePrimary guifg='#0000ff' gui=underline ctermfg=blue cterm=underline
                    autocmd ColorScheme Tomorrow-Night-Eighties highlight QuickScopeSecondary guifg='#ff0000' gui=underline ctermfg=202 cterm=underline
                augroup END

                Plug 'junegunn/vim-after-object'
                autocmd VimEnter * call after_object#enable([']', '['], '=', ':', '-', '#', ' ')

                Plug 'haya14busa/incsearch.vim'
                map /  <Plug>(incsearch-forward)
                map ?  <Plug>(incsearch-backward)
                map g/ <Plug>(incsearch-stay)

                Plug 'haya14busa/incsearch-fuzzy.vim'
                map z/ <Plug>(incsearch-fuzzy-/)
                map z? <Plug>(incsearch-fuzzy-?)
                map zg/ <Plug>(incsearch-fuzzy-stay)

                Plug 'dahu/vim-fanfingtastic'
                map <unique><silent> <leader><leader> <Plug>fanfingtastic_,

                Plug 'easymotion/vim-easymotion'
                nmap <space> <Plug>(easymotion-f)
                nmap g<space> <Plug>(easymotion-F)
                let EasyMotion_leader_key  = '<leader>em'
                let g:EasyMotion_mapping_f = '<space>'
                let g:EasyMotion_mapping_F = '<space><space>'
            " }}}

            " UI {{{
                Plug 'Dewdrops/vim-tomorrow-theme'
                " Plug 'jpo/vim-railscasts-theme'
                Plug 'sickill/vim-monokai'
                " Plug 'w0ng/vim-hybrid

                Plug 'yonchu/accelerated-smooth-scroll'
                let g:ac_smooth_scroll_du_sleep_time_msec = 5
                let g:ac_smooth_scroll_fb_sleep_time_msec = 5
                let g:ac_smooth_scroll_min_limit_msec     = 30
                let g:ac_smooth_scroll_max_limit_msec     = 200

                Plug 'szw/vim-maximizer'

                Plug 'bling/vim-airline'
                " let g:airline_extensions                         = []
                let g:airline#extensions#hunks#non_zero_only     = 1
                let g:airline_exclude_preview                    = 1
                let g:airline#extensions#tabline#enabled         = 1
                let g:airline#extensions#tabline#buffer_idx_mode = 1
                nmap <leader>1 <Plug>AirlineSelectTab1
                nmap <leader>2 <Plug>AirlineSelectTab2
                nmap <leader>3 <Plug>AirlineSelectTab3
                nmap <leader>4 <Plug>AirlineSelectTab4
                nmap <leader>5 <Plug>AirlineSelectTab5
                nmap <leader>6 <Plug>AirlineSelectTab6
                nmap <leader>7 <Plug>AirlineSelectTab7
                nmap <leader>8 <Plug>AirlineSelectTab8
                nmap <leader>9 <Plug>AirlineSelectTab9

                Plug 'junegunn/goyo.vim'
                Plug 'junegunn/limelight.vim'
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
                Plug 'ConradIrwin/vim-bracketed-paste'
                Plug 'vim-scripts/LargeFile'
                " Plug 'mtth/scratch.vim'
                Plug 'justinmk/vim-gtfo'
                " Plug 'chrisbra/vim-diff-enhanced'
                Plug 'tpope/vim-eunuch'
                Plug 'exvim/ex-visincr'
                Plug 'chrisbra/Recover.vim'
                Plug 'AndrewRadev/linediff.vim'
                Plug 'tpope/vim-characterize'
                " Plug 'thinca/vim-prettyprint'
                " Plug 'Konfekt/FastFold'
                " Plug 'tpope/vim-dadbod'
                " Plug 'MattesGroeger/vim-bookmarks'
                " Plug 'mbbill/fencview'
                Plug 'mattn/calendar-vim', {'on': 'CalendarH'}
                Plug 'arecarn/crunch'
                Plug 'wellle/visual-split.vim', {'on': ['VSSplit', 'VSResize']}
                Plug 'dansomething/vim-hackernews'
                Plug 'Shougo/junkfile.vim'
                Plug 'skywind3000/asyncrun.vim'
                Plug 'vim-scripts/renamer.vim', {'on': 'Renamer'}

                Plug 'troydm/easybuffer.vim'
                nmap <leader>bs :EasyBuffer<cr>

                " Plug 'kshenoy/vim-signature'
                " nnoremap <leader>sg :SignatureToggle<cr>

                Plug 'Dewdrops/vim-interestingwords'
                let g:interestingWordsDefaultMappings = 0
                nnoremap <silent> <leader>hl :call InterestingWords() \| nohls<cr>
                nnoremap <silent> <leader>/ :call UncolorAllWords() \| nohls<cr>
                nnoremap <silent> n :call WordNavigation(1)<cr>zz
                nnoremap <silent> N :call WordNavigation(0)<cr>zz

                Plug 'vim-scripts/sessionman.vim'
                let sessionman_save_on_exit = 0
                nmap <leader>sl :SessionList<cr>
                nmap <leader>ss :SessionSave<cr>

                Plug 'tyru/open-browser.vim'
                nmap <leader>fu <Plug>(openbrowser-open)
                vmap <leader>fu <Plug>(openbrowser-open)
                nnoremap <leader>fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
            " }}}

        endif
    " }}}

    " General Programming {{{
        if count(g:dewdrops_bundle_groups, 'programming')
            Plug 'tpope/vim-endwise'
            Plug 'justinmk/vim-syntax-extra'
            Plug 'tpope/vim-dispatch'
            Plug 'bruno-/vim-man'
            " Plug 'metakirby5/codi.vim'
            " Plug 'jaxbot/semantic-highlight.vim', {'on': 'SemanticHighlight'}
            " Plug 'AndrewRadev/switch.vim', {'on': 'Switch'}
            Plug 'vim-scripts/a.vim', {'on': 'A'}
            Plug 'editorconfig/editorconfig-vim'

            Plug 'sbdchd/neoformat'
            let g:opambin = substitute(system('opam config var bin'),'\n$','','''')
            let g:neoformat_ocaml_ocamlformat = {
                        \ 'exe': g:opambin . '/ocamlformat',
                        \ 'no_append': 1,
                        \ 'stdin': 1,
                        \ 'args': ['--disable-outside-detected-project', '--name', '"%:p"', '-']
                        \ }

            Plug 'rizzatti/dash.vim'
            nmap <leader>D <Plug>DashSearch

            " Plug 'w0rp/ale'
            " let g:ale_linters = {
            "             \   'python': [],
            "             \}

            " Plug 'AndrewRadev/splitjoin.vim'
            " let g:splitjoin_split_mapping = 'cS'
            " let g:splitjoin_join_mapping  = 'cJ'

            Plug 'chrisbra/matchit'

            " Plug 'SirVer/ultisnips'
            " let g:UltiSnipsExpandTrigger       = "<c-k>"
            " let g:UltiSnipsJumpForwardTrigger  = "<c-k>"
            " let g:UltiSnipsJumpBackwardTrigger = "<c-j>"
            Plug 'honza/vim-snippets'

            Plug 'Chiel92/vim-autoformat', {'on': 'AutoFormat'}
            nnoremap <leader>gq :Autoformat<cr>

            Plug 'thinca/vim-quickrun', {'on': 'QuickRun'}
            nnoremap <leader>kr :QuickRun -outputter/buffer/into 1<cr>

            Plug 'tomtom/tcomment_vim'
            nnoremap <silent> gc :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#Operator<cr>g@
            nnoremap <silent> gcc :let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLine<cr>g@$
            xnoremap <silent> gc :TCommentMaybeInline<cr>

            Plug 'tommcdo/vim-lion', {'on':
                        \['<Plug>LionRight', '<Plug>VLionRight', '<Plug>LionLeft', '<Plug>VLionLeft']}
            let g:lion_create_maps = 0
            nmap <silent> gl <Plug>LionRight
            vmap <silent> gl <Plug>VLionRight
            nmap <silent> gL <Plug>LionLeft
            vmap <silent> gL <Plug>VLionLeft

            Plug 'junegunn/vim-easy-align'
            xmap g; <Plug>(EasyAlign)
            nmap g; <Plug>(EasyAlign)

            Plug 'puremourning/vimspector'

            if executable('ctags')
                " Plug 'ludovicchabant/vim-gutentags'

                Plug 'majutsushi/tagbar', {'on_cmd': 'TagbarToggle'}
                nnoremap <silent><leader>tb :TagbarToggle<cr>
                nnoremap <silent><f8> :TagbarToggle<cr>
                inoremap <silent><f8> <esc>:TagbarToggle<cr>a
            endif
        endif
    " }}}

    " Git {{{
        if count(g:dewdrops_bundle_groups, 'git')
            Plug 'mhinz/vim-signify'
            " Plug 'jaxbot/github-issues.vim'
            " Plug 'junegunn/vim-github-dashboard'
            Plug 'tpope/vim-git'
            " Plug 'mattn/webapi-vim'
            " Plug 'mattn/gist-vim'
            " Plug 'tpope/vim-rhubarb'

            Plug 'tpope/vim-fugitive'
            nnoremap <leader>gp :Git push https://github.com/Dewdrops/
            " add :w to trigger gitgutter
            nnoremap <leader>gr :Gwrite<cr>:w<cr>
            autocmd FileType gitcommit nmap <buffer> U :Git checkout -- <C-r><C-g><CR>
            autocmd BufReadPost fugitive://* set bufhidden=delete

            Plug 'gregsexton/gitv', {'on': 'Gitv'}
            " Plug 'junegunn/gv.vim'

            " Plug 'idanarye/vim-merginal', {'branch': 'develop'}
            " Plug 'int3/vim-extradite'

            Plug 'rhysd/git-messenger.vim', {'on': 'GitMessenger'}
            nnoremap <leader>gm :GitMessenger<cr>
        endif
    " }}}

    " AutoComplete {{{
        if count(g:dewdrops_bundle_groups, 'ycm')
            Plug 'Valloric/YouCompleteMe'
            nnoremap <leader>jd :YcmCompleter GoTo<cr>
            nnoremap <leader>jg :YcmCompleter GetDoc<cr>
            let g:ycm_key_detailed_diagnostics         = ''
            let g:ycm_complete_in_comments_and_strings = 1
            let g:ycm_key_list_select_completion       = ['<tab>', '<C-n>', '<Down>']
            let g:ycm_key_list_previous_completion     = ['<s-tab>', '<C-p>', '<Up>']
            let g:ycm_global_ycm_extra_conf            = '~/.ycm_extra_conf.py'
            let g:ycm_python_binary_path               = 'python'
            let g:ycm_confirm_extra_conf               = 0
            let g:ycm_enable_diagnostic_signs          = 0
            let g:ycm_semantic_triggers                = {}
            let g:ycm_semantic_triggers.html           = [' ']
            let g:ycm_semantic_triggers.xhtml          = [' ']
            let g:ycm_semantic_triggers.haskell        = ['.']
            let g:ycm_semantic_triggers.go             = ['.']
            let g:ycm_semantic_triggers.rs             = ['::', '.']
        elseif count(g:dewdrops_bundle_groups, 'coc')
            Plug 'neoclide/coc.nvim', {'branch': 'release'}

            inoremap <silent><expr> <TAB>
              \ coc#pum#visible() ? coc#_select_confirm() :
              \ coc#expandableOrJumpable() ?
              \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()

            function! s:check_back_space() abort
              let col = col('.') - 1
              return !col || getline('.')[col - 1]  =~# '\s'
            endfunction

            let g:coc_snippet_next = '<tab>'

            imap <C-j> <Plug>(coc-snippets-expand-jump)
            vmap <C-j> <Plug>(coc-snippets-select)

            nmap <silent> [g <Plug>(coc-diagnostic-prev)
            nmap <silent> ]g <Plug>(coc-diagnostic-next)

            nmap <silent> gd <Plug>(coc-definition)
            nmap <silent> gT <Plug>(coc-type-definition)
            nmap <silent> gI <Plug>(coc-implementation)
            nmap <silent> gR <Plug>(coc-references)

            nmap cv <Plug>(coc-rename)

            nmap <silent> <C-s> <Plug>(coc-range-select)
            xmap <silent> <C-s> <Plug>(coc-range-select)

            xmap <leader>ja  <Plug>(coc-codeaction-selected)
            nmap <leader>ja  <Plug>(coc-codeaction-selected)
            nmap <leader>jf  <Plug>(coc-fix-current)

            xmap iF <Plug>(coc-funcobj-i)
            omap iF <Plug>(coc-funcobj-i)
            xmap aF <Plug>(coc-funcobj-a)
            omap aF <Plug>(coc-funcobj-a)
            xmap iC <Plug>(coc-classobj-i)
            omap iC <Plug>(coc-classobj-i)
            xmap aC <Plug>(coc-classobj-a)
            omap aC <Plug>(coc-classobj-a)

            nnoremap <silent> K :call <SID>show_documentation()<CR>
            function! s:show_documentation()
                if (index(['vim','help'], &filetype) >= 0)
                    execute 'h '.expand('<cword>')
                else
                    call CocAction('doHover')
                endif
            endfunction

            autocmd CursorHold * silent call CocActionAsync('highlight')
            autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
            autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

            command! -nargs=0 Format :call CocAction('format')
            command! -nargs=? Fold :call CocAction('fold', <f-args>)
            command! -nargs=0 Organize :call CocAction('runCommand', 'editor.action.organizeImport')
        else
            Plug 'ackyshake/VimCompletesMe'
        endif
        Plug 'github/copilot.vim'
    " }}}

    " Lisp {{{
        if count(g:dewdrops_bundle_groups, 'lisp')
            Plug 'losingkeys/vim-niji'
            Plug 'wlangstroth/vim-racket'
            " Plug 'kovisoft/slimv'

            Plug 'guns/vim-sexp', {'for': ['lisp', 'scheme', 'clojure']}
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

    " HTML {{{
        if count(g:dewdrops_bundle_groups, 'html')
            Plug 'othree/html5.vim'
            Plug 'othree/xml.vim'
            Plug 'hail2u/vim-css3-syntax'
            Plug 'gorodinskiy/vim-coloresque'
            Plug 'greyblake/vim-preview'
            Plug 'mxw/vim-jsx'
            Plug 'tpope/vim-jdaddy'
            Plug 'evanleck/vim-svelte', {'branch': 'main'}

            Plug 'gcmt/breeze.vim'
            au Filetype html,xhtml,xml nnoremap <buffer> <cr> :BreezeJumpF<cr>
            au Filetype html,xhtml,xml nnoremap <buffer> <leader><cr> :BreezeJumpB<cr>
            au Filetype html,xhtml,xml nnoremap <buffer> <leader>jn :BreezeNextSibling<cr>
            au Filetype html,xhtml,xml nnoremap <buffer> <leader>jp :BreezePrevSibling<cr>
            au Filetype html,xhtml,xml nnoremap <buffer> <leader>jf :BreezeFirstSibling<cr>
            au Filetype html,xhtml,xml nnoremap <buffer> <leader>jl :BreezeLastSibling<cr>
            au Filetype html,xhtml,xml nnoremap <buffer> <leader>ju :BreezeParent<cr>

            Plug 'mattn/emmet-vim'
            let g:user_emmet_mode = 'i'
        endif
    " }}}

    " Misc Languages {{{
        Plug 'bfrg/vim-cpp-modern'
        Plug 'pangloss/vim-javascript'
        " Plug 'kchmck/vim-coffee-script'
        Plug 'chrisbra/csv.vim'
        Plug 'marshallward/vim-restructuredtext'
        " Plug 'fatih/vim-go'
        " Plug 'tpope/timl'
        " Plug 'JuliaLang/julia-vim'
        " Plug 'Rykka/riv.vim'
        Plug 'fatih/vim-nginx'
        Plug 'darfink/vim-plist'
        " Plug 'hiqsol/pgsql.vim'
        " Plug 'rust-lang/rust.vim'
        " Plug 'tikhomirov/vim-glsl'
        " Plug 'chilicuil/vim-sml-coursera'
        Plug 'elixir-editors/vim-elixir'
        " Plug 'cheery/idris-vim'
        " Plug 'uarun/vim-protobuf'
        " Plug 'zah/nim.vim'
        Plug 'ziglang/zig.vim'
        " Plug 'mityu/vim-applescript'
        " Plug 'vim-crystal/vim-crystal'
        " Plug 'gleam-lang/gleam.vim'
        " Plug 'tfnico/vim-gradle'
        " Plug 'jparise/vim-graphql'
        " Plug 'GutenYe/json5.vim'
        " Plug 'udalov/kotlin-vim'
        " Plug 'voldikss/vim-mma'
        " Plug 'elubow/cql-vim'
        " Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

        Plug 'ocaml/merlin', {'rtp': 'vim/merlin', 'on': ['MerlinLocate', 'MerlinTypeOf']}
        autocmd Filetype ocaml nnoremap <buffer> <leader>jd :MerlinLocate<cr>
        autocmd Filetype ocaml nnoremap <buffer> <leader>jt :MerlinTypeOf<cr>
        Plug 'let-def/ocp-indent-vim'

        Plug 'jceb/vim-orgmode'
        au FileType org setlocal fdm=expr

        " Plug 'rdolgushin/groovy.vim'

        " Plug 'OrangeT/vim-csharp'

        " Plug 'xolox/vim-misc'
        " Plug 'xolox/vim-lua-ftplugin'
        " Plug 'xolox/vim-lua-inspect'

        " Plug 'LaTeX-Box-Team/LaTeX-Box'
        " let g:LatexBox_Folding = 1
    " }}}

" }}}

" Finish initializations {{{

    filetype plugin indent on
    syntax enable

    call plug#end()

    " this should be placed after dein#install()
    colo Tomorrow-Night-Eighties
    " colo monokai

" }}}

