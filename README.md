To apply the dotfiles on a new system, do the following:

1. Clone the repository to the home folder
2. Install GNU stow

```
brew install stow
cd .dotfiles
```

3. Use the stow command with the name of a folder whose dotfiles you want to symlink in the home folder. E.g.

```
stow R
```
