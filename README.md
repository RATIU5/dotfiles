# [RATIU5](https://github.com/RATIU5)’s dotfiles

<!-- Image of terminal -->

![Terminal](/images/terminal1.png)

## Details

This is my personal MacOS dotfile configuration. It includes tools such as:

- [`homebrew`](https://brew.sh/) - Package manager for MacOS
- [`hyperkey`](https://hyperkey.app/) - For remapping Caps Lock key
- [`raycast`](https://raycast.com/) - For productivity
- [`Ghostty`](https://github.com/ghostty-org/ghostty) - Fast, native, feature-rich terminal emulator pushing modern features.
- [`zsh`](https://en.wikipedia.org/wiki/Z_shell) - Zsh shell - [config](dot_config/private_zsh)
  - [`starship`](https://github.com/starship/starship) - For pimping my prompt - [config](dot_config/starship.toml)
- [`fzf`](https://github.com/junegunn/fzf) - Command-line fuzzy finder
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) - Grep on steroids
- [`fd`](https://github.com/sharkdp/fd) - Updated find
- [`zoxide`](https://github.com/ajeetdsouza/zoxide) - Smarter cd command
- [`eza`](https://github.com/eza-community/eza) - Modern `ls`
- [`bat`](https://github.com/sharkdp/bat) - cat(1) clone with wings
- [`neovim`](https://neovim.io/) - Vim on steroids
  - [`neovim config`](https://github.com/RATIU5/nvim) - My own Neovim config written in Lua
- [`git`](https://git-scm.com/) - No comment
  - [`lazygit`](https://github.com/jesseduffield/lazygit) - simple terminal UI for git commands
- [`rust`](https://www.rust-lang.org/), [`go`](https://golang.org/) [`zig`](https://ziglang.org/) - For programming

## Setup

These dotfiles are managed with [chezmoi](https://github.com/twpayne/chezmoi).

Install them with:

```sh
chezmoi init https://github.com/RATIU5/dotfiles.git

chezmoi apply
```

## Acknowledgements

Most of this configuration was inspired by [joelazar/dotfiles](https://github.com/joelazar/dotfiles/tree/main).
Credits to [joelazar](https://github.com/joelazar) for creating such a customizable and flexible dotfile setup!

## License

The code is available under the [MIT license](LICENSE).
