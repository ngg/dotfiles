source ~/.local/share/pwndbg/gdbinit.py
set disassembly-flavor intel
set disable-randomization on
set follow-fork-mode parent
set breakpoint pending on
set print elements 0
set print thread-events off
set history save on
set history size 10000
set history remove-duplicates 100
set history filename ~/.gdb_history
