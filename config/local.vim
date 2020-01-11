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

" Airline Configurations
"let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

" Airline Theme Configurations
let g:airline_theme='nord'


" Syntastic Configurations
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_cpp_checkers = ['GCC']
let g:syntastic_tex_checkers = ['lacheck']

" Enable GitHub flavoured MD
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_toggle=2


"" Functions
" refresh browser firefox on vim save
autocmd BufWriteCmd *.html,*.css,*.haml,*.md :call Refresh_browser()
function! Refresh_browser()
	if &modified
		write
		silent !xdotool key --window $(xdotool search --onlyvisible --name Firefox) ctrl+r
	endif
endfunction

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
