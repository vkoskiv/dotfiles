python import gdb.printing
set debuginfod enabled on
set breakpoint pending on
set disassembly-flavor intel
set tui tab-width 4
define hook-next
	refresh
end
set history save on
set history size unlimited
set history remove-duplicates unlimited
set history filename ~/.gdb_history
set pagination off
set debug jit on
set print pretty on
tui new-layout all regs 4 src 25 asm 25 cmd 10
