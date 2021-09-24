let s:extfname = expand("%:e")
if s:extfname ==? "f90"
	setlocal tabstop=2
	setlocal shiftwidth=2
	setlocal expandtab
	setlocal smarttab
else
	setlocal expandtab
	setlocal tabstop=2
	setlocal shiftwidth=6
	setlocal smarttab
	setlocal nosmartindent
endif


"setlocal softtabstop=6
