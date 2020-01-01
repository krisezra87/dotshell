### GIT AUTO STATUS ###
# taken from oh my zsh
function current_branch() {
  git_current_branch
}

# default list of git commands `git status` is running after
gitPreAutoStatusCommands=(
    'add'
    'rm'
    'reset'
    'commit'
    'checkout'
    'mv'
    'init'
)

# taken from http://stackoverflow.com/a/8574392/4647743
function elementInArray() {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

function git() {
    command git $@

    if (elementInArray $1 $gitPreAutoStatusCommands); then
        command git status
    fi
}
