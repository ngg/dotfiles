import gdb
import re
import sys


def write(res):
    res = re.sub(r'([^<])(\b([a-zA-Z0-9_]+::)?~?[a-zA-Z0-9_\.@]+)( ?)\(',
                 "\\1\033[36;1m\\2\033[0m\\4(", res)
    res = re.sub(r'([a-zA-Z0-9_#$]* ?)=', "\033[32m\\1\033[0m=", res)
    res = re.sub(r'^(#[0-9]+)', "\033[32m\\1\033[0m", res, 0, re.MULTILINE)
    res = re.sub(r'^([ \*]) ([0-9]+)', "\033[36m\\1 \033[31m\\2\033[0m", res)
    res = re.sub(r'(\.*[/A-Za-z0-9\+_\.\-]*):([0-9]+)$',
                 "\033[35;1m\\1\033[0m:\033[33;1m\\2\033[0m", res, 0, re.MULTILINE)
    sys.stdout.write(res)


class Bt(gdb.Command):
    def __init__(self):
        super(Bt, self).__init__("bbt", gdb.COMMAND_SUPPORT, gdb.COMPLETE_NONE)

    def invoke(self, arg, from_tty):
        write(gdb.execute("bt "+arg, to_string=True))


class P(gdb.Command):
    def __init__(self):
        super(P, self).__init__("pp", gdb.COMMAND_SUPPORT, gdb.COMPLETE_EXPRESSION)

    def invoke(self, arg, from_tty):
        write(gdb.execute("p "+arg, to_string=True))


Bt()
P()
