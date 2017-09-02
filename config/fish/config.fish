set git_dirty_color red
set git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $git_not_dirty_color)$branch(set_color normal)
  end
end

##################################################
# prompt

#peco
function fish_user_key_bindings
    bind \cr peco_select_history
end

function fish_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  set default_color (set_color white)
  set prompt (set_color yellow)(prompt_pwd)

  if test -n "$git_dir"
    echo $prompt [(parse_git_branch)] (set_color yellow)"\$ $default_color"
  else
    echo $prompt (set_color yellow)"\$ $default_color"
  end
end

# go-lang
set -x GOPATH $HOME/.go
# set -x PATH   $PATH $GOPATH/bin # TODO: install go-lang

# node-js
set -x PATH $PATH /usr/local/bin

# pyenv
set -x PATH $HOME/.pyenv/bin $PATH
set -x PYENV_ROOT $HOME/.pyenv
status --is-interactive
. (pyenv init - | psub)
