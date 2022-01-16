" vim-pilerun
" Author: wonr

" Edit input file in a vertical split
autocmd FileType c,cpp noremap <leader>e <ESC>:vs %:r.in<CR>:wa<CR>

" Compile and run
function! CompileAndRun(compiler, target, flags, input, run)
  execute '!'.a:compiler.' '.a:target.' '.a:flags.' && '.a:input.' | '.a:run
endfunction


" FileTypes
"-------------------------------------------------------------------------------
" C
"-------------------------------------------------------------------------------
if !exists('g:c_compiler')
  let g:c_compiler = 'clang'
endif

let g:c_target = '-o %:r %'

if !exists('g:c_flags')
  let g:c_flags = '-std=c11 -g -O2 -Wall'
endif

let g:c_input = 'cat %:r.in'
let g:c_run = './%:r'

autocmd FileType c
      \ noremap <leader>w <ESC>:!clear <ESC>:w <bar>:call
      \ CompileAndRun(g:c_compiler, g:c_target, g:c_flags, g:c_input, g:c_run)<CR>
"-------------------------------------------------------------------------------
" C++
"-------------------------------------------------------------------------------
if !exists('g:cpp_compiler')
  let g:cpp_compiler = 'clang++'
endif

let g:cpp_target = '-o %:r %'

if !exists('g:cpp_flags')
  let g:cpp_flags = '-std=c++17 -g -O2 -Wall'
endif

let g:cpp_input = 'cat %:r.in'
let g:cpp_run = './%:r'

autocmd FileType cpp
      \ noremap <leader>w <ESC>:!clear <ESC>:w <bar>:call
      \ CompileAndRun(g:cpp_compiler, g:cpp_target, g:cpp_flags, g:cpp_input, g:cpp_run)<CR>
"-------------------------------------------------------------------------------
" END
"-------------------------------------------------------------------------------
