def match(command, settings):
    return command.script == 'git push' and '(fetch first)' in command.stderr

def get_new_command(command, settings):
    return "sh -c 'git pull && " + command.script + "'"
