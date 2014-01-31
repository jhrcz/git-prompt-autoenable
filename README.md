# git-prompt with include/exclude wrapper

## info

by default these env variables are set to enable useful git-prompt features (configurable in git-prompt.conf)

  * GIT_PS1_SHOWDIRTYSTATE
  * GIT_PS1_SHOWSTASHSTATE
  * GIT_PS1_SHOWUNTRACKEDFILES
  * GIT_PS1_SHOWCOLORHINTS

this brings some colorized indicators to PS1 / COMMAND_PROMPT:

  * `*` unstaged changes
  * `+` staged changes
  * `%` untracked files
  * `$` stashed changes

git-prompt is enabled in `/etc/profile.d/git-prompt-profiled.sh`

git-prompt is enabled only for configured list of users. there are some additional features for using git-prompt on production servers, where large directories with wery slow PS1 response time when git-prompt is enabled. we could define directory include/exclude list. when directory is excluded special indicator is shown:

  * `###` git-prompt excluded directory

real example (with htdocs dir undefined, jizdy in includes and pics subdir in excludes ):

```
[user@server htdocs]$ cd  jizdy
[user@server jizdy (master *)]$
[user@server jizdy (master *)]$ cd pics
[user@server pics (###)]$
[user@server pics (###)]$

```

when there is no specific include list, git-prompt is enabled by default.

## midnight commander compatibility

for working in MC subshell there is special `declare` for `_git_ps1`

## git-prompt doc

https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

## update notes

package contains git-prompt.sh from recent git package.

update could be done with:

```
cp /usr/share/doc/git-1.8.3.1/contrib/completion/git-prompt.sh .
```
