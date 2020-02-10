#source ~/.local/share/pwndbg/gdbinit.py
#source ~/.local/share/gef/gef.py
source ~/.local/share/gdb-waitfor.py
#source ~/.local/share/gdb-colors.py
#source ~/git/CoreTools/gdb_pretty_print.py
set disassembly-flavor intel
set disable-randomization on
set follow-fork-mode parent
set breakpoint pending on
set pagination off
set print object on
set print vtbl on
set print elements 0
set print thread-events off
set python print-stack full
set history save on
set history size 10000
set history remove-duplicates 100
set history filename ~/.gdb_history
