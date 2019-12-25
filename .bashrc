# Show diff
# colordiff -u <(curl -s https://raw.githubusercontent.com/ts-3156/dotfiles/master/.bashrc)  <(cat ~/.bashrc)

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# sudo cp -p /usr/share/zoneinfo/Japan /etc/localtime

# sudo yum install --enablerepo=epel -y bash-completion

alias tmux='tmux -2'
alias be='bundle exec'
# alias grep='grep --color=auto --line-number'

if [ ! -f ${HOME}/git-completion.bash ]; then
  wget -q -O ${HOME}/git-completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
fi
source ${HOME}/git-completion.bash

if [ ! -f ${HOME}/git-prompt.sh ]; then
  wget -q -O ${HOME}/git-prompt.sh https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
fi
source ${HOME}/git-prompt.sh

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

export LESS="-iMSx4 -FX -R"
# export MYSQL_PS1=$(echo -e "\e[1;33mmysql[\d]\e[0m\n> ") # with color
export MYSQL_PS1="mysql[\d]> " # without color
# export PS1="\[\e[33;1m\][\u@\h \w]\$\[\e[m\] " # without git
export PS1='\[\e[33;1m\][\u@\h \w$(__git_ps1 "[%s]")]\n${HEY_EXIT}\$\[\e[m\] '
export PROMPT_COMMAND='exit_code; echo -ne "\033]0;localhost\007"'

git config --global color.ui auto
git config --global push.default current
git config --global core.editor 'vim'
git config --global alias.co 'checkout'
git config --global alias.st 'status'
#git config --global alias.lg 'log --graph --decorate --oneline -n 10'
git config --global alias.lg 'log --oneline -n 10'
git config --global alias.cm 'commit --allow-empty'
git config --global alias.br 'branch'
git config --global alias.df 'diff --cached'
git config --global alias.dff 'diff'
# git config --global alias.fe 'fetch'
# git config --global alias.me 'merge'
# git config --global alias.pu 'pull'
git config --global fetch.prune true

alias gco='git co'
alias gst='git st'
alias glg='git lg'
alias gcm='git cm'
alias gbr='git br'
alias gdf='git df'
alias gdff='git dff'
# alias gfe='git fe'
# alias gme='git me'
# alias gpu='git pu'
alias gad='git add'

#if [ ! -f ~/.inputrc ]; then
#  if uname | grep 'Darwin' >/dev/null 2>&1 ; then
#    wget -O ~/.inputrc https://gist.githubusercontent.com/ts-3156/ac4e3c6e8c6f0c497a31/raw >/dev/null 2>&1
#  else
#    wget -O ~/.inputrc https://gist.github.com/ts-3156/5427529/raw >/dev/null 2>&1
#  fi
#fi

#if [ ! -f ~/.editrc ]; then
#  wget -O ~/.editrc https://gist.githubusercontent.com/ts-3156/0a20e65af503729c0003/raw >/dev/null 2>&1
#fi

#if [ ! -f ${HOME}/.vimrc ]; then
#  wget -q -O ${HOME}/.vimrc https://gist.github.com/ts-3156/5373970/raw
#fi

#if [ ! -d ${HOME}/.vim/bundle ]; then
#  mkdir -p ${HOME}/.vim/bundle
#fi
#if [ ! -d ${HOME}/.vim/bundle/neobundle.vim ]; then
#  git clone git://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim
#fi

if [ ! -f ${HOME}/.psqlrc ]; then
  wget -q -O ${HOME}/.psqlrc https://raw.githubusercontent.com/ts-3156/dotfiles/master/.psqlrc
fi

if [ ! -f ${HOME}/.my.cnf ]; then
  wget -q -O ${HOME}/.my.cnf https://raw.githubusercontent.com/ts-3156/dotfiles/master/.my.cnf
fi

if [ ! -f ${HOME}/.tmux.conf ]; then
  wget -q -O ${HOME}/.tmux.conf https://raw.githubusercontent.com/ts-3156/dotfiles/master/.tmux.conf
fi

if [ ! -f ${HOME}/dircolors.256dark ]; then
  wget -q -O ${HOME}/dircolors.256dark https://raw.githubusercontent.com/ts-3156/dotfiles/master/dircolors.256dark
fi
eval $(dircolors ${HOME}/dircolors.256dark)

export HISTCONTROL=ignoreboth
export HISTSIZE=10000

# if [[ -x `which colordiff >/dev/null 2>&1` ]]; then
if which colordiff >/dev/null 2>&1 ; then
  alias diff='colordiff'
fi

if [ ! -f /usr/local/bin/grc ]; then
  cd ${HOME}
  wget -q https://github.com/garabik/grc/archive/v1.11.3.tar.gz
  tar zxf v1.11.3.tar.gz
  cd grc-1.11.3
  sudo sh ./install.sh
  sudo wget -q -O /usr/local/share/grc/conf.mysql https://raw.githubusercontent.com/ts-3156/dotfiles/master/grc/conf.mysql
  cd ${HOME}
  rm -rf grc-1.11.3 v1.11.3.tar.gz
  # sudo yum install -y python36
fi

#if [ ! -f /usr/local/bin/pt ]; then
#  cd
#  wget -q https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.1.3/pt_linux_amd64.tar.gz
#  tar xzf pt_linux_amd64.tar.gz >/dev/null 2>&1
#  sudo cp pt_linux_amd64/pt /usr/local/bin
#  rm -rf pt_linux_amd64*
#fi

#if [ ! -f /usr/local/bin/peco ]; then
#  cd
#  wget -q https://github.com/peco/peco/releases/download/v0.3.6/peco_linux_amd64.tar.gz
#  tar xzf peco_linux_amd64.tar.gz >/dev/null 2>&1
#  sudo cp peco_linux_amd64/peco /usr/local/bin
#  rm -rf peco_linux_amd64*
#fi

#if [ ! -d ${HOME}/z ] ; then
#  cd
#  git clone https://github.com/rupa/z.git ${HOME}/z
#fi
#. ${HOME}/z/z.sh

export EDITOR="/usr/bin/vim"
