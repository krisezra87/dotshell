# Define some colors
#eval g="$FG[076]"
#eval y="$FG[229]"

eval orange='$FG[173]'
eval gray='$FG[246]'
eval blue='$FG[111]'
eval green='$FG[076]'

newline=$'\n'

LS_COLORS="di=38;5;77:fi=38;5;229:ln=38;5;111:ex=38;5;173"
export LS_COLORS

ZSH_THEME_GIT_PROMPT_PREFIX="(git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=")$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$FG[077]"

function git_base_folder {
  local ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  local gitdir=$(git rev-parse --show-toplevel) > /dev/null 2>&1
  if [ $gitdir = $HOME ] > /dev/null 2>&1; then
      tailname="~"
  else
      tailname=$(basename ${gitdir}) > /dev/null 2>&1
  fi
  echo "(${tailname}:"
}

function get_pwd {
    echo "${PWD/$HOME/~}"
}

function git_prompt_info {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  local branch=$(current_branch)
  if [ ${#branch} != 0 ]; then
      ZSH_THEME_GIT_PROMPT_PREFIX=$(git_base_folder)
      echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX\n"
  else
      return
  fi
}

function put_spacing {
    local git=$(git_prompt_info)
    if [ ${#git} != 0 ]; then
        ((git=${#git} - 10))
    else
        git=0
    fi
    local termwidth
    (( termwidth = ${COLUMNS} - 3 - ${#HOST} - ${#$(get_pwd)} - ${#USER}- ${git} ))
    local spacing=""
    for i in {1..$termwidth}; do
        spacing="${spacing} "
    done
    echo $spacing
}

# For right prompt (ish)
# PROMPT='${orange}%n@%m: ${blue}$(get_pwd)$(put_spacing)$(git_prompt_info)${reset_color}%(!.#.$) '
# RPROMPT='${orange}%n@%m: ${blue}$(get_pwd)$(put_spacing)$(git_prompt_info)${reset_color}%(!.#.$) '

PROMPT='${newline}${orange}%n@%m: ${blue}$(get_pwd) $(git_prompt_info)${reset_color}${newline}%(!.#.$) '
# RPROMPT='${newline}${orange}%n@%m: ${blue}$(get_pwd) $(git_prompt_info)${reset_color}${newline}%(!.#.$) '
