set nocompatible

"---------------Plugins---------------"
call plug#begin(expand('~/.vim/plugged'))

Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'tpope/vim-vinegar'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css', 'less', 'scss', 'json', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Install the following coc extensions
" - coc-phpls
" - coc-tabnine 
" - @yaegassy/coc-volar

call plug#end()





" map <leader> to comma
let mapleader=','

" turn on syntax highlighting
syntax on

" show line number
set number

" use relative number
set relativenumber

" set default split placement
set splitbelow
set splitright

" always show what mode we're currently editing in
set showmode

" highlight search result
set hlsearch

" disable annoying bell sound
set noerrorbells visualbell t_vb=

" automatically write file when switching
set autowriteall

" do not continue comment
set formatoptions-=cro

" set our desired autocomplete matching
set complete=.,w,b,u

" a tab is 4 spaces
set tabstop=4

" use spaces instead of tab
set expandtab

" use 4 spaces for tabs in insert mode
set softtabstop=4

" use 4 spaces for indentation in normal mode
set shiftwidth=4





"---------Mappings----------"
" maket it easier to edit vim config
map <leader>s :source ~/.vimrc<CR>
map <leader>ev :e ~/.vimrc<CR>

" Remove search highlight
nmap <leader><space> :nohlsearch<CR>

"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" close buffer
nmap <leader>w :bd<CR>

" switch between buffer
nmap <leader><leader> :bp<CR>

" close all buffers
nmap <leader>c :bufdo bd!<CR>

" type jj in insert mode to switch to normal mode
imap jj <Esc>





"---------Plugin-Configuration---------"
">>> NERDTree <<<

" use vinegar for file browsing
let NERDTreeHijackNetrw = 0

" toggle sidebar
nmap <C-b> :NERDTreeToggle<CR>



">>> Prettier <<<

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0



">>> FZF  <<<

" use ripgrep with fzf
let $FZF_DEFAULT_COMMAND='rg --files --hidden'

" reverse fzf layout so best match is at top
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

" use ctag with fzf
let g:fzf_tags_command = 'ctags -R'

" border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

" install bat and set BAT_THEME to respect following settings 
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" BTags advanced
function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --excmd=pattern --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({'source':  s:btags_source(),
                 \'down':    '40%',
                 \'options': '+m -d "\t" --with-nth 1,4..',
                 \'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()

" open finder
nmap <C-P> :Files<CR>

" browse tags on current buffer
nnoremap <C-r> :BTags<CR>

" find string on directory
nnoremap <C-g> :Rg<CR>

" search for tags
nnoremap <C-f> :Tags<CR>



">>> Theme  <<<

"SpaceDuck
"if exists('+termguicolors')
"   let &t_8f = ""\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = ""\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
"endif

"colorscheme spaceduck

"PaperColor
set background=dark
colorscheme PaperColor

"Nord
"colorscheme Nord

">>> COC  <<<

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

nnoremap <leader>f :Format<CR>
