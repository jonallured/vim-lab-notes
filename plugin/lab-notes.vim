function! s:LabNoteNew()
  let filename = system("~/code/lab_notes/bin/new")
  execute "edit ".filename
endfunction

function! s:LabNoteTag(...)
  let tags = " " . join(a:000, " ")
  let line = search('^tags:', 'nw')
  if line
    let text = substitute(getline(line), '$', tags, '')
    call setline(line, text)
  else
    call append(0, ["tags:".tags, "---"])
  endif
endfunction

command! Ledit call s:LabNoteNew()

augroup lab_notes
  autocmd!
  autocmd BufRead,BufNewFile *.md command! -buffer -nargs=* Ltag call <SID>LabNoteTag( '<args>' )
augroup END

