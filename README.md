# dotfiles

Contains my config files for Linux.

## Install

```shell
git clone https://github.com/JuhoErvasti/dotfiles.git ~/dotfiles
```

Install GNU Stow.

Use `stow` to create symlinks as needed, for example:

```shell
stow nvim
```

If using tmux install tpm:

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## i3 setup dependencies

i3 itself must be relatively new (don't recall the exact version, but some
newer features are used in the config). Add a repository from
[here](https://i3wm.org/docs/repositories.html).

Rust is used to install some dependencies: [installation](https://www.rust-lang.org/tools/install)

These programs are used in the i3 config and should be able to be called. Test
that each one can be found:

Most important: \
xsecurelock (`apt install xsecurelock` or [manual installation](https://github.com/google/xsecurelock?tab=readme-ov-file#installation) `NOTE: use common-auth`, has its own [dependencies](https://github.com/google/xsecurelock?tab=readme-ov-file#requirements)) \
xidlehook (has to be installed with Cargo (`cargo install xidlehook --bins`), has to be at `~/.cargo/bin/xidlehook`), has its own [dependencies](https://github.com/jD91mZM2/xidlehook)) \
xss-lock

Rest of them: \
i3wsr (has to be installed with Cargo (`cargo install i3wsr`), has to be at `~/.cargo/bin/i3wsr`) \
numlockx \
polybar \
polybar-msg \
picom \
feh \
pactl \
playerctl \
gnome-calculator \
rofi \
xclip \
maim \
nm-applet \
dex \
setxkbmap \
brightnessctl (relevant if on a laptop)

Ideally there would be a complete list of the package names as found in the
Ubuntu/Debian repositories, with the "secondary" dependencies included, but as
of writing I don't really have the patience to compile such a list right now.
