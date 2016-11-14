function! LabNoteNew()
  let filename = system("~/code/lab_notes/bin/new")
  execute "edit ".filename
endfunction

nnoremap <leader>n :call LabNoteNew()<cr>
