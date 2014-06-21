" General behaviour_______________________________________
" Automatic reloading of .vimrc
autocmd! BufWritePost .vimrc source %
" Syntax highlighting
syntax on
" Remove old compatible mode
set nocompatible hidden
" Set encoding
set encoding=utf-8
set ruler
" Cursor enlightenment
"set cuc cul
hi CursorColumn term=underline cterm=underline guibg=#F4F4F4
hi! link CursorLine CursorColumn
" Set scrolling visibility to 3 lines
set scrolloff=3
" Fast TTY (not using minicom)
set ttyfast
" Reduce ESC's delay
set timeoutlen=250
" Change leader
let mapleader=","
" History in command line mode
set history=200
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"Add syntax highlighting for filetypes
au BufNewFile,BufRead *.wsdl,*.xsd set filetype=xml
au BufReadPost *.cnf set filetype=dosini
au BufNewFile,BufReadPost *.require set filetype=json
" Search___________________________________________________
" Case management when searching (replacing)
set ignorecase smartcase
" Highlighted and incremental search
set hlsearch incsearch
" Search regexp in 'very magic'
" PEM nnoremap / /\v
" PEM vnoremap / /\v
" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
" Reduce time for matching
set matchtime=2
" Folding__________________________________________________
set foldlevelstart=0
" Enter to toggle folds.
"nnoremap <Enter> za
"vnoremap <Enter> za
function! MyFoldText()
  let line = getline(v:foldstart)
  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart
  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')
  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()
" Backup___________________________________________________
set nowritebackup nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
" Plugins__________________________________________________
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Themes
Bundle 'tomasr/molokai'
let g:rehash256 = 1
set background=light
colo molokai
" Bundle 'altercation/vim-colors-solarized'
"set t_Co=256
"set background=light
"set background=dark
" colo solarized
" Vim AirLine (lightweight powerline)
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts=1
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
  autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
set laststatus=2
set noshowmode
" Augment plugins language capabilities
Bundle 'L9'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tlib'
" Abolish (search/replacement enhancements)________________
Bundle 'tpope/vim-abolish'
" Fish integration_________________________________________
Bundle 'dag/vim-fish'
if &shell =~# 'fish$'
  set shell=sh
