# Dotfiles

Personal shell and terminal configuration for macOS and Linux, managed with
[GNU Stow](https://www.gnu.org/software/stow/).

## Install

Clone the repository anywhere, then run:

```sh
./install
```

The installer obtains Stow through Homebrew, apt, dnf, or pacman when it is not
already installed, then links the files into your home directory. On macOS it
also installs the macOS-specific Ghostty overrides. Existing files are never
overwritten: Stow reports a conflict and leaves them alone.

To migrate an existing setup, back up conflicting managed files before
linking:

```sh
./install --backup
```

Backups are stored below `~/.dotfiles-backup/<timestamp>/` with their original
directory structure intact.

To preview changes or remove the links:

```sh
./install --dry-run
./install --uninstall
```

Optional shell and tmux plugins can be installed separately:

```sh
./install --plugins
```

The plugin step clones Oh My Zsh, the three zsh plugins used here, and TPM. It
is safe to run again; existing clones are left untouched.

## Packages

Standard software is declared in two Homebrew Bundle profiles:

- `common`: shell, terminal, development, infrastructure, and everyday tools
- `personal`: browsers, communication, gaming, and media applications

`common` is always installed. Select one or both machine roles with:

```sh
./packages/install common
./packages/install personal
./packages/install all
```

The installer uses Homebrew formulae on both macOS and Ubuntu, macOS casks for
desktop applications, and Flathub on Ubuntu. On Ubuntu, Docker Engine is
installed through apt because a Homebrew Docker package would provide only the
client. Homebrew, its Ubuntu build prerequisites, Flatpak, and Docker are
bootstrapped when needed.

Package runs do not upgrade already-installed software by default. Use
`--upgrade` to request upgrades, or inspect missing dependencies without making
changes:

```sh
./packages/install --check common
./packages/install --upgrade all
```

## Managed files

These Stow packages are installed on both platforms:

- `~/.zshrc` and `~/.zsh_aliases`
- `~/.vimrc`
- `~/.tmux.conf`
- `~/.tigrc`
- `~/.config/bat/config`
- `~/.config/ghostty/config.ghostty`

The package names are `shell`, `vim`, `tmux`, `tig`, `bat`, and `ghostty`.
Keeping applications separate prevents Stow from linking the whole `~/.config`
directory and also makes it easy to manage a single application manually.

The `macos` package adds Ghostty settings that only exist on macOS. Ghostty
loads the common XDG config on macOS as well as its native Application Support
config, so the shared settings do not need to be duplicated.

## Why Stow

Stow is a small, maintained symlink-farm manager and explicitly supports using
the home directory as a target. It fits this repository better than a stateful
or templated manager because the configurations are mostly identical across
machines. Chezmoi remains the stronger option if encrypted secrets, per-host
templates, or one-command remote initialization become requirements later.

Other reasonable options considered were
[yadm](https://yadm.io/docs/overview), which treats the home directory as a Git
work tree, and [Dotbot](https://github.com/anishathalye/dotbot), which uses an
explicit YAML manifest. Both add features this small repository does not need.

## Layout

Stow packages mirror their destination below `$HOME`. Names beginning with
`dot-` are translated to leading-dot names by Stow's `--dotfiles` option. For
example, `shell/dot-zshrc` becomes `~/.zshrc`.
