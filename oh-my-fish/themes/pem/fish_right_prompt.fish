# Display the following bits on the right:
# * Git branch and dirty state (if inside a git repo)
# * Last command status if error
#
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_right_prompt
  set -l last_status $status
  
  #echo -n -s $cyan (prompt_pwd)
  
  if [ (_git_branch_name) ]
    if [ (_is_git_dirty) ]
      set_color red
      echo ' ★ '
      set_color normal
    end
  end

  if test $last_status -ne 0
    set_color red
    echo ' %d' $last_status
    set_color normal
  end
end
