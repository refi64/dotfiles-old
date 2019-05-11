func! s:transparent_background()
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
endf

func! myspacevim#after()
  autocmd ColorScheme * call s:transparent_background()
  call s:transparent_background()
endf

