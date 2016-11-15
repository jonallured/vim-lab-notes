function! s:LabNoteNew(command)
  let filename = system("~/code/lab_notes/bin/new")
  execute a:command." ".filename
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

command! Ledit call s:LabNoteNew("edit")
command! Lsplit call s:LabNoteNew("split")
command! Ltabedit call s:LabNoteNew("tabedit")
command! Lvsplit call s:LabNoteNew("vsplit")

augroup lab_notes
  autocmd!
  autocmd BufRead,BufNewFile *.md command! -buffer -nargs=* Ltag call <SID>LabNoteTag( '<args>' )
augroup END
