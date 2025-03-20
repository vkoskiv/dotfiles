## Yet another attempt to organize my dotfiles

# Things to remember

* When checking out, do:
```
git clone --bare git@github.com:vkoskiv/dotfiles $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```
If setting up on a new system, it'll likely complain about existing files.
I stash them like this, so I can then later copy back to get a diff and then decide
what I want to keep:

```
mkdir .dotfile_backup
dotfile checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I{} mv {} .dotfile_backup/{}
```

Then
```
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

Now I can copy files back in and process the diff to decide what to bring in.
