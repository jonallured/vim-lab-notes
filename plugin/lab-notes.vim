function! s:LabNoteNew()
  let filename = system("~/code/lab_notes/bin/new")
  execute "edit ".filename
endfunction

nnoremap <leader>l :call s:LabNoteNew()<cr>
