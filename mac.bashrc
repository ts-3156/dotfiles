# Show diff
# colordiff -u <(curl -s https://raw.githubusercontent.com/ts-3156/dotfiles/master/mac.bashrc)  <(cat ~/.bashrc)

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

alias ll='ls -l --color=auto'
alias l.='ls -d .* --color=auto'
alias be='bundle exec'

# brew install bash
# sudo dscl . -create /Users/$USER UserShell /usr/local/bin/bash

# brew install bash-completion2
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# git config --global user.name "Your Name"
# git config --global user.email you@example.com
# git config --global core.editor 'nvim -c "set fenc=utf-8"'

# git config --global pager.diff '/usr/local/share/git-core/contrib/diff-highlight/diff-highlight | less'
# git config --global pager.log '/usr/local/share/git-core/contrib/diff-highlight/diff-highlight | less'
# git config --global pager.show '/usr/local/share/git-core/contrib/diff-highlight/diff-highlight | less'

git config --global alias.co 'checkout'
git config --global alias.st 'status'
git config --global alias.lg 'log --pretty="format:%C(auto)%h %C(cyan)[%ad] %Creset%s%C(auto)%d" --date=format:"%m/%d %H:%M" -n 10'
git config --global alias.cm 'commit --allow-empty'
git config --global alias.br 'branch'
git config --global alias.df 'diff --cached'
git config --global alias.dff 'diff'
git config --global fetch.prune true

alias gco='git co'
alias gst='git st'
alias glg='git lg'
alias gcm='git cm'
alias gpu='git push'
alias gbr='git br'
alias gdf='git df'
alias gdff='git dff'
alias gad='git add'

# wget -q -O ~/.dircolors https://raw.githubusercontent.com/sigurdga/ls-colors-solarized/master/dircolors
eval $(gdircolors ~/.dircolors)

# brew install grc
# sudo wget -q -O /usr/local/share/grc/conf.mysql https://raw.githubusercontent.com/nitso/colour-mysql-console/master/.grcat
# . /usr/local/etc/grc.bashrc

function exit_code()
{
  a=$?
  if [ $a -ne 0 ]; then
    export HEY_EXIT='error '
  else
    export HEY_EXIT=''
  fi
  return $a
}

export MYSQL_PS1="mysql[\d]> "
export PS1='\[\e[35;1m\][\w$(__git_ps1 "[%s]")]\n${HEY_EXIT}\$\[\e[m\] '
export PROMPT_COMMAND='exit_code; echo -ne "\033]0;${PWD##*/}\007"'

export LESS="-iMSx4 -FX -R"
export GREP_OPTIONS='--line-number --color=auto'

export HISTCONTROL=ignoreboth
export HISTSIZE=10000

# brew install neovim
# mkdir -p ~/.config/nvim/bundles
# curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
# sh ./dein_installer.sh ~/.vim/bundles
# cp .vimrc ~/.config/nvim/init.vim
# rm dein_installer.sh
# .vimrc https://gist.github.com/ts-3156/63f1bdc58b4891cd193ad50a299274a9
alias vi='nvim'

# wget -q -O ~/.my.cnf https://gist.githubusercontent.com/ts-3156/0156fa90c21996f99d37/raw

# eval "$(rbenv init -)"
export PATH=$HOME/.nodebrew/current/bin:$PATH

# export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
# PATH=${JAVA_HOME}/bin:${PATH}
