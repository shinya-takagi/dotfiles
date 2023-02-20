"
"	Setting file for Fortran
"

" Condition free form(Fortran 90) or fixed form(FORTRAN 77).
let s:extfname = expand("%:e")
if s:extfname ==? "f90"
  " For Fortran(90, and more) free form
    let fortran_free_source=1
    unlet! fortran_fixed_source
    set textwidth=130
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
    setlocal smarttab
else
  " For FORTRAN (fixed write style)
    let fortran_fixed_source=1
    unlet! fortran_free_source
    setlocal textwidth=72
    setlocal expandtab
    setlocal tabstop=2
    setlocal shiftwidth=6
    setlocal smarttab
    setlocal nosmartindent
    " if col('.') < 7
    "   setlocal shiftwidth=6
    " else
    "   setlocal shiftwidth=2
    " endif
    " setlocal colorcolumn=73
endif
set textwidth=130

" General Fortran config
let b:fortran_do_enddo=1    " Indent do-end block
" let fortran_more_precise=1  " Syntax analysis preciselly 

" Abbrevation of fortran syntax
augroup fortran_indent_and_abbrevation
    autocmd!
"   autocmd FileType fortran setlocal expandtab shiftwidth=4 tabstop=4
    autocmd FileType fortran setlocal iskeyword+=;
    autocmd FileType fortran iabbrev ;bd block data
    autocmd FileType fortran iabbrev ;ch character
    autocmd FileType fortran iabbrev ;cl close
    autocmd FileType fortran iabbrev ;c continue
    autocmd FileType fortran iabbrev ;cm common
    autocmd FileType fortran iabbrev ;cx complex
    autocmd FileType fortran iabbrev ;df define
    autocmd FileType fortran iabbrev ;di dimension
    autocmd FileType fortran iabbrev ;dc double complex
    autocmd FileType fortran iabbrev ;dp double precision
    autocmd FileType fortran iabbrev ;e else
    autocmd FileType fortran iabbrev ;ed enddo
    autocmd FileType fortran iabbrev ;el elseif
    autocmd FileType fortran iabbrev ;en endif
    autocmd FileType fortran iabbrev ;eq equivalence
    autocmd FileType fortran iabbrev ;ex external
    autocmd FileType fortran iabbrev ;ey entry
    autocmd FileType fortran iabbrev ;f format
    autocmd FileType fortran iabbrev ;fa .false.
    autocmd FileType fortran iabbrev ;fu function
    autocmd FileType fortran iabbrev ;g goto
    autocmd FileType fortran iabbrev ;im implicit
    autocmd FileType fortran iabbrev ;inc include
    autocmd FileType fortran iabbrev ;in integer
    autocmd FileType fortran iabbrev ;intr intrinsic
    autocmd FileType fortran iabbrev ;l logical
    autocmd FileType fortran iabbrev ;o open
    autocmd FileType fortran iabbrev ;pa parameter
    autocmd FileType fortran iabbrev ;pr program
    autocmd FileType fortran iabbrev ;ps pause
    autocmd FileType fortran iabbrev ;p print
    autocmd FileType fortran iabbrev ;re real
    autocmd FileType fortran iabbrev ;r read
    autocmd FileType fortran iabbrev ;rt return
    autocmd FileType fortran iabbrev ;rw rewind
    autocmd FileType fortran iabbrev ;s stop
    autocmd FileType fortran iabbrev ;sa save
    autocmd FileType fortran iabbrev ;st structure
    autocmd FileType fortran iabbrev ;sc static
    autocmd FileType fortran iabbrev ;su subroutine
    autocmd FileType fortran iabbrev ;tr .true.
    autocmd FileType fortran iabbrev ;ty type
    autocmd FileType fortran iabbrev ;w write
augroup end

"setlocal softtabstop=6
