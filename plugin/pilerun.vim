" File: plugin/pilerun.vim
" Description: A single file source code runner for Vim.
" Author: wonr
" License: MIT

"-------------------------------------------------------------------------------
" Configuration
"-------------------------------------------------------------------------------
" Keybind
if !exists('g:input_keybind')
  let g:input_keybind = '<leader>e'
endif
if !exists('g:execute_keybind')
  let g:execute_keybind = '<leader>b'
endif

" Clear terminal or not
if !exists('g:clear_term')
  let g:clear_term = 1
endif
if g:clear_term
  let s:clear = '<ESC>:!clear'
else
  let s:clear = ''
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
function! Run(input, compiler, target)
  execute '!'.a:input.' '.a:compiler.' '.a:target
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

let b:c_target = '-o %:r %'

if !exists('g:c_version')
  let g:c_version = '-std=c11'
endif

if !exists('g:c_flag')
  let g:c_flag = '-g -O2 -Wall'
endif

if g:c_with_input
  let b:c_input = 'cat %:r.in |'
else
  let b:c_input = ''
endif

let b:c_run = './%:r'

autocmd FileType c execute 'call CExecute(g:execute_keybind, s:clear)'

function! CExecute(execute_keybind, clear)
  execute 'nnoremap '.a:execute_keybind.' '.a:clear.' <ESC>:w <bar>:call
        \ CompileAndRun(g:c_compiler, b:c_target, g:c_version, g:c_flag, b:c_input, b:c_run)<CR>'
endfunction


"-------------------------------------------------------------------------------
" C++
"-------------------------------------------------------------------------------
if !exists('g:cpp_compiler')
  let g:cpp_compiler = 'g++'
endif

let b:cpp_target = '-o %:r %'

if !exists('g:cpp_version')
  let g:cpp_version = '-std=c++20'
endif

if !exists('g:cpp_flag')
  let g:cpp_flag = '-g -O2 -Wall'
endif

if g:cpp_with_input
  let b:cpp_input = 'cat %:r.in |'
else
  let b:cpp_input = ''
endif

let b:cpp_run = './%:r'

autocmd FileType cpp execute 'call CppExecute(g:execute_keybind, s:clear)'

function! CppExecute(execute_keybind, clear)
  execute 'nnoremap '.a:execute_keybind.' '.a:clear.' <ESC>:w <bar>:call
        \ CompileAndRun(g:cpp_compiler, b:cpp_target, g:cpp_version, g:cpp_flag, b:cpp_input, b:cpp_run)<CR>'
endfunction


"-------------------------------------------------------------------------------
" Python3
"-------------------------------------------------------------------------------
if g:py3_with_input
  let b:py3_input = 'cat %:r.in |'
else
  let b:py3_input = ''
endif

if !exists('g:py3_compiler')
  let g:py3_compiler = 'python3'
endif

let b:py3_target = '%'

autocmd FileType python execute 'call PyExecute(g:execute_keybind, s:clear)'

function! PyExecute(execute_keybind, clear)
  execute 'nnoremap '.a:execute_keybind.' '.a:clear.' <ESC>:w <bar>:call
        \ Run(b:py3_input, g:py3_compiler, b:py3_target)<CR>'
endfunction


"-------------------------------------------------------------------------------
" Node.js
"-------------------------------------------------------------------------------
if g:nodejs_with_input
  let b:nodejs_input = 'cat %:r.in |'
else
  let b:nodejs_input = ''
endif

let b:nodejs_compiler = 'node'

let b:nodejs_target = '%'

autocmd FileType javascript execute 'call NodejsExecute(g:execute_keybind, s:clear)'

function! NodejsExecute(execute_keybind, clear)
  execute 'nnoremap '.a:execute_keybind.' '.a:clear.' <ESC>:w <bar>:call
        \ Run(b:nodejs_input, b:nodejs_compiler, b:nodejs_target)<CR>'
endfunction


"-------------------------------------------------------------------------------
" END
"-------------------------------------------------------------------------------
