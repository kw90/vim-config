" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on
colorscheme gotham

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

" refresh browser firefox on vim save
autocmd BufWriteCmd *.html,*.css,*.haml,*.md :call Refresh_browser()
function()! Refresh_browser()
	if &modified
		write
		silent !xdotool key --window $(xdotool search --onlyvisible --name Firefox) ctrl+r
	endif
endfunction

let g:maplocalleader=','

let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

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

