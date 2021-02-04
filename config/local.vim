" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on
colorscheme nord
set t_Co=256

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

let g:maplocalleader=','

let g:python3_host_prog  = '/usr/bin/python3'

" Airline Configurations
let g:airline#extensions#tabline#enabled = 1
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

" Airline Theme Configurations
let g:airline_theme='nord'

" Custom shortcuts
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>


" Syntastic Configurations
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_cpp_checkers = ['GCC']
let g:syntastic_tex_checkers = ['lacheck']

noremap <C-w>e :SyntasticCheck<CR>
noremap <C-w>f :SyntasticToggleMode<CR>

" Set tex flavor
let g:tex_flavor = 'latex'

" Enable GitHub flavoured MD
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_toggle=2

" Add black code formatter for Python
let g:black_linelength = 79
autocmd BufWritePre *.py execute ':Black'

" Run tests for Python in Docker
function! DockerTransform(cmd) abort
  return ' docker-compose -f docker-compose.test.yml run --rm tests ' . a:cmd
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#transformation = 'docker'
let test#python#pytest#executable = 'python -m pytest'
let g:test#preserve_screen = 1
let test#strategy = "neovim"

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" VimWiki setup
let wiki_1 = {}
let wiki_1.auto_export = 1
let wiki_1.path = '~/vimwiki/md-wikis'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let wiki_1.path_html = '~/vimwiki/public'
let wiki_1.custom_wiki2html = 'vimwiki_markdown'
let wiki_1.template_default = 'custom'
let wiki_1.template_path = '~/vimwiki/templates'
let wiki_1.template_ext = '.html'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_global_ext = 0
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script'
let g:vimwiki_listsyms = '❌🔹🔷🟦✅'
let g:tagbar_type_vimwiki = {
          \   'ctagstype':'markdown'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'~/vimwiki/vwtags.py'
          \ , 'ctagsargs': 'default'
          \ }
"" Map VimWiki shortcuts
nmap <silent> w<C-h> :VimwikiAll2HTML<CR>


"" Functions
" refresh browser firefox on vim save
" autocmd BufWriteCmd *.html,*.css,*.haml,*.md :call Refresh_browser()
" function! Refresh_browser()
" 	if &modified
" 		write
" 		silent !xdotool key --window $(xdotool search --onlyvisible --name Firefox) ctrl+r
" 	endif
" endfunction

let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    endif

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction
