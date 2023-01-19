let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<s***REMOVED***le>:p")
silent only
silent tabonly
cd /mnt/c/Users/mauro/www/freeCodeCamp/JavaScript\ Algorithms\ and\ Data\ Structures
if expand('%') == '' && !&modi***REMOVED***ed && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
***REMOVED***
  set shortmess=aoO
endif
badd +1 Intermediate\ algorithmic\ scripting/Smallest_Common_Multiple.js
badd +0 Intermediate\ algorithmic\ scripting/Sum_All_Primes.js
argglobal
%argdel
edit Intermediate\ algorithmic\ scripting/Smallest_Common_Multiple.js
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 85) / 170)
exe 'vert 2resize ' . ((&columns * 68 + 85) / 170)
exe 'vert 3resize ' . ((&columns * 69 + 85) / 170)
argglobal
enew
***REMOVED***le NERD_tree_1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,***REMOVED******REMOVED******REMOVED***
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,***REMOVED******REMOVED******REMOVED***
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("Intermediate\ algorithmic\ scripting/Sum_All_Primes.js", ":p")) | buffer Intermediate\ algorithmic\ scripting/Sum_All_Primes.js | ***REMOVED*** | edit Intermediate\ algorithmic\ scripting/Sum_All_Primes.js | endif
if &buftype ==# 'terminal'
  silent ***REMOVED***le Intermediate\ algorithmic\ scripting/Sum_All_Primes.js
endif
balt Intermediate\ algorithmic\ scripting/Smallest_Common_Multiple.js
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,***REMOVED******REMOVED******REMOVED***
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 85) / 170)
exe 'vert 2resize ' . ((&columns * 68 + 85) / 170)
exe 'vert 3resize ' . ((&columns * 69 + 85) / 170)
tabnext 1
if exists('s:wipebuf') && len(win_***REMOVED***ndbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<s***REMOVED***le>:p:r")."x.vim"
if ***REMOVED***lereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
