# machine

This repository contains everything I need to quickly get a brand new machine ready for development.

After setting up a user account on an Apple machine, I login with that user and run the following
command in Terminal.app, there are prompts for information as it runs and a few manual steps to completed after:

```zsh
$ curl "https://raw.githubusercontent.com/z2e3r40o/machine/master/install.sh" | zsh
```

Once complete I have the following on my machine:

1. XCode
2. Homebrew
3. Machine configuration files
4. Programs
    - [coreutils](https://www.gnu.org/software/coreutils/)
    - git (latest)
    - GPG
    - vim (latest)
    - [RCM](https://github.com/thoughtbot/rcm)
    - [FZF](https://github.com/junegunn/fzf)
    - [ag](https://github.com/ggreer/the_silver_searcher)
5. Apps
    - Bitwarden
    - ProtonVPN
    - iTerm2
    - Firefox Developer Edition
6. Dotfiles
7. Colors
    - [Base16](https://github.com/chriskempson/base16-shell)
    - [GRC](https://github.com/garabik/gr://github.com/garabik/grc)
8. Fonts
9. SSH key
10. GPG key

The following will need to be completed manually:

1. Set MacOS settings (i.e. tap to click, ctrl to capslock, etc)
2. Set correct GPG key in `dotfiles/gitconfig` for signing commits
3. Set iTerm font to FiraCode
4. Select default base16-shell theme (i.e. `$ base16_tommorrow-night`)
5. Access Bitwarden
6. Upload public keys