endif
" See tab indendation______________________________________
Bundle 'Yggdroot/indentLine'
" Comment line selected in visual mode: best combo: <Leader>c<Space>
Bundle 'scrooloose/nerdcommenter'
" Changes the project's working directory to the project root when opening a file
Bundle 'airblade/vim-rooter'
let g:rooter_use_lcd=1
" Let Vundle manage Vundle: Use :BundleInstall to install all plugins
Bundle 'gmarik/vundle'
" Press '<leader>ce'(':ColorVEdit') in 'LightSlateGray'
Bundle 'Rykka/colorv.vim'
let g:colorv_preview_ftype='css,html,js,coffee,sass,scss,less,styl,svg'
Bundle 'lilydjwg/colorizer'
" HTTP server configuration________________________________
Bundle "evanmiller/nginx-vim-syntax"
" YAML & Jinja2____________________________________________
Bundle 'chase/vim-ansible-yaml'
au BufNewFile,BufRead minion,*.sls set filetype=yaml
" PERL_____________________________________________________
Bundle "vim-scripts/perl-support.vim"
" Ruby_____________________________________________________
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
" Vagrant
Bundle 'vim-vagrant'
" Automatic 'end' on Ruby, 'fi/endif' on bash or vi, ...
Bundle 'tpope/vim-endwise'
" JavaScript_______________________________________________
" NodeJS dictionnary
Bundle 'guileen/vim-node'
au FileType javascript set dictionary+=$HOME/.vim/bundle/vim-node/dict/node.dict
" Better indendation support for Javascript
Bundle "pangloss/vim-javascript"
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
" JQuery tag completion
Bundle 'firat/tagcomplete'
" CoffeScript (provides CoffeeMake)________________________
Bundle 'kchmck/vim-coffee-script'
let coffee_make_options = '--bare -o ~/tmp' " compile without top-level function: usefull for syntax checks
let coffee_compiler = '/usr/local/bin/coffee' " useful for changing compiler to IcedCoffee
au BufWritePost *.coffee silent make
let coffee_lint_options='-f ~/.coffeelint.json'
let coffee_linter='/usr/local/bin/coffeelint'
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
Bundle 'mintplant/vim-literate-coffeescript'
" Better JSON syntax highlighting
Bundle 'elzr/vim-json'
" Fork of a.vim for CoffeeScript: Switch from JS to Coffee (or h to c for C) with :A or :AS
Bundle 'clvv/a.vim'
" Jasmine support for Coffeescript and Javascript
Bundle 'claco/jasmine.vim'
" Cucumber support
Bundle 'tpope/vim-cucumber'
" Brunch : Fast Backbone & Coffeescript dev framewwork
Bundle 'drichard/vim-brunch'
" Grunt
Bundle 'mklabs/grunt.vim'
" CtrlP Fast fuzzy search. Use it with <C-p>_______________
Bundle 'kien/ctrlp.vim'
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = '~/tmp/cache/ctrlp'
"set wildignore+=node_modules,bower_components,tmp,build,dist,www
set wildignore+=node_modules,tmp,build,dist,www
" Add closing parenthesis, bracket, quotes_________________
Bundle 'Raimondi/delimitMate'
let delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType vim,html,svg,xml let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
let delimitMate_quotes = "\" ' ` *"" '
au FileType html,js,coffee let b:delimitMate_quotes = "\" '"
" Add closing tag support for HTML and XML
Bundle 'closetag.vim'
autocmd FileType html,htmldjango,jinjahtml,eruby,mako,svg let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,xsd,wsdl,htmldjango,jinjahtml,eruby,mako,byt,svg source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
" Change surrounding: 'test' -> <p>test</p> : cs'<p>_______
Bundle 'tpope/vim-surround'
" Show marks for fast code jumps___________________________
Bundle 'ShowMarks'
nmap <F2> :ShowMarksToggle<CR>
let g:showmarks_enable=0 " avoid automatically showing marks
" Completion with tab in search window_____________________
Bundle 'SearchComplete'
" File system explorer_____________________________________
Bundle 'scrooloose/nerdtree'
autocmd vimenter * if !argc() | NERDTree | endif " open Nerdtree if no file specified at start
nmap <F3> :NERDTreeToggle<CR>
let NERDTreeWinSize=25
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1
" MBE - MiniBufferEXplorer
"Bundle 'fholgado/minibufexpl.vim'
"map <F5> :TMiniBufExplorer<CR>
"let g:miniBufExplMaxSize=1            " Only one line for MBE
"let g:miniBufExplMapWindowNavVim=1    " Map <C-[hjkl]> to window movement
"let g:miniBufExplMapWindowNavArrows=1 " Map <C-[Left,Right]> to window movement
"let g:miniBufExplMapCTabSwitchWindows=1 " Same thing as buffers but for windows
"let g:miniBufExplUseSingleClick=1     " Use single click for opening any buffer
"let g:miniBufExplModSelTarget=1       " Accomodating MBE with TagBar and TagList
"let g:miniBufExplCloseOnSelect=1      " Close MBE on buffer selection
" Ag is available here: https://github.com/ggreer/the_silver_searcher
Bundle 'rking/ag.vim'
map <C-F> :Ag! 
" Syntax for AS files
Bundle 'endel/flashdevelop.vim'
" Align selected text in visual mode on a parttern. Example with a =: :Tab /=
Bundle 'godlygeek/tabular'
" Git plugins : syntax and commands: Gbrowse, Gstatus, Gcommit, ...
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
" Support for C/C++ block highlighting in {}
Bundle 'BlockHL'
" Syntax for MarkDown files
Bundle 'tpope/vim-markdown'
" Syntax for JADE files____________________________________
Bundle 'digitaltoad/vim-jade'
au BufNewFile,BufRead,BufReadPost *.jade.html set filetype=jade
" Syntax for Mustache______________________________________
Bundle 'mustache/vim-mustache-handlebars'
let g:mustache_abbreviations=1
" Syntax for Haml, Sass, SCSS______________________________
Bundle 'tpope/vim-haml'
" Syntax for CSS3 files____________________________________
Bundle 'hail2u/vim-css3-syntax'
" Syntax for LESS files____________________________________
Bundle 'groenewege/vim-less'
" Syntax for STYLUS files__________________________________
Bundle 'wavded/vim-stylus'
" Syntax for HTML5 files___________________________________
Bundle 'othree/html5.vim'
" Snippets_________________________________________________
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'Jasmine-snippets-for-snipMate'
Bundle 'carlosvillu/coffeScript-VIM-Snippets'
" Analyse CTags and present them in a window_______________
Bundle 'majutsushi/tagbar'
"autocmd VimEnter * nested :call tagbar#autoopen(1) " Auto open tagbar for handled files
let g:tagbar_width=25
let g:tagbar_autoshowtag=1
let g:tagbar_compact=1
map <F4> :TagbarToggle<CR>
map <F8> :let x = system('ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . >/dev/null 2>&1')<CR>
" Better tags definition: brew install ctags-exuberant
set tags=./tags,tags;/
" CoffeeScript : gem install coffeetags
"if executable('coffeetags')
  "let g:tagbar_type_coffee = {
        "\ 'ctagsbin' : 'coffeetags',
        "\ 'ctagsargs' : '--include-vars',
        "\ 'kinds' : [
        "\ 'f:functions',
        "\ 'o:object',
        "\ ],
        "\ 'sro' : ".",
        "\ 'kind2scope' : {
        "\ 'f' : 'object',
        "\ 'o' : 'object',
        "\ }
        "\ }
