"
"	Setting file for Fortran
"
let s:extfname = expand("%:e")
if s:extfname ==? "f90"
  " For Fortran(90, and more)
  let fortran_free_source=1
	setlocal tabstop=2
	setlocal shiftwidth=2
	setlocal expandtab
	setlocal smarttab
else
  " For FORTRAN (fixed write style)
  let fortran_fixed_source=1
	setlocal expandtab
	setlocal tabstop=2
	setlocal shiftwidth=6
	setlocal smarttab
	setlocal nosmartindent
endif


"setlocal softtabstop=6
