function! s:LabNoteNew(action)
  let filename = system("~/code/lab_notes/bin/new")
  execute a:action." ".filename
endfunction

function! s:LabNoteJump(position)
  let filename = system("~/code/lab_notes/bin/jump ".a:position)
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

command! Ledit call s:LabNoteNew("edit")
command! Lsplit call s:LabNoteNew("split")
command! Ltabedit call s:LabNoteNew("tabedit")
command! Lvsplit call s:LabNoteNew("vsplit")

command! -nargs=* Ljump call s:LabNoteJump( '<args>' )

augroup lab_notes
  autocmd!
  autocmd BufRead,BufNewFile *.md command! -buffer -nargs=* Ltag call <SID>LabNoteTag( '<args>' )
augroup END
