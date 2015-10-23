export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"

# show git branch in prompt
export PS1='\[\e[1;32m\]\w\[\e[0m\] $(git branch 2>/dev/null | grep '^*' | colrm 1 2) \$ '

# show/hide hidden files in finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias speed='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'

# git maddness
alias g='git'
alias gis='git status'
alias gib='git branch -a'
alias gic='git commit'
alias gica='git commit --amend'
alias gil='git log'
alias gill='git log --graph --pretty=oneline --abbrev-commit'
alias pull='git fetch && git rebase origin/$(git branch 2>/dev/null | grep '^*' | colrm 1 2)'
alias p=pull
alias push='git push'
alias gia='git add'
alias gir='git reset'
alias gich='git checkout'
alias gid='git diff'
alias gidd='git diff --staged'
alias clone='git clone'

# edit bash_profile
alias bp='vim ~/.bash_profile'
alias lbp='source ~/.bash_profile'
alias vc='vim ~/.vimrc'

# tab completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

alias gcc='gcc-4.8'
alias cc='gcc-4.8'
alias g++='g++-4.8'
alias c++='c++-4.8'

alias flip='cd /Users/pavel/Developer/Flip/nodejs-JustFlip'

alias t='npm test'

# vim obsession ftw
function vim() {
  if test $# -gt 0; then
    env vim "$@"
  elif test -f Session.vim; then
    env vim -S
  else
    env vim -c Obsession
  fi
}

