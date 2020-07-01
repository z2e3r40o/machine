MACHINE="$HOME/.machine"

#
# Xcode
#

xcode() {
    echo "Xcode - start"
    xcode-select --print-path &> /dev/null
    [ $? -eq 0 ] && echo "Xcode already installed, skipping"
    [ $? -ne 0 ] && xcode-select --install
    echo "Xcode - end"
}

#
# Homebrew
#

install_homebrew() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

homebrew() {
    echo "Homebrew - start"
    type brew &> /dev/null
    [ $? -eq 0 ] && echo "Homebrew already installed, skipping"
    [ $? -ne 0 ] && install_homebrew
    echo "Homebrew - end"
}

#
# Config
#

config() {
    echo "Config - start"
    [ -d $MACHINE  ] && echo "Configuration exists at $MACHINE, skipping"
    [ ! -d $MACHINE  ] && mkdir $MACHINE && install_config
    echo "Config - end"
}

install_config() {
    machinegit=""
    vared -p "What is the machine config git path? " -c machinegit
    git clone --recurse-submodules "$machinegit" "$MACHINE"
}

#
# Install Apps and Programs
#

apps() {
    echo "Apps - start"
    [ -f "$HOME/.Brewfile" ] && echo "Brewfile exists at $HOME/.Brewfile, skipping"
    [ ! -f "$HOME/.Brewfile" ] && brew bundle --file "$MACHINE/dotfiles/Brewfile"
    echo "Apps - end"
}

#
# Dotfiles
#

dotfiles() {
    echo "Dotfiles - start"
    [ -f "$HOME/.rcrc" ] && echo "Dotfiles exists at $HOME/.rcrc, skipping"
    [ ! -f "$HOME/.rcrc" ] && ln -s "$MACHINE/dotfiles/rcrc" "$HOME/.rcrc" && rcup
    echo "Dotfiles - end"
}

#
# Colors
#

install_base16() {
    git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell
}

colors() {
    echo "Colors - start"
    base16shell="$HOME/.config/base16-shell"
    [ -d $base16shell ] && echo "Color exist at $base16shell, skipping"
    [ ! -d $base16shell ] && install_base16
    echo "Colors - end"
}

#
# Fonts
#

install_firacode() {
    git clone https://github.com/tonsky/FiraCode.git $HOME/.config/FiraCode
}

fonts() {
    echo "Fonts - start"
    firacode="$HOME/.config/FiraCode"
    [ -d $firacode ] && echo "Fonts exist at $firacode, skipping"
    [ ! -d $firacode ] && install_firacode
    echo "Fonts - end"
}

#
# SSH key
#

sshkey() {
    echo "SSH - start"
    [ -f "$HOME/.ssh/id_rsa.pub" ] && echo "SSH Key exists at $HOME/.ssh/id_rsa.pub, skipping"
    [ ! -f "$HOME/.ssh/id_rsa.pub" ] && ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa"
    echo "SSH - end"
}

#
# Run
#

run() {
    echo "Machine - start"
    echo
    xcode
    echo
    homebrew
    echo
    config
    echo
    apps
    echo
    dotfiles
    echo
    colors
    echo
    fonts
    echo
    sshkey
    echo
    echo "Machine - end"
}

#
# Start here
#

run
