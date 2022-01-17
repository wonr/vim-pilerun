# vim-pilerun

![vim-pilerun](https://user-images.githubusercontent.com/59398632/149714564-f32ca216-6c25-4614-96e2-a560e3572b37.gif)

You can compile and run your code easily.

vim-pilerun is good choice for problem solvers, competitive programmers and the people who prepare job interviews.

vim-pilerun support C, C++, Python3, Node.js for now.

## Installation

Compilers are not included. Compiler must be installed on your system.

Install via plugin manager like [Vim-Plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'wonr/vim-pilerun'
```

### Post Installation

Put the following command into your ```.vimrc```.

```vim
filetype plugin on
```

You can set ```<leader>``` key in your ```.vimrc```.

```vim
" Example
let mapleader = '\'
```

## Usage

### Keybindings

Use following commands in ```normal mode``` of Vim.

```vim
<leader>e " Open input file in a vertical split
```

```vim
<leader>w " Compile and run
```

### Configuration

<!--END-->