"endif
" Markdown support
let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
    \ 'h:Heading_L1',
    \ 'i:Heading_L2',
    \ 'k:Heading_L3'
  \ ]
\ }
" Ruby
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
" CSS
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }
" Syntax error checking____________________________________
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol='⚠'
let g:syntastic_style_warning_symbol='⚠'
" Set plugin to work depending on filetype
filetype plugin indent on " Automatic indentation
filetype plugin on " Add automatic plugins depending on filetype
" Set the default tabulation mode (use CTRL-V<Tab> for a real tab)
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" Line number______________________________________________
" Display line number with a dark backgound a lightly contrasted digits to avoid distraction
set number
"hi LineNr guibg=black guifg=darkgrey
" Mouse support in vim
set mouse=a
" Key binding______________________________________________
" Settings TAB for switching between splitted windows
map <Tab> <C-W>w
map <S-Tab> <C-W>p
" Open pane the same way as tmux, but on <C-w>
map <C-w>- :split<CR>
map <C-w><Bar> :vsplit<CR>
" OmniCompletion___________________________________________
set ofu=syntaxcomplete#Complete
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"
let g:SuperTabDefaultCompletionType='<Tab>'
let g:SuperTabDefaultCompletionType="context"
set completeopt=longest,menuone,preview
set wildmenu
set wildmode=full
"NeoComplete_______________________________________________
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
autocmd FileType css,scss,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,jade setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,coffeescript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns={}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" Neo Snippets___________________________________________
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" SyntaxComplete_________________________________________
Bundle 'vim-scripts/SyntaxComplete'
" JavaScript libraries completion
Bundle 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs='jquery,angularjs'
" Clang Complete__________________________________________
"Bundle 'Rip-Rip/clang_complete'
"let g:clang_use_library=1
" You Complete Me_________________________________________
"Bundle 'Valloric/YouCompleteMe'
" Vim marching (completion based on clang)
Bundle 'Shougo/vimproc'
Bundle 'osyo-manga/vim-reunions'
Bundle 'osyo-manga/vim-marching'
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
" Vertical splitter________________________________________
hi VertSplit guibg=black guifg=darkgrey
set fillchars=vert:\ 
"File navigation
map <C-e> <Esc>:Exp<CR>
" Copy and paste___________________________________________
" System copy and paste
noremap <leader>y "*y
noremap <leader>yy "*Y
" Preserve indentation while pasting text from system clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
" Yanking (pasting) goes on clipboard
set clipboard+=unnamed
" Wrap_____________________________________________________
" Set wrap to 80 column
set colorcolumn=80
" Highlight text when transgressing the column's limit
"augroup vimrc_autocmds
  "autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  "autocmd BufEnter * match OverLength /\%150v.*/
"augroup END
" Avoid wrapping
set nowrap
set showbreak=↪
" Save_____________________________________________________
" Save readonly files with w!!
cmap w!! w !sudo tee % >/dev/null
" LanguageTool_____________________________________________
Bundle 'vim-scripts/LanguageTool'
let g:languagetool_jar='~/.vim/tools/LanguageTool/LanguageTool.jar'
" Vimux____________________________________________________
Bundle 'benmills/vimux'
" Jedi (Python IDE)________________________________________
Bundle 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot = 0
"let g:jedi#autocompletion_command = "<Tab>"
" Vim-Pasta : Meilleur paste
Bundle 'sickill/vim-pasta'
" Quickfixsigns : Ajout de marqueur lors de bookmarks de lignes
Bundle 'tomtom/quickfixsigns_vim'
" Unimpaired
Bundle 'tpope/vim-unimpaired'
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" Neo4j and Cypher_________________________________________
Bundle "neo4j-contrib/cypher-vim-syntax"
" Lorem ipsum______________________________________________
Bundle "loremipsum"
" Internal Vim plugin
runtime macros/matchit.vim
" Quickrun: markdown_______________________________________
Bundle 'thinca/vim-quickrun'
Bundle 'mattn/webapi-vim'
Bundle 'tyru/open-browser.vim'
Bundle 'superbrothers/vim-quickrun-markdown-gfm'
let g:quickrun_config = {
\   'markdown': {
\     'type': 'markdown/gfm',
\     'outputter': 'browser'
\   }
\ }
" Dash integration
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
" PHP______________________________________________________
Bundle 'StanAngeloff/php.vim'
Bundle 'Shougo/unite.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'm2mdas/phpcomplete-extended'
Bundle 'violetyk/neocomplete-php.vim'
" VDebug (PHP, Ruby, Python, NodeJS)_______________________
Bundle 'joonty/vdebug.git'
