" vim-pilerun
" Author: wonr


"-------------------------------------------------------------------------------
" Configuration
"-------------------------------------------------------------------------------
" Keybind
if !exists('g:input_keybind')
  let g:input_keybind = '<leader>e'
endif
if !exists('g:execute_keybind')
  let g:execute_keybind = '<leader>w'
endif

" With input or not
if !exists('g:c_with_input')
  let g:c_with_input = 1
endif
if !exists('g:cpp_with_input')
  let g:cpp_with_input = 1
endif
if !exists('g:py3_with_input')
  let g:py3_with_input = 1
endif
if !exists('g:nodejs_with_input')
  let g:nodejs_with_input = 1
endif


"-------------------------------------------------------------------------------
" Function
"-------------------------------------------------------------------------------
" Open input file
function! OpenInputFile(input_keybind)
  execute 'nnoremap '.a:input_keybind.' <ESC>:vs %:r.in<CR>:wa<CR>'
endfunction

" Compile and run
function! CompileAndRun(compiler, target, version, flag, input, run)
  execute '!'.a:compiler.' '.a:target.' '.a:version.' '.a:flag.' && '
        \ .a:input.' '.a:run
endfunction

" Run
function! Run(input, run)
  execute '!'.a:input.' '.a:run
endfunction


" FileType settings
"-------------------------------------------------------------------------------
" Input
"-------------------------------------------------------------------------------
" Open input file in a vertical split
autocmd FileType c,cpp,python,javascript :call OpenInputFile(g:input_keybind)


"-------------------------------------------------------------------------------
" C
"-------------------------------------------------------------------------------
if !exists('g:c_compiler')
  let g:c_compiler = 'gcc'
endif

let g:c_target = '-o %:r %'

if !exists('g:c_version')
  let g:c_version = '-std=c11'
endif

if !exists('g:c_flag')
  let g:c_flag = '-g -O2 -Wall'
endif

if g:c_with_input
  let g:c_input = 'cat %:r.in |'
else
  let g:c_input = ''
endif

let g:c_run = './%:r'

autocmd FileType c execute 'call CExecute(g:execute_keybind)'

function! CExecute(execute_keybind)
  execute 'nnoremap '.a:execute_keybind.' <ESC>:!clear <ESC>:w <bar>:call
        \ CompileAndRun(g:c_compiler, g:c_target, g:c_version, g:c_flag, g:c_input, g:c_run)<CR>'
endfunction


"-------------------------------------------------------------------------------
" C++
"-------------------------------------------------------------------------------
if !exists('g:cpp_compiler')
  let g:cpp_compiler = 'g++'
endif

let g:cpp_target = '-o %:r %'

if !exists('g:cpp_version')
  let g:cpp_version = '-std=c++20'
endif

if !exists('g:cpp_flag')
  let g:cpp_flag = '-g -O2 -Wall'
endif

if g:cpp_with_input
  let g:cpp_input = 'cat %:r.in |'
else
  let g:cpp_input = ''
endif

let g:cpp_run = './%:r'

autocmd FileType cpp execute 'call CppExecute(g:execute_keybind)'

function! CppExecute(execute_keybind)
  execute 'nnoremap '.a:execute_keybind.' <ESC>:!clear <ESC>:w <bar>:call
        \ CompileAndRun(g:cpp_compiler, g:cpp_target, g:cpp_version, g:cpp_flag, g:cpp_input, g:cpp_run)<CR>'
endfunction


"-------------------------------------------------------------------------------
" Python3
"-------------------------------------------------------------------------------
if g:py3_with_input
  let g:py3_input = 'cat %:r.in |'
else
  let g:py3_input = ''
endif

let g:py3_run = 'python3 %'

autocmd FileType python execute 'call PyExecute(g:execute_keybind)'

function! PyExecute(execute_keybind)
  execute 'nnoremap '.a:execute_keybind.' <ESC>:!clear <ESC>:w <bar>:call
        \ Run(g:py3_input, g:py3_run)<CR>'
endfunction


"-------------------------------------------------------------------------------
" Node.js
"-------------------------------------------------------------------------------
if g:nodejs_with_input
  let g:nodejs_input = 'cat %:r.in |'
else
  let g:nodejs_input = ''
endif

let g:nodejs_run = 'node %'

autocmd FileType javascript execute 'call NodejsExecute(g:execute_keybind)'

function! NodejsExecute(execute_keybind)
  execute 'nnoremap '.a:execute_keybind.' <ESC>:!clear <ESC>:w <bar>:call
        \ Run(g:nodejs_input, g:nodejs_run)<CR>'
endfunction


"-------------------------------------------------------------------------------
" END
"-------------------------------------------------------------------------------
