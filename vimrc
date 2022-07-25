" Custom configuration
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" Shift+tab for command mode
nnoremap <S-Tab> <<
" Shift+tab for insert mode
inoremap <S-Tab> <C-d>
" Enable numbers
set number relativenumber
" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>
" Workaround to allow Ctrl-Backspace and Ctrl-Del
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
" Remap Ctrl+Space as Ctrl+N
inoremap <C-@> <C-n>

