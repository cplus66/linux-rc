set ts=4

"set nu
"set ruler
"set sw=4
set incsearch
set autochdir
set hlsearch
set tags=tags;
set noai
set ci

nnoremap <silent> <F12> :TlistToggle<CR>
"nnoremap <silent> \t :TlistToggle<CR>
nnoremap <silent> \q :copen<CR>
nnoremap <silent> \c :cclose<CR>
nnoremap <silent> \s :cn<CR>
nnoremap <silent> \w :cp<CR>
nnoremap <silent> \g :grep -r <cword> *<CR>:copen<CR>
nnoremap <silent> \p :SrcExplToggle<CR>

"let Tlist_Auto_Open=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_File_Fold_Auto_Close=1
