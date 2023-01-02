


" ======= basic set ======= 

" ==================== Auto load for first time uses ====================
"if empty(glob('~/.config/nvim' . '/autoload/plug.vim'))
"	silent execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif



let mapleader = ' '

filetype plugin on
syntax on
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


set nocompatible
set autoread
set autowrite
set autochdir
set exrc
set secure
set encoding=utf-8

" line number
set scrolloff=10
set number
set relativenumber
set wrap
let &showbreak='+++ '
"set list        
"set listchars=tab:\|\ ,trail:▫

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set inccommand=split

" indent 
set autoindent
set smartindent
set indentexpr=
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
set foldmethod=indent
set nofoldenable

"spilt
set splitright
set nosplitbelow

" system
set mouse=a
set concealcursor=nc
set hidden
set signcolumn=yes
set noshowcmd
set noshowmode
set timeout
set nottimeout
set timeoutlen=1000
set updatetime=0
set virtualedit=block
set ttyfast 
set tw=0
set viewoptions=cursor,folds,unix
set laststatus=2

"augroup QuickNotes
"  au!
"  autocmd BufWinLeave *.* execute "mkview! " . "~/.vim/view" . "/" . expand('<afile>:t') . ".view"
"  autocmd BufWinEnter *.* execute "silent! source " . "~/.vim/view" . "/" . expand('%:t') . ".view"
"augroup END 
" last-position-jump
autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
exec "nohlsearch"




map <TAB> <nop>
exec "nohlsearch"



" ======= basic keymap ======= 

"
"     ^
"e    u
" < n   i >
"     e
"     v
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l
noremap <silent> u k
noremap U 5k
noremap E 5j
nnoremap < <<
nnoremap > >>

" go to the start or end of the line
noremap  N 0
noremap  I $

" Insert Key
noremap h i
noremap H I

" Save & quit
map s :<nop>
map S :w<CR>
map Q :q<CR>

" Undo operations
nnoremap l u

" select  searching
noremap K N
noremap k n

