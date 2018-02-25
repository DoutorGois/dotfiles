if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocp

"	Select plugin manager
	"	Pathogen
		"call pathogen#infect()
	
	"	Plug.vim
		
		call plug#begin('~/.vim/bundle')
		Plug 'Valloric/YouCompleteMe'
"		Plug 'fatih/vim-go'
		Plug 'scrooloose/nerdtree'
		Plug 'scrooloose/nerdcommenter'
"		Plug 'godlygeek/tabular'
"		Plug 'easymotion/vim-easymotion'
"		Plug 'kien/ctrlp.vim'
"		Plug 'majutsushi/tagbar'
"		Plug 'vim-airline/vim-airline-themes'
"		Plug 'tpope/vim-fugitive'
"		Plug 'SirVer/ultisnips'

		"Vimtex
		Plug 'lervag/vimtex'
		Plug 'honza/vim-snippets'
		"Plug 'w0rp/ale'
		Plug 'neomake/neomake'
"		Plug 'syntastic/syntastic'
		Plug 'SirVer/ultisnips'
		Plug 'Shougo/neosnippet.vim'
		"Plug 'ludovicchabant/vim-gutentags'

		"Plug 'vim-latex/vim-latex'
		call plug#end()

		let g:vimtex_view_method = 'zathura'
		let g:tex_flavor = 'latex'
colorscheme ron 
" General Vim settings
	syntax on
	let mapleader=","
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set dir=/tmp/
	set relativenumber 
	set number
	set path+=**
	set cursorline
	set wildmenu
	
	highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

	set hlsearch
	nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>
	nnoremap <C-c> :set norelativenumber<CR>:set nonumber<CR>:echo "Line numbers turned off."<CR>
	nnoremap <C-n> :set relativenumber<CR>:set number<CR>:echo "Line numbers turned on."<CR>

	nnoremap n nzzzv
	nnoremap N Nzzzv
	nnoremap H 0
	nnoremap L $
	nnoremap J G
	nnoremap K gg

	map <tab> %

	set backspace=indent,eol,start

	nnoremap <Space> za
	nnoremap <leader>z zMzvzz

	nnoremap vv 0v$

	set listchars=tab:\|\ 
	nnoremap <leader><tab> :set list!<cr>
	set pastetoggle=<F2>
	set mouse=a
	set incsearch

" Copying over ssh
"	vmap "+y :!xclip -f -sel clip
"	map "+p :r!xclip -o -sel clip


" Language Specific
	" General
		inoremap <leader>for <esc>Ifor (int i = 0; i < <esc>A; i++) {<enter>}<esc>O<tab>
		inoremap <leader>if <esc>Iif (<esc>A) {<enter>}<esc>O<tab>
		

	" Java
		inoremap <leader>sys <esc>ISystem.out.println(<esc>A);
		vnoremap <leader>sys yOSystem.out.println(<esc>pA);

	" Java
		inoremap <leader>con <esc>Iconsole.log(<esc>A);
		vnoremap <leader>con yOconsole.log(<esc>pA);

	" C++
		inoremap <leader>cout <esc>Istd::cout << <esc>A << std::endl;
		vnoremap <leader>cout yOstd::cout << <esc>pA << std:endl;

	" C
		inoremap <leader>out <esc>Iprintf(<esc>A);<esc>2hi
		vnoremap <leader>out yOprintf(, <esc>pA);<esc>h%a

	" Typescript
		autocmd BufNewFile,BufRead *.ts set syntax=javascript
		autocmd BufNewFile,BufRead *.tsx set syntax=javascript

	" Markup
		inoremap <leader>< <esc>I<<esc>A><esc>yypa/<esc>O<tab>


" File and Window Management 
	inoremap <leader>w <Esc>:w<CR>
	nnoremap <leader>w :w<CR>

	inoremap <leader>q <ESC>:q<CR>
	nnoremap <leader>q :q<CR>

	inoremap <leader>x <ESC>:x<CR>
	nnoremap <leader>x :x<CR>

	nnoremap <leader>e :Ex<CR>
	nnoremap <leader>t :tabnew<CR>:Ex<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>
	
	nnoremap <F7> :tabp<CR>
	nnoremap <F8> :tabn<CR>

" Quickfix Window Errors

	nnoremap <F5> :cn<CR>
	nnoremap <F6> :cnf<CR>
	nnoremap <S-F5> :cw<CR>
" Return to the same line you left off at
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	augroup END

" Future stuff
	"Swap line
	"Insert blank below and above

