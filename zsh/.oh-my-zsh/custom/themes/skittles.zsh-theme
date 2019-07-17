# skittles.zsh-theme

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  echo '○'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'


PROMPT="%{$FG[205]%}╭─%{$FG[030]%}%n%{$reset_color%} %{$FG[205]%}at%{$reset_color%} %{$FG[030]%}$(box_name)%{$reset_color%} %{$FG[205]%}in%{$reset_color%} %{$terminfo[bold]$FG[030]%}%~%{$reset_color%}${git_info} %{$FG[205]%}
╰─${prompt_char}%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[205]%}on%{$reset_color%} %{$FG[030]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
ZSH_THEME_RUBY_PROMPT_PREFIX="‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"
