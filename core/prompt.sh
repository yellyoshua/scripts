__user_and_host="\[\033[01;32m\]\u@\h"
__user="\[\033[01;32m\]\u"
__cur_location="\[\033[01;34m\]\w"
__cur_mini_location="\[\033[01;34m\]\W"
__git_branch_color="\[\033[31m\]"
__git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
__prompt_tail="\[\033[35m\]$"
__prompt_tail_blue="\[\033[01;34m\]$"
__last_color="\[\033[00m\]"

export PS1="$__user $__cur_mini_location $__git_branch_color$__git_branch$__prompt_tail_blue$__last_color "
