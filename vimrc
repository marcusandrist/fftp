execute pathogen#infect()

" Basic settings
set encoding=utf-8
set fileencodings=utf-8
syntax enable
let g:coc_disable_startup_warning = 1

" Colorscheme
set background=dark
let jay_transparent=1
colorscheme jay

" mapleader
nnoremap G <Nop>
let mapleader = "G"

" WSL clipboard
vnoremap p :w !clip.exe<CR>

" Ubuntu clipboard
set clipboard=unnamedplus

" Commands
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>
noremap <leader>g :Ex<CR>
nmap <Leader>w :w<CR>:so %<CR>

" Coc
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Tabstuff
augroup FiletypeSettings
  autocmd!
  " Python: 4 spaces, use expandtab
  autocmd BufNewFile,BufRead *.py,*.c,*.sh  setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent
  " HTML, CSS, JSX: 2 spaces, use expandtab
  autocmd BufNewFile,BufRead *.html,*.sql,*.ts,*.js,*.css,*.jsx,*.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent
  " JSON, YAML: 4 spaces, use expandtab
  autocmd BufNewFile,BufRead *.json,*.yml,*.yaml setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent
  " Rust, Java: 4 spaces, use expandtab
  autocmd BufNewFile,BufRead *.rs,*.java setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent
  " JavaScript, TypeScript, TSX: 2 spaces, use expandtab
  autocmd BufNewFile,BufRead *.js,*.ts,*.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent
  " Go: 4 spaces, do NOT expand tabs
  autocmd BufNewFile,BufRead *.go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
  " Makefiles: i have no clude
  autocmd BufNewFile,BufRead Makefile setlocal noexpandtab tabstop=8 softtabstop=0 shiftwidth=8
augroup END

"servers
" Define an autocommand group to handle the installation
augroup CoCInstall
  autocmd!
  autocmd VimEnter * call CocInstallServers()
augroup END
" Function to check if a specific CoC server is installed
function! IsCocServerInstalled(server)
  let extensions_dir = expand('~/.config/coc/extensions/node_modules/')
  return isdirectory(extensions_dir . '/' . a:server)
endfunction

function! CocInstallServers()
  let servers = ['coc-tsserver', 'coc-json', 'coc-pyright', 'coc-html', 'coc-css', 'coc-sh', 'coc-docker', 'coc-java', 'coc-markdownlint', 'coc-tailwindcss']
  for server in servers
    if !IsCocServerInstalled(server)
      execute 'CocInstall ' . server
    endif
  endfor
endfunction

"QOL
set nowrap
set mouse=a
