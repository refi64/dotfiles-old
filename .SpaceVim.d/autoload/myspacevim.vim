func! s:transparent_background()
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
endf

func! myspacevim#before()
  let g:neomake_cpp_enabled_makers = ['clang']
  let g:neomake_cpp_clang_args = ["-std=c++17"]

  augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
  augroup END
endf

func! myspacevim#after()
  autocmd ColorScheme * call s:transparent_background()
  call s:transparent_background()
endf

let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_args = ["-std=c++17"]
