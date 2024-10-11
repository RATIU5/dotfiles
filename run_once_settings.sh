#!/bin/bash

SOURCE_DIR=$(chezmoi source-path)

. "$SOURCE_DIR/scripts/utils"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "System configuration\n"

ask_for_confirmation "Would you like to do it now?"
if ! answer_is_yes; then
    exit
fi

ask_for_sudo

if [ "$SHELL" != "/bin/zsh" ]; then
    # macOS typically uses /usr/local/bin/zsh or /bin/zsh
    ZSH_PATH=$(command -v zsh)

    # Check if zsh is already in /etc/shells
    if ! grep -q "$ZSH_PATH" /etc/shells; then
        sudo sh -c "echo $ZSH_PATH >> /etc/shells"
    fi

    chsh -s "$ZSH_PATH"
    print_result $? "Set shell to zsh"
fi

execute "if [ ! -d $HOME/.config/nvim ]; then git clone git@github.com:RATIU5/nvim.git $HOME/.config/nvim; fi;" "Clone neovim config repo"

execute "defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false" "Keyboard: Disable tooltip when holding key"

execute 'sudo nvram SystemAudioVolume=" "' "Disable the sound effects on boot"

execute "defaults write NSGlobalDomain AppleShowAllExtensions -bool true" "Show all filename extensions"

execute "defaults write com.apple.dock autohide -bool true" "Automatically hide and show the Dock"

execute "defaults write com.apple.dock autohide-delay -float 0" "Remove the auto-hiding Dock delay"

execute "defaults write com.apple.dock autohide-time-modifier -float 0" "Remove the animation when hiding/showing the Dock"

execute "defaults write com.apple.LaunchServices LSQuarantine -bool false" "Disable the 'Are you sure you want to open this application?' dialog"

execute 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{enabled = 0; value = {};}"' "Disable Spotlight keyboard shortcut for Show Spotlight search"

execute 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 "{enabled = 0; value = {};}"' "Disable Spotlight keyboard shortcut for Finder search window"

execute "defaults write com.apple.screencapture location ~/Pictures/screenshots/" "Save screenshots to the Pictures/screenshots directory"

# disable wakeup on bluetooth
# https://apple.stackexchange.com/questions/431812/how-can-i-stop-a-bluetooth-keyboard-from-waking-my-macbook-pro/437396#437396
if [ ! -f ~/.sleep ] || [ ! -f ~/.wakeup ]; then
    echo "$(which blueutil) -p 0" >~/.sleep
    echo "$(which blueutil) -p 1" >~/.wakeup
    chmod 755 ~/.sleep ~/.wakeup
    brew services restart sleepwatcher
    print_result $? "Setup sleepwatcher"
else
    print_success "Setup sleepwatcher"
fi

# enable touchid for sudo
if [ -f /etc/pam.d/sudo_local ]; then
    echo "auth       sufficient     pam_tid.so" | sudo tee -a /etc/pam.d/sudo_local
    print_result $? "Enable touchid for sudo"
fi
