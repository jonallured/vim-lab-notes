function! s:LabNoteNew()
  let filename = system("~/code/lab_notes/bin/new")
  execute "edit ".filename
endfunction

command! Lnew call s:LabNoteNew()

nnoremap <leader>l :call s:LabNoteNew()<cr>
