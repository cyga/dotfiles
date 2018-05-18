" https://habrahabr.ru/post/221267/
" vim as IDE for c++
set exrc
set secure

" https://github.com/tpope/vim-pathogen
call pathogen#infect()
filetype off
syntax on
filetype plugin indent on

" http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

syntax on
let c_space_errors=1
set sm
set ruler
set ai
set smd
"set filec=@
"set matchtime=5
"set cindent
"set cinoptions=t0(0+4:0g0
"set wildmode=longest,list
"set vb t_vb=
"set hlsearch
set incsearch
"set ts=4


" " set tt syntax highlighting
" au BufNewFile,BufRead *.tt exe "set syntax=tt2html.vim"
" au BufNewFile,BufRead *.tt2 exe "set syntax=tt2html.vim"

" toggle between paste modes
set pastetoggle=<F4>
" remember file pos
if has("autocmd")
	" filetype plugin indent on
	autocmd FileType text setlocal textwidth=78
	autocmd BufReadPost *   if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
endif

imap <F2> <Esc>:w<CR>a
nmap <F2> :w<CR>

" grep
" F3 - Run recursive grep
nnoremap <silent> <F3> :Rgrep<cr>
" Shift-F3 - Same as ":Rgrep" but adds the results to the current results
nnoremap <silent> <S-F3> :RgrepAdd<cr>
" Ctrl-F3 - Search for a pattern on all open buffers
nnoremap <silent> <C-F3> :GrepBuffer<cr>

imap <F5> <Esc>:!perl -MVi::QuickFix -cw -- %<CR>a
nmap <F5> :!perl -MVi::QuickFix -cw -- %<CR>
imap <C-F5> <Esc>:!perl -- %<CR>a
nmap <C-F5> :!perl -- %<CR>
" look at VimDebug
" imap <F7> <Esc>:!perl -d -- %<CR>a
" nmap <F7> :!perl -d -- %<CR>

" exec
imap <F9> <Esc>:!make<CR>a
nmap <F9> :!make<CR>

imap <F12> <Esc>:TlistToggle<CR>a
nmap <F12> :TlistToggle<CR>

"color morning
"color evening

" best practices tab
"An indentation level every four columns"
set tabstop=4
"Convert all tabs typed into spaces"
set expandtab
"set noexpandtab
"Indent/outdent by four columns"
set shiftwidth=4
"Always indent/outdent to the nearest tabstop"
set shiftround

" line numbers
"set number

" ConqueTerm gdb options:
" 1: strip color after 200 lines,
" 2: always with color
let g:ConqueTerm_Color = 2
" close conque when program ends running
"let g:ConqueTerm_CloseOnEnd = 1
" display warning messages if conqueTerm is configured incorrectly  
let g:ConqueTerm_StartMessages = 0

" perlomni
"filetype plugin on
"set ofu=syntaxcomplete#Complete

" fold
let perl_fold = 1
let perl_fold_blocks = 1
let perl_fold_subs = 1
let perl_nofold_packages = 1
" save/restore folds automagically
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

"
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" http://amix.dk/blog/post/19329
" Now you need to configure taglist.vim, this can be done like this:
" let Tlist_Ctags_Cmd = "/usr/bin/ctags"
" let Tlist_WinWidth = 50
" map <F4> :TlistToggle<cr>

" recipe from
" http://vim.wikia.com/wiki/Switch_between_Vim_window_splits_easily
" set wmh=0
" map <C-J> <C-w>j<C-w>_
" map <C-K> <C-w>k<C-w>_
" set wmw=0
" nmap <c-H> <c-w>h<c-w><Bar>
" nmap <c-L> <c-w>l<c-w><Bar>

" tabs
" imap ,t <Esc>:tabnew<CR>
" nmap ,t :tabnew<CR>

:nnoremap <F4> :buffers<CR>:buffer<Space>

" russian mappings
" perl -Mutf8 -E'$e="qwertyuiop[]asdfghjkl;'\''zxcvbnm,.";$r="йцукенгшщзхъфывапролджэячсмитьбю";for($i=0;$i<length$e;$i++){say "map ".substr($r,$i,1)." ".substr($e,$i,1);say "map ".uc substr($r,$i,1)." ".uc substr($e,$i,1)}' 2>/dev/null
map й q
map Й Q
map ц w
map Ц W
map у e
map У E
map к r
map К R
map е t
map Е T
map н y
map Н Y
map г u
map Г U
map ш i
map Ш I
map щ o
map Щ O
map з p
map З P
map х [
map Х [
map ъ ]
map Ъ ]
map ф a
map Ф A
map ы s
map Ы S
map в d
map В D
map а f
map А F
map п g
map П G
map р h
map Р H
map о j
map О J
map л k
map Л K
map д l
map Д L
map ж ;
map Ж :
map э '
map Э '
map я z
map Я Z
map ч x
map Ч X
map с c
map С C
map м v
map М V
map и b
map И B
map т n
map Т N
map ь m
map Ь M
map б ,
map Б ,
map ю .
map Ю .
" специальные:
map ; $
