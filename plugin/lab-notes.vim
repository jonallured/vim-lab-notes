function! LabNoteNew()
  let filename = system("~/code/lab_notes/bin/new")
  execute "edit ~/code/lab_notes/".filename
endfunction

nnoremap <leader>n :call LabNoteNew()<cr>
