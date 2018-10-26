set expandtab
set filetype=rmd
imap ,le (\#eqx)<++><esc>Fxs
imap ,re \@ref(eq:x)<++><esc>Fxs
map ,io <CR> * 
imap ,bg \begin{

function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction

setlocal foldexpr=MarkdownLevel()  
setlocal foldmethod=expr
