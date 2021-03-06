# vim-pilerun

![vim-pilerun](https://user-images.githubusercontent.com/59398632/149714564-f32ca216-6c25-4614-96e2-a560e3572b37.gif)

vim-pilerun is a vim plugin that helps you can compile and run a single file source code easily.

It's a good choice for problem solvers, competitive programmers and the people who prepare for a job interview.

vim-pilerun support C, C++, Python3, Node.js for now.


## Installation

Compilers are not included. Compiler must be installed on your system.

Install via plugin manager like [Vim-Plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'wonr/vim-pilerun'
```

Install via Vim's built-in package manager

```sh
mkdir -p ~/.vim/pack/wonr/start
cd ~/.vim/pack/wonr/start
git clone https://github.com/wonr/vim-pilerun.git
```


### Post installation

Put the following option into your ```vimrc``` file.

```vim
filetype plugin on
```


## Usage


### Default key binding

Use following commands in ```normal mode``` of Vim.

* Open input file in a vertical split

```vim
<leader>e
```

* Compile and run

```vim
<leader>b
```

You can set ```<leader>``` key in your ```vimrc``` file.

```vim
" Example:
let mapleader = '\'
```


## Configuration


### 1. Key binding

If you want to change key bindings, you need to set the following options in your ```vimrc``` file.

* Open an input file in a vertical split

```vim
" Default is '<leader>e'
" Example:
let g:input_keybind = '<F4>'
```

* Compile and run

```vim
" Default is '<leader>b'
" Example:
let g:execute_keybind = '<F5>'
```


### 2. Input from a file

If you don't want to get an input from a file, you need to set one of the following options in your ```vimrc``` file.

```vim
" You can set by language.
" Default is 1
let g:c_with_input = 0  " C
let g:cpp_with_input = 0  " C++
let g:py3_with_input = 0  " Python3
let g:nodejs_with_input = 0  " Node.js
```


### 3. Terminal window clearing

If you don't want to clear the terminal window before run, you need to set the following option in your ```vimrc``` file.

```vim
" Default is 1
let g:clear_term = 0
```


### 4. Compiler

By default, C/C++ compiler is set to ```gcc```. But if you want to use ```Clang```, you need to set the following option in your ```vimrc``` file.

* C

```vim
" Default is 'gcc'
let g:c_compiler = 'clang'
```

* C++

```vim
" Default is 'g++'
let g:cpp_compiler = 'clang++'
```

* Python3

If you want to use ```PyPy```, you need to set the following option in your ```vimrc``` file.

```vim
" Default is 'python3'
let g:py3_compiler = 'pypy3'
```


### 5. Language version

By default, C is set to ```C11``` and C++ is set to ```C++20```. But if you want to use another version, you need to set the following option in your ```vimrc``` file.

* C

```vim
" Default is '-std=c11'
" You can change 'XX' part of '-std=cXX' to what you want.
" Example:
let g:c_version = '-std=c99'
```

* C++

```vim
" Default is '-std=c++20'
" You can change 'XX' part of '-std=c++XX' to what you want.
" Example:
let g:cpp_version = '-std=c++17'
```


### 6. Compile flag

You can also edit compile flags. There are so many warning, optimize, debugging flags that a compiler provides.

Language-version flag is already added to the ```g:cpp_version```(or ```g:c_version```), therefore you don't need to put the flag into this option.

* C

```vim
" Default is '-g -O2 -Wall'
" Example:
let g:c_flag = '-O2 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wcast-qual -Wcast-align'
```

* C++

```vim
" Default is '-g -O2 -Wall'
" Example:
let g:cpp_flag = '-O2 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wcast-qual -Wcast-align'
```

* Python3, Node.js

In vim-pilerun, Python3 and Node.js source code are not compiled just run.


<!--END-->
