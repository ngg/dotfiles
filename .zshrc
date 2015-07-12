#zkbd
autoload zkbd
[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
[[ ! -f ~/.zkbd/$TERM-$VENDOR-$OSTYPE ]] && zkbd
source  ~/.zkbd/$TERM-$VENDOR-$OSTYPE
bindkey -v
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" history-beginning-search-forward
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char

#mime
autoload -U zsh-mime-setup
zsh-mime-setup  # run everything as if it's an executable

#various
setopt glob_dots                # include dotfiles in globbing
unsetopt bg_nice                # no lower prio for background jobs
unsetopt list_beep              # no bell on ambiguous completion
unsetopt hist_beep              # no bell on error in history
unsetopt beep                   # no bell on error
setopt print_exit_value         # print return value if non-zero

#env
source "$HOME/.alias"
source "$HOME/.env"

#antigen (oh-my-zsh)
DISABLE_AUTO_UPDATE=true
source $HOME/.local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
git
screen
vi-mode
z
systemadmin
zsh_reload
zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen theme $HOME/.local/share ngg --no-local-clone
antigen apply
