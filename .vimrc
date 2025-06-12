" # Basic Settings
set nocompatible				" vim-specific settings, non-vi-compatible
set backspace=indent,eol,start 	" Allow backspace in insert mode
set number						" Line numbers
set hidden						" Allow hidden buffers
filetype plugin indent on		" Enable file type detection and do language-dependent indenting.
set history=100					" Default = 8
nnoremap ; :
set tabstop=4					" Default tabs are too big
set wrap						" Turn on word wrapping
set linebreak					" Only wrap at sensible places
set nolist						" list disables linebreak
set textwidth=0					" prevent Vim from automatically inserting line breaks
set wrapmargin=0
set formatoptions-=t			" Don't change wrapping on existing lines
set formatoptions+=l			" Black magic
set hlsearch					" Highlight search matches

" # Install Plugins
call plug#begin('~/.vim/plugged')
	" ## Themes
	Plug 'chriskempson/base16-vim'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'altercation/vim-colors-solarized'

	" ## Markdown
	Plug 'nelstrom/vim-markdown-folding'
	Plug 'tpope/vim-markdown'

	" ## Other Tools
	Plug 'https://github.com/sirtaj/vim-openscad'	" OpenSCAD syntax hilighting
	Plug 'vim-airline/vim-airline'					" Airline bar
	Plug 'scrooloose/syntastic'						" syntax info
	Plug 'Raimondi/delimitmate'						" smart completion of delimiters

	" ## Prose-Writing Tools
	Plug 'preservim/vim-pencil'
	Plug 'junegunn/limelight.vim'
	Plug 'junegunn/goyo.vim'
	Plug 'reedes/vim-lexical' " Better spellcheck mappings
  	Plug 'reedes/vim-litecorrect' " Better autocorrections
  	Plug 'reedes/vim-textobj-sentence' " Treat sentences as text objects
  	Plug 'reedes/vim-wordy' " Weasel words and passive voice
call plug#end()

" # Plugin Settings
set laststatus=2		" Make airline status bar appear all the time
set foldenable			" Enable markdown folding
let g:airline#extensions#wordcount#enabled = 1	"Show word count
" Get rid of pointless Airline separators because I don't want to install a
" patched font to make them look right
let g:airline_left_sep=''
let g:airline_right_sep=''

" Remove existing autocommands to avoid duplicates
:autocmd!
"Force Airline to refresh after setup so settings work
:autocmd VimEnter * :AirlineRefresh


" # Color Scheme
syntax on
syntax enable			" I have no idea what this actually does

" set background=dark
" colorscheme solarized
" Base16 theme
" set background=light
" set t_Co=256			" 256 colors, terrible for most themes, but best for Tomorrow-Night
" colorscheme base16-default-light

" # Experimental Prose mode command:
   let w:ProseModeOn = 0

   function EnableProseMode()
       setlocal spell spelllang=en_us
       Goyo 66
       SoftPencil
       echo "Prose Mode On"
   endfu

   function DisableProseMode()
       Goyo!
       NoPencil
       setlocal nospell
       echo "Prose Mode Off"
   endfu

   function ToggleProseMode()
       if w:ProseModeOn == 0
           call EnableProseMode()
           let w:ProseModeOn = 1
       else
           call DisableProseMode()
       endif
   endfu

   command Prose call EnableProseMode()
   command UnProse call DisableProseMode()
   command ToggleProse call ToggleProseMode()

