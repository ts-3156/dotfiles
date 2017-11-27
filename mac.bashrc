PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

alias ll='ls -l --color=auto'
alias l.='ls -d .* --color=auto'
alias be='bundle exec'

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# git config --global user.name "Your Name"
# git config --global user.email you@example.com
# git config --global core.editor 'nvim -c "set fenc=utf-8"'

git config --global alias.co 'checkout'
git config --global alias.st 'status'
git config --global alias.lg 'log --pretty="format:%C(yellow)%h %C(cyan)[%ad] %Creset%s" --date=format:"%m/%d %H:%M" -n 10'
git config --global alias.cm 'commit --allow-empty'
git config --global alias.br 'branch'
git config --global alias.df 'diff --cached'
git config --global alias.dff 'diff'

alias gco='git co'
alias gst='git st'
alias glg='git lg'
alias gcm='git cm'
alias gbr='git br'
alias gdf='git df'
alias gdff='git dff'
alias gad='git add'

# wget -q -O ~/.dircolors https://raw.githubusercontent.com/sigurdga/ls-colors-solarized/master/dircolors
eval $(gdircolors ~/.dircolors)

# brew install grc
# sudo wget -q -O /usr/local/share/grc/conf.mysql https://raw.githubusercontent.com/nitso/colour-mysql-console/master/.grcat
. /usr/local/etc/grc.bashrc

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
export PS1='\[\e[33;1m\][\u@\h \w$(__git_ps1 "[%s]")]\n${HEY_EXIT}\$\[\e[m\] '
export PROMPT_COMMAND='exit_code; echo -ne "\033]0;${PWD##*/}\007"'

export LESS="-iMSx4 -FX -R"
export GREP_OPTIONS='--line-number --color=auto'

export HISTCONTROL=ignoreboth
export HISTSIZE=10000

# brew install neovim
# mkdir ~/.config
# ln -s ~/.vim ~/.config/nvim
# ln -s ~/.vimrc ~/.config/nvim/init.vim
alias vi='nvim'

# curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
# mkdir -p ~/.vim/bundles
# sh ./dein_installer.sh ~/.vim/bundles
# rm dein_installer.sh
# .vimrc https://gist.github.com/ts-3156/63f1bdc58b4891cd193ad50a299274a9

# wget -q -O ~/.my.cnf https://gist.githubusercontent.com/ts-3156/0156fa90c21996f99d37/raw

eval "$(rbenv init -)"
