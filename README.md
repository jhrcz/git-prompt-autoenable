
# info

by default these env variables are set to enable useful git-prompt features:

  * GIT_PS1_SHOWDIRTYSTATE
  * GIT_PS1_SHOWSTASHSTATE
  * GIT_PS1_SHOWUNTRACKEDFILES
  * GIT_PS1_SHOWCOLORHINTS

this brings some colorized indicators to PS1 / COMMAND_PROMPT:

  * `*` unstaged changes
  * `+` staged changes
  * `%` untracked files
  * `$` stashed changes

git-prompt is enabled in `/etc/profile.d/git-prompt-profiled.sh` where these option could be reconfigured

for working in MC subshell there is special `declare` for `_git_ps1`

# git-prompt doc

https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

# update notes

package contains git-prompt.sh from recent git package.

update could be done with:

```
cp /usr/share/doc/git-1.8.3.1/contrib/completion/git-prompt.sh .
```
