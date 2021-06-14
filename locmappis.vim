set expandtab
"set filetype=rmd
set iskeyword+=:
set iskeyword+=-
imap ,le (\#eq:
imap ,re \@ref(eq:<c-x><c-]>
imap ,rdf \@ref(def:<c-x><c-]>
imap ,rtm \@ref(thm:<c-x><c-]>
imap ,rlm \@ref(lem:<c-x><c-]>
nmap ,io o<esc>C * 
imap ,io <CR><esc>C * 
imap ,bg \begin{
imap ,eq \begin{equation}<CR>\end{equation}<esc>O
imap ,bbm \begin{bmatrix}<CR>\end{bmatrix}<esc>O
imap mc \mathcal 
imap pmo ^{-1}
imap pmd ^{D}
imap idr ^{(i)}
imap kk \
imap ii $
imap ,bb ```{lemma, label="xxx"}<CR>```<esc>kfl
imap == &= 

imap xil X_{i\ell}
imap xij X_{ij}
imap dxil \dot X_{i\ell}
imap dxij \dot X_{ij}
imap sjs \sum_{j=1}^s
imap ,rr \mathbb C^{

map ,m <esc>:!source mkdc.sh<CR>
imap ,jhs ```{block2, type='JHSAYS'}<CR>```<esc>O

" function! MarkdownLevel()
"     if getline(v:lnum) =~ '^# .*$'
"         return ">1"
"     endif
"     if getline(v:lnum) =~ '^## .*$'
"         return ">2"
"     endif
"     if getline(v:lnum) =~ '^### .*$'
"         return ">3"
"     endif
"     if getline(v:lnum) =~ '^#### .*$'
"         return ">4"
"     endif
"     if getline(v:lnum) =~ '^##### .*$'
"         return ">5"
"     endif
"     if getline(v:lnum) =~ '^###### .*$'
"         return ">6"
"     endif
"     return "=" 
" endfunction
" 
" setlocal foldexpr=MarkdownLevel()  
" setlocal foldmethod=expr
" 
" " This gets rid of the nasty _ italic bug in tpope's vim-markdown
" " block $$...$$
" syn region math start=/\$\$/ end=/\$\$/
" syn region math start=/\\begin{equation}/ end=/\\end{equation}/
" syn region math start=/\\begin{align}/ end=/\\end{align}/
" syn region math start=/\\begin{align\*}/ end=/\\end{align\*}/
" " inline math
" syn match math '\$[^$].\{-}\$'
" 
" " actually highlight the region we defined as "math"
" hi link math PreProc
