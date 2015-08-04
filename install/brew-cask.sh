apps=(
    alfred
    atom
    dash
    dropbox
    firefox
    firefox-nightly
    firefoxdeveloperedition
    flux
    glimmerblocker
    google-chrome
    google-chrome-canary
    google-drive
    gyazo
    imagealpha
    imageoptim
    iterm2
    kaleidoscope
    mou
    opera
    rescuetime
    screenflow
    sourcetree
    spotify
    sublime-text3
    transmit
    virtualbox
    vlc
    webstorm
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webpquicklook suspicious-package && qlmanage -r
