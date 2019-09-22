" activates filetype detection
"filetype plugin indent on

" activates syntax highlighting among other things
"syntax on
colorscheme nord
set t_Co=256

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
"set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

" refresh browser firefox on vim save
" TODO: Fix call of function - where to put it?
"autocmd BufWriteCmd *.html,*.css,*.haml,*.md :call Refresh_browser()
"function()! Refresh_browser()
"	if &modified
"		write
"		silent !xdotool key --window $(xdotool search --onlyvisible --name Firefox) ctrl+r
"	endif
"endfunction

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
let g:syntastic_tex_checkers = ['lacheck', 'text/language_check']

