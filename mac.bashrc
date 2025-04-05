# Show diff
# colordiff -u <(curl -s https://raw.githubusercontent.com/ts-3156/dotfiles/master/mac.bashrc)  <(cat ~/.bashrc)

# Disable auto update
export HOMEBREW_NO_AUTO_UPDATE=1

# brew install bash
# echo '/opt/homebrew/bin/bash' >>/etc/shells
# chsh -s /opt/homebrew/bin/bash

# brew install coreutils findutils
PATH="/opt/homebrew/bin:$PATH"
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"

alias ll='ls -l --color=auto'
alias l.='ls -l -d .* --color=auto'
alias be='bundle exec'

# brew install bash-completion2
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
# source /opt/homebrew/etc/bash_completion.d/git-prompt.sh
# source /opt/homebrew/etc/bash_completion.d/git-completion.bash

# git config --global user.name "Your Name"
# git config --global user.email you@example.com
# git config --global core.editor 'nvim -c "set fenc=utf-8"'

# git config --global pager.diff '/opt/homebrew/share/git-core/contrib/diff-highlight/diff-highlight | less'
# git config --global pager.log '/opt/homebrew/share/git-core/contrib/diff-highlight/diff-highlight | less'
# git config --global pager.show '/opt/homebrew/share/git-core/contrib/diff-highlight/diff-highlight | less'

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
# sudo wget -q -O /opt/homebrew/share/grc/conf.mysql https://raw.githubusercontent.com/nitso/colour-mysql-console/master/.grcat

_show_cursor() {
  echo -ne "\e[?25h"
}
_hide_cursor() {
  echo -ne "\e[?25l"
}
echo -ne "\e[?1004h" # Enable focus-reporting. Disable -> echo -ne '\e[?1004l'
bind -x '"\e[I":"_show_cursor"'
bind -x '"\e[O":"_hide_cursor"'

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
export PS1='\[\e[35;1m\][\w$(__git_ps1 "[%s]")]\[\e[m\]\n\[\e[35;1m\]${HEY_EXIT}\$\[\e[m\] '
export PROMPT_COMMAND='exit_code; echo -ne "\033];${PWD##*/}\007"'

export LESS="-iMSx4 -FX -R"
export GREP_OPTIONS='--color=auto'

export HISTCONTROL=ignoreboth
export HISTSIZE=100000

# brew install neovim
# mkdir -p ~/.config/nvim/bundles
# curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
# sh ./dein_installer.sh ~/.vim/bundles
# cp .vimrc ~/.config/nvim/init.vim
# rm dein_installer.sh
# .vimrc https://gist.github.com/ts-3156/63f1bdc58b4891cd193ad50a299274a9
alias vi='nvim'

# wget -q -O ~/.my.cnf https://gist.githubusercontent.com/ts-3156/0156fa90c21996f99d37/raw

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.deno/env"
. "$HOME/.cargo/env"

alias beep='for i in {1..1}; do afplay /System/Library/Sounds/Submarine.aiff; done'
