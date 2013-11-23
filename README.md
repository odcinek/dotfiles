## dotfiles

### Dependencies 

#### OS X

```
brew install coreutils vim tmux wget
```

#### Debian
```
apt-get install vim tmux wget
```

### Deploy
```
git clone git@github.com:odcinek/dotfiles.git ~/.dotfiles/
cd ~/.dotfiles && ./deploy.sh
```

### Terminal

#### iTerm
Preferences -> Profiles -> Text set
* Regular Font 
* Non-ASCII Font

to 14pt "Inconsolata for Powerline"

#### Gnome Terminal

TODO

### Cleanup
```
cd ~/.dotfiles && ./clean.sh
```
