" Ensure markdown syntax doesn't get hidden
set conceallevel=0

" Line wrap on Markdown files
augroup WrapLineInMDFile
  autocmd!
  autocmd FileType markdown setlocal tw=174
  autocmd FileType markdown setlocal fo+=aw
  autocmd FileType markdown setlocal fo-=l
augroup END
