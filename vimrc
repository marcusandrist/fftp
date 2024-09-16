execute pathogen#infect()

" Colorscheme
set background=dark
let jay_transparent=1
colorscheme jay

" Tabstuff
augroup FiletypeSettings
  autocmd!
  " Python: 4 spaces, use expandtab
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent
  " HTML, JSON, YAML, CSS, JSX: 2 spaces, use expandtab
  autocmd BufNewFile,BufRead *.html,*.json,*.yml,*.yaml,*.sql,*.ts,*.js,*.css,*.jsx,*.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent
  " Rust, Java: 4 spaces, use expandtab
  autocmd BufNewFile,BufRead *.rs,*.java setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent
  " JavaScript, TypeScript, TSX: 2 spaces, use expandtab
  autocmd BufNewFile,BufRead *.js,*.ts,*.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent
  " Go: 4 spaces, do NOT expand tabs
  autocmd BufNewFile,BufRead *.go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
  " Makefiles: i have no clude
  autocmd BufNewFile,BufRead Makefile setlocal noexpandtab tabstop=8 softtabstop=0 shiftwidth=8
augroup END
