# Based on blinks theme

if [[ -z "$MC_SID" ]]; then

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}[%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ngg_theme_user_host() {
	if [[ $UID -ne 0 ]]; then
		echo -n "%{$fg[green]%}%n"
	else
		echo -n "%{$fg[red]%}%n"
	fi
	echo -n "%{$fg[blue]%}@"
	echo -n "%{$fg[cyan]%}%M"
	if [[ ! -z "$SSH_CLIENT" ]]; then
		echo -n " (%{$fg[yellow]%}SSH %{$fg[cyan]%}from ${SSH_CLIENT%% *})"
	fi
}
ngg_theme_lineup=$'\e[1A'
ngg_theme_linedown=$'\e[1B'

PROMPT="\
%{%f%k%b%}
%{%B%K{black}%}$(ngg_theme_user_host) %{$fg[yellow]%}%~%{$fg[green]%}"'$(git_prompt_info)'"%E
  %#%{%f%k%b%} "
PROMPT2="%{%B%K{black}$fg[green]%}  %_>%{%f%k%b%} "
RPROMPT="%{${ngg_theme_lineup}%b$FG[010]%K{black}%} %D{%a %Y-%m-%d | %H:%M:%S}%E%{%f%k%b${ngg_theme_linedown}%}"

fi
