"""""""""""""""""""""""""""""VUNDLER SETTINGS""""""""""""""""""""""""""""
filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" required
Bundle 'gmarik/vundle'

" personal plugins
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'fatih/vim-go'
Bundle 'kien/ctrlp.vim'
Bundle 'cespare/vim-toml'
Bundle 'derekwyatt/vim-scala'
Bundle 'sirtaj/vim-openscad'
Bundle 'klen/python-mode'
Bundle 'othree/xml.vim'

filetype plugin indent on " required!

""""""""""""""""""""""""""""""BASIC SETTINGS"""""""""""""""""""""""""""""

" Fix backspace on some remote hosts.
    set t_kb=

" Printing hardcopies
    set background=dark " If you use a dark background
    set printoptions=number:y

" Line numbers
    set relativenumber
    set numberwidth=3

" Ruler
    set ruler           " show the ruler
    " Ruler format was mixed and matched from http://proasix.com/hlp/contract/adi/hlp/vim.hlp
    "set rulerformat=%-50(%n:%f%r%m%w%y%)%=%5(%p%%%)%=%6(\(%l,%)%=%-4(%c\)%)%=%4(0x%B%)%=%8(%)
    set showcmd         " show partial commands in status line and
    set showmode        " show 'Insert', 'Replace', 'Visual' when in those modes


" Tabs and formatting
    set shiftwidth=4    " indent width (shiftwidth == tabstop always, imho)
    set tabstop=4       " tabs go to next column c s.t. c % 4 == 0
    set expandtab       " tabs input are expanded to spaces
    "set noexpandtab
    set smarttab        " delete initial indentations easily on new lines

" Searching
    set hlsearch        " Highlight search matches
    set smartcase       " case insensitive is one directional?

" Navigating
    set scrolloff=2     " minimum lines to keep above and below cursor

" Document width and long lines
    "set textwidth=73    " width @ which to break long sentences onto new lines
    set wrap            " long lines won't run off the screen

" General filetype and syntax options
    syntax on
    filetype indent on  " autoindent based on filetype 
    filetype plugin on  " allow filetype plugins

"""""""""""""""""""""""""""""ADVANCED SETTINGS"""""""""""""""""""""""""""

" Determine the operating system being used.
    let platform = substitute(system('uname'), "\n", "", "")
    if platform == "Darwin"
        let platform = "MacOSX"
    elseif platform == "SunOS"
        let platform = "Solaris"
    endif " 'Linux' and 'FreeBSD' need not be changed.

" vim-latex customization
    "let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
    let g:Tex_DefaultTargetFormat = 'pdf'
    let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
    let g:Tex_FormatDependency_ps = 'dvi,ps'
    " let g:Tex_MultipleCompileFormats = 'dvi ps pdf'
    let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -output-format=dvi "$*"'
    let g:Tex_CompileRule_ps = 'dvips $*.dvi'
    let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
    let g:Tex_IgnoredWarnings =
                \'Underfull'."\n".
                \'Overfull'."\n".
                \'specifier changed to'."\n".
                \'You have requested'."\n".
                \'Missing number, treated as zero.'."\n".
                \'There were undefined references'."\n".
                \"LaTeX Warning: Reference `%s' on page %n undefined"."\n".
                \'Citation %.%# undefined'
    let g:Tex_IgnoreLevel = 8

    if platform == "Linux"
        let g:Tex_ViewRule_pdf = "xpdf 2>/dev/null"
    endif

" syntastic
    let g:syntastic_mode_map = {
                \ 'mode': 'active',
                \ 'active_filetypes': [],
                \ 'passive_filetypes': ['scala'],
                \ }
    let g:syntastic_go_checkers = ['govet', 'gofmt']

" ctrlp
    "let g:ctrlp_map = '<c-p>'
    let g:ctrlp_use_caching = 1
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_cmd = 'CtrlPMixed'
    "let g:ctrlp_working_path_mode = 'ra'
    "let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
    "let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    "set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
    "
    "let g:ctrlp_root_markers = ['.cabal', 'Gemfile', '.git']
    "
    " ignore (among others) the ./target directory in scala/java projects
    let g:ctrlp_custom_ignore = {
       \ 'dir':  '\v[\/]\.(git|hg|svn)|target$',
       \ 'file': '\v\.(a|o|exe|so|dll)$',
       \ }
    "if platform == \"MinGW\"
    "    let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
    "else
    "   let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
    "end
    "let g:ctrlp_prompt_mappings = {
    "   \ 'PrtBS()':              ['<bs>', '<c-]>'],
    "   \ 'PrtDelete()':          ['<del>'],
    "   \ 'PrtDeleteWord()':      ['<c-w>'],
    "   \ 'PrtClear()':           ['<c-u>'],
    "   \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    "   \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
    "   \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    "   \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    "   \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
    "   \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
    "   \ 'PrtHistory(-1)':       ['<c-n>'],
    "   \ 'PrtHistory(1)':        ['<c-p>'],
    "   \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    "   \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
    "   \ 'AcceptSelection("t")': ['<c-t>'],
    "   \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
    "   \ 'ToggleFocus()':        ['<c-j><k>'],
    "   \ 'ToggleRegex()':        ['<c-r>'],
    "   \ 'ToggleByFname()':      ['<c-d>'],
    "   \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
    "   \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
    "   \ 'PrtExpandDir()':       ['<tab>'],
    "   \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    "   \ 'PrtInsert()':          ['<c-\>'],
    "   \ 'PrtCurStart()':        ['<c-a>'],
    "   \ 'PrtCurEnd()':          ['<c-e>'],
    "   \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    "   \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    "   \ 'PrtClearCache()':      ['<F5>'],
    "   \ 'PrtDeleteEnt()':       ['<F7>'],
    "   \ 'CreateNewFile()':      ['<c-y>'],
    "   \ 'MarkToOpen()':         ['<c-o>'],
    "   \ 'OpenMulti()':          ['<c-u>'],
    "   \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
    "   \ }

"
" vim-go
"

let g:go_fmt_command = "goimports"

"
" python-mode
"

let g:pymode_options_max_line_length = 100
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}

" McCabe complexity set very high to avoid really annoying stuff happening in
" most previously-unchecked files.
let g:pymode_lint_options_mccabe = {'complexity': 30}

let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion_bind = '<leader>pyc'

let g:pymode_run_bind = '<leader>pyrun'
let g:pymode_breakpoint_bind = '<leader>pybreak'

let g:pymode_rope_show_doc_bind = '<leader>pyd'
let g:pymode_rope_goto_definition_bind = '<leader>pyg'
let g:pymode_rope_rename_bind = '<leader>pyrn'
let g:pymode_rope_rename_module_bind = '<leader>pyrm'
let g:pymode_rope_organize_imports_bind = '<leader>pyi'
let g:pymode_rope_autoimport_bind = '<leader>pyai'
let g:pymode_rope_module_to_package_bind = '<leader>pym2p'
let g:pymode_rope_extract_method_bind = '<leader>pyxm'
let g:pymode_rope_extract_variable_bind = '<leader>pyfuse'
let g:pymode_rope_change_signature_bind = '<leader>pysig'

" cache generation is needed for autoimport.  it's not clear when its actually
" necessary to regenerate the global cache.
let g:pymode_rope_regenerate_on_write = 0

"
" Mapping Keys.
    " Set the leader key to one convinient on dvorak.
    let mapleader = ","

    " disable search highlights
    map <leader>h :noh<return>

    " write/quit controls
    map <leader>cg :w<return>
    map <leader>cC :wq<return>
    map <leader>cr :q<return>
    map <leader>cq :q<return>
    map <leader>cR :q!<return>
    map <leader>cQ :q<return>

    " go language leader bindings
    map <leader>gob :GoBuild<return>

    " split navigation/control
    map <leader>c <C-w>

    " quick macros
    map <leader>n qq
    map <leader>s q
    map <leader><return> @q

    " command/search buffer
    map <leader>. q:i!<esc>
    map <leader>> q:i!
    map <leader>/ q/
    map <leader>? q/

    " buffer mappings
    map <leader>bb :buffers<CR>:buffer<Space>
    map <leader>bn :bnext<return>
    map <leader>bp :bprevious<return>
    map <leader>bs :buffer #<return>
    map <leader>e :edit<Space>

    " fugitive mappings
    map <leader>gc :Gcommit<return>
    map <leader>gr :Gread<return>
    map <leader>gw :Gwrite<return>
    map <leader>gd :Gdiff<return>
    map <leader>gs :Gstatus<return>
    map <leader>gb :Gblame<return>

    " diff mappings
    map <leader>gp :diffput<return>
    map <leader>gg :diffget<return>

    " NERDTree toggle mapping
    map <leader>d :NERDTreeToggle<return>

    " Copy paste map
    if platform == "MacOSX"
        map <leader>p A<return><esc>V!pbpaste<return>
        map <leader>P a<return><return><esc>d0kV!pbpaste<return>
        map <leader>y V!pbcopy<return>u
        map <leader>x V!pbcopy<return>
    elseif platform == "Linux" " This does not work as well as in Mac OS X.
        map <leader>p A<return><esc>V!xclip -o<return>
        map <leader>P a<return><return><esc>d0kV!xclip -o<return>
        map <leader>y V!xclip -i<return>u
        map <leader>x V!xclip -i<return>
    endif " TODO: Add other operating systems if possbile.

    "format mapping (<leader>f)
    if has("autocmd")
        au BufNewFile,BufRead *.json map <leader>f :1,$!ruby -e 'require "json"; puts JSON.pretty_generate(JSON.parse($stdin.read))'<return>
    end

function AutoPEP8()
    let l:curw=winsaveview()
    try | silent undojoin | catch | endtry
    execute ":%!autopep8 --max-line-length=100 -"
    call winrestview(l:curw)
endfunction


if has("autocmd")
    " File types where tabs are important
    au BufNewFile,BufRead  Makefile,makefile set noexpandtab
    au BufNewFile,BufRead  *.rdb set noexpandtab

    " Filetypes where you do not want to cut long lines.
    au BufNewFile,BufRead *.tex,*.bib set textwidth=0
    au BufNewFile,BufRead  *.bb set textwidth=0

    " Some stuff that should be fine if left alone.
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
    au BufNewFile,BufRead  *.pls            set syntax=dosini
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf

    " Try and deal with broken-ness in buffers for new files.
    au BufNewFile,BufRead *.perl,*.pl,*.pm  set syntax=perl
    au BufNewFile,BufRead *.py              set syntax=python
    au BufNewFile,BufRead *.rb              set syntax=ruby

    " files with special tab preferences
    au BufNewFile,BufRead *.rb,*.erb,*.rhtml set tabstop=2
    au BufNewFile,BufRead *.rb,*.erb,*.rhtml set shiftwidth=2
    au BufNewFile,BufRead *.go set noexpandtab
    au BufNewFile,BufRead *.scala,*.sbt set tabstop=2
    au BufNewFile,BufRead *.scala,*.sbt set shiftwidth=2

    " au FileType python au BufWritePre <buffer> silent execute "normal! mZHmY:%!autopep8 --max-line-length=100 -\<return>`Yzt`Z"
    " au FileType python au BufWritePre <buffer> call AutoPEP8()
    au FileType python map <leader>f :call AutoPEP8()<return>
endif
