# Based on blinks theme

if [[ $+MC_SID = 0 ]]; then

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='\
%{%f%k%b%}
%{%K{black}%B%F{green}%}%n%{%F{blue}%}@%{%F{cyan}%}%m %{%b%F{yellow}%K{black}%}%~%{%B%F{green}%}$(git_prompt_info)%E
  %#%{%f%k%b%} '
PROMPT2='%{%K{black}%F{green}%}  %_>%{%f%k%b%} '
RPROMPT=''

fi