" change key
noremap ; :
noremap ` ~

" Copy to system clipboard
vnoremap Y "+y

" vimrc open & reload 
nmap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
nmap R :source $MYVIMRC<CR>

" split screen
nmap si :set splitright<CR>:vsplit<CR>
nmap sn :set nosplitright<CR>:vsplit<CR>
nmap su :set nosplitbelow<CR>:split<CR>
nmap se :set splitbelow<CR>:split<CR>
noremap <LEADER>n <C-w>h 
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>i <C-w>l
noremap <LEADER>q <C-w>o
noremap <LEADER>w <C-w>w
noremap sh <C-w>t<C-w>K
noremap sv <C-w>t<C-w>H
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>


" switch tab
nmap tu :tabe<CR>
nmap ti :+tabnext<CR>
nmap tn :-tabnext<CR>

" insert mode
inoremap <C-a> <ESC>A
inoremap <C-o> <ESC>A {}<ESC>i<CR><ESC>ko

" command mode 
"cnoremap <C-a> <Home>
"cnoremap <C-e> <End>
"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>
"cnoremap <C-b> <Left>
"cnoremap <C-f> <Right>
"cnoremap <M-b> <S-Left>
"cnoremap <M-w> <S-Right>

" other
noremap <LEADER><CR> :nohlsearch<CR>
noremap <LEADER><LEADER> zz



" ================ plugin =============== 
call plug#begin('~/.config/nvim/plugged')

" Base Tools
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-peekaboo'
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
Plug 'Yggdroot/indentLine'
Plug 'mbbill/undotree'
Plug 'petertriho/nvim-scrollbar'
Plug 'preservim/nerdcommenter'
Plug 'yianwillis/vimcdoc', {'for': 'vim'}

" switch keyboard layout only on macos 
Plug 'ybian/smartim'

" themes
Plug 'szzii/eleline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'szzii/jellybeans.vim'
Plug 'uiiaoo/java-syntax.vim'



" tmux
Plug 'edkolev/tmuxline.vim'
Plug 'wellle/tmux-complete.vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'kdheepak/lazygit.nvim'
"Plug 'APZelos/blamer.nvim'


" code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'


" fzf search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" pair range
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'

" mulit cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'


call plug#end()

" colorsheme
"let g:jellybeans_overrides = {
"\    'background': { 'guibg': '000000' },
"\}
"let g:jellybeans_use_term_italics = 1


colorscheme jellybeans
hi link javaIdentifier NONE
hi link javaDelimiter NONE
hi link javaOperator NONE
hi link javaPreProc Function
hi link javaNumber NONE
hi link javaCharacter javaString
hi! javaConstant guifg=NONE guibg=NONE gui=bold





"highlight link javaFunction NONE

"===================
"====== coc configration ======
"===================
let g:coc_global_extensions = [
       		\"coc-explorer",
       		\"coc-highlight",
       		\"coc-java",
       		\"coc-json",
       		\"coc-xml",
       		\"coc-rust-analyzer",
       		\"coc-yaml",
       		\"coc-html",
          \"coc-pairs",
					\"coc-yank",
          \"coc-translator",
       		\"coc-clangd",
       		\"coc-pyright",
       		\"coc-sh",
          \"coc-sumneko-lua",
       		\"coc-vimlsp",
       		\"coc-ultisnips",
       		\"coc-diagnostic",
          \"coc-marketplace"]


inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" document
"nnoremap <silent> <LEADER>m :call ShowDocumentation()<CR>
"function! ShowDocumentation()
"  if CocAction('hasProvider', 'hover')
"    call CocActionAsync('doHover')
"  else
"    call feedkeys('K', 'in')
"  endif
"endfunction

nnoremap <silent> <LEADER>m :call <SID>show_documentation()<CR>
function! s:show_documentation()
 if (index(['vim','help'], &filetype) >= 0)
	 execute 'h '.expand('<cword>')
 elseif (coc#rpc#ready())
	 call CocActionAsync('doHover')
 else
	 execute '!' . &keywordprg . " " . expand('<cword>')
 endif
endfunction



nmap <LEADER>z  <Plug>(coc-codeaction)
nmap <LEADER>x  <Plug>(coc-fix-current)
nmap <LEADER>k  <Plug>(coc-rename)
nmap <silent> <LEADER>b <Plug>(coc-refactor)
nmap <silent> <LEADER>f <Plug>(coc-definition)
nmap <silent> <LEADER>d <Plug>(coc-type-definition)
nmap <silent> <LEADER>r <Plug>(coc-references)
nmap <silent> <LEADER>v <Plug>(coc-implementation)
nmap <silent> <LEADER>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>] <Plug>(coc-diagnostic-next)
nmap <silent> <LEADER>p :CocOutline<CR>


" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-e> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-e> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-e> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
 autocmd!
 " Setup formatexpr specified filetype(s).
 autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
 " Update signature help on jump placeholder.
 autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')


" coc-plugin keymaps
autocmd! FileType json syntax match Comment +\/\/.\+$+
autocmd! VimLeavePre * if get(g:, 'coc_process_pid', 0)
		\	| call system('kill -9 '.g:coc_process_pid) | endif
map <LEADER>t <Plug>(coc-translator-p)
vmap <LEADER>t <Plug>(coc-translator-pv)
nnoremap tt :CocCommand explorer<CR>
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>


" indentline
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
augroup MyIndentLine 
	au!
	autocmd User StartifyReady :IndentLinesDisable
	autocmd BufEnter * call AutoDisableIndentLines()
augroup END

function AutoDisableIndentLines() 
	if &filetype == 'json' || &filetype == 'markdown'  || &filetype == 'coc-explorer'
		:IndentLinesDisable
	else 
		:IndentLinesEnable
	endif
endfunction




"let g:VM_maps['k'] = 'i'
"let g:VM_maps['K'] = 'I'
"let g:VM_maps['o'] = 'i'
"let g:VM_maps['O'] = 'I'
" eleline
let g:eleline_powerline_fonts = 1
"let g:eleline_background = 264



" tmuxline
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W #F',
      \'x'    : '%Y-%m-%d %H:%M:%S'}


" git
"let g:gitgutter_git_executable = '/usr/bin/git'
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_set_sign_backgrounds = 1
" Thanks for @theniceboy
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
"--
let g:blamer_enabled = 1
let g:blamer_date_format = '%Y-%m-%d %H:%M'
let g:blamer_template = '<committer>: <committer-time> (<summary>)'
"--
nnoremap <silent> <LEADER>1 :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support



" commenter
let g:NERDCreateDefaultMappings = 0
let g:NERDDefaultAlign = 'left'
nnoremap  <Space>c <Plug>NERDCommenterToggle
xnoremap  <Space>c <Plug>NERDCommenterToggle




" undotree
nnoremap L :UndotreeToggle<CR>
let g:undotree_WindowLayout = 3
let g:undotree_RelativeTimestamp = 1
let g:undotree_HelpLine = 1
let g:undotree_ShortIndicators = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffCommand = "diff"
"--
function g:Undotree_CustomMap()
    nmap <buffer> u <plug>UndotreeNextState
    nmap <buffer> e <plug>UndotreePreviousState
	  nmap <buffer> U <plug>UndotreeNextSavedState
    nmap <buffer> E <plug>UndotreePreviousSavedState
    nmap <buffer> q <plug>UndotreeClose
endfunc
"--
if has("persistent_undo")
  let target_path = expand('~/.undodir')

   " create the directory and any parent directories
   " if the location does not exist.
   if !isdirectory(target_path)
       call mkdir(target_path, "p", 0700)
   endif

   let &undodir=target_path
   set undofile
endif



" fzf
noremap <leader>2 :Rg<CR>
noremap <leader>; :History:<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9} }


" startify
nnoremap <LEADER>3 :Startify<CR>
let g:startify_custom_header = [
        \ '                                 ________  __ __        ',
        \ '            __                  /\_____  \/\ \\ \       ',
        \ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
        \ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
        \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
        \ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
        \ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
        \ ]



" ==================== nvim-scrollbar ====================
lua <<EOF
require("scrollbar").setup({
		 set_highlights = false
   })
EOF



" wildfire
let g:wildfire_objects = { "*" : ["i'", 'i"', "i)", "i]", "i}","i>"] }

" multi
let g:VM_leader = ','
let g:VM_maps = {}

let g:VM_maps['i'] = 'k'
let g:VM_maps['I'] = 'K'

let g:VM_maps['Find Under']							= '<C-k>'
let g:VM_maps['Find Subword Under']			= '<C-k>'
let g:VM_maps['Select All']  						= '<C-f>'
let g:VM_maps['Visual All']  						= '<C-f>'
let g:VM_maps['Skip Region']						= '<c-n>'
let g:VM_maps['Remove Region']					= 'q'


" auto switch keylayout
let g:smartim_default = 'com.apple.keylayout.Colemak'
function! Multiple_cursors_before()
	let g:smartim_disable = 1
endfunction
function! Multiple_cursors_after()
	unlet g:smartim_disable
endfunction

" vim-go
let g:go_gopls_enabled = 0
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_fmt_command = 'goimports'
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_fields = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_operators = 1
"let g:go_alternate_mode = "vsplit"


autocmd FileType go nmap <LEADER><LEADER> :GoAlternate!<CR>
autocmd Filetype go command! -bang T call go#coverage#BufferToggle(<bang>0)





" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'python'
  	set splitbelow
  	:sp
  	:term python3 %
	elseif &filetype == 'go'
		call s:runGoFiles()
	elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  endif
endfunc

function! s:runGoFiles()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    :GoTestFunc
  elseif l:file =~# '^\f\+\.go$'
		:GoRun
  endif
endfunction


let g:UltiSnipsExpandTrigger             = "<nop>"
let g:UltiSnipsListSnippets              = "<nop>"
let g:UltiSnipsJumpForwardTrigger        = "<nop>"
let g:UltiSnipsJumpBackwardTrigger       = "<nop>"

let g:UltiSnipsSnippetDirectories=["UltiSnips", "MySnippets"]

