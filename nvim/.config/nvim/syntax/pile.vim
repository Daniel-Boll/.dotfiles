" Vim syntax file
" Language: Pile

" Usage Instructions
" Put this file in .vim/syntax/pile.vim
" and add in your .vimrc file the next line:
" autocmd BufRead,BufNewFile *.pile set filetype=pile

if exists("b:current_syntax")
  finish
endif

set iskeyword=a-z,A-Z,-,*,_,!,@
syntax keyword pileTodos TODO XXX FIXME NOTE

" Language keywords
syntax keyword pileKeywords mem macro end drop do 
syntax keyword pileStackKeywords dup dup2 swap over if else include while 

" Comments
syntax region pileCommentLine start="\\" end="$"   contains=pileTodos

" String literals
syntax region pileString start=/\v"/ skip=/\v\\./ end=/\v"/ contains=pileEscapes

" Char literals
syntax region pileChar start=/\v'/ skip=/\v\\./ end=/\v'/ contains=pileEscapes

" Escape literals \n, \r, ....
syntax match pileEscapes display contained "\\[nr\"']"

" Number literals
syntax region pileNumber start=/\s\d/ skip=/\d/ end=/\s/

" Type names the compiler recognizes
syntax keyword pileTypeNames addr int ptr bool

" Set highlights
highlight default link pileTodos Todo
highlight default link pileKeywords Character
highlight default link pileStackKeywords Type
highlight default link pileCommentLine Comment
highlight default link pileString String
highlight default link pileNumber Number
highlight default link pileTypeNames Type
highlight default link pileChar Character
highlight default link pileEscapes SpecialChar

let b:current_syntax = "pile"
