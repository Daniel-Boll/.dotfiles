# <h1 align="center">.dotfiles</h1>

<p align="center">
My dotfiles for Arch Linux 🐧
</p>

> I do plan to enhance it to support other distros in the future.<br>
> Thanks to @tomcat-42 for helping me create this life-saving dotfiles

---

<p align="center">
<img src="https://github.com/Daniel-Boll/.dotfiles/blob/main/.images/screenshot.png" width=800>
</p>

---

## Installation

First you will need to clone this repository:

```bash
git clone https://github.com/Daniel-Boll/.dotfiles ~/.dotfiles
```

or using **gh-cli**

```bash
gh repo clone Daniel-Boll/.dotfiles ~/.dotfiles
```

### Manual Linkage

Create symbolic links for the configurations you want to use, e.g.:

```bash
ls -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

### Using [GNU Stow](https://www.gnu.org/software/stow/) _(recommended)_
Install GNU Stow _(if not already installed)_

    Mac:      brew install stow
    Ubuntu:   apt-get install stow
    Fedora:   yum install stow
    Arch:     pacman -S stow

Then simply use stow to install the dotfiles you want to use:
```
cd ~/.dotfiles
stow nvim
stow tmux
```
