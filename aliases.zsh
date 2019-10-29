# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# List direcory contents
alias l='ls -lah'

# Super user
alias _='sudo'
alias please='sudo'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi

alias afind='ack-grep -il'

# ----------------------- My aliases --------------------------

# .zshrc
alias sourcez="source ~/.zshrc"
alias codez="code ~/.zshrc"

# Overwites
alias df='df -h'
alias mv='mv -i'
alias mkdir='mkdir -p'

# Moving around folders
alias desk='cd ~/Desktop'
alias dl="cd ~/Downloads"
alias p='cd ~/Adcolony/portal'
alias c="cd ~/Code"
alias gopz="cd ~/gocode/src/github.com/zianwar"

# MySql
alias startmysql='mysql.server start'
alias stopmysql='mysql.server stop'
alias restartmysql='mysql.server restart'

# Apache
alias startapache='sudo apachectl start'
alias stopapache='sudo apachectl stop'
alias restartapache='sudo apachectl restart'

# Git
alias gpull='git pull'
alias ga='git add'
alias gaa='git add --all'
alias gpush='git push -u'
alias gpushom='git push -u origin master'
alias gs='git status'
alias gco='git commit'
alias gch='git checkout'
alias gshow='git show'

# Browsers
alias firefox="open -a /Applications/Firefox.app"
alias chrome="open -a /Applications/Google\ Chrome.app"

# History
alias h="history"

# Directory tree view
alias t="tree -C"

# Laravel Artisan
alias pa="php artisan"

# Mongodb
alias startmongo="launchctl start org.mongodb.mongod"
alias stopmongo="launchctl stop org.mongodb.mongod"
alias mg='/usr/local/bin/mongod --dbpath /usr/local/var/mongodb'

# Add space to dock
alias dockspace="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'; killall Dock"

# ----------------------- Imported stuff --------------------------

# Get week number
alias week='date +%V'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the "Open With" menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Recursively delete `.DS_Store` files
alias dsstore="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# curl with Google Cloud Authorization
alias gcurl='curl --header "Authorization: Bearer $(gcloud config config-helper --format=value\(credential.id_token\))"'
