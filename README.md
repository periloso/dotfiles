# Tools

| Tool                   | Choice                  | Comments                                                                                   |
| ---------------------- | ----------------------- | ------------------------------------------------------------------------------------------ |
| Text editor            | [vim][16] / [neovim][1] | FZF integration with [gruvbox][12] theme and [polyglot][11] syntax pack.                   |
| Password store         | [pass][2]               | Secured with [Yubikey][13] and [GnuPG2][14], synchronised with [git][15].                  |
| Code searcher          | [ripgrep][4] + [fzf][3] | See `rgfzf` and `vimfxf` commands in `bin/` and bindings below.                            |
| Terminal multiplexer   | [tmux][5]               | Bindings adjusted to match vim                                                             |
| Version control        | [git][15]               | GnuPG2 used for code signing. GPG agent forwarded to remote hosts with `gssh`              |
| Shell                  | [bash][7]/[zsh][8]      | I used to use fish but it's incompatible with bourne shell which makes maintenance a pain. |
| SSH Agent              | [GnuPG2][14]            | Used with a Yubikey                                                                        |
| Task management        | [Taskwarrior][10]       |                                                                                            |
| Terminal               | [Alacritty][18]         | GPU accelerated. Used with Adobe Source code pro. I also use `kitty`                       |
| Security device        | [Yubikey 5][13]         | Used with [GnuPG2][14] to hold GPG keys and SSH key. Also used for 2FA.                    |

[1]: https://neovim.io/
[2]: http://passwordstore.org/
[3]: https://github.com/junegunn/fzf
[4]: https://github.com/BurntSushi/ripgrep
[5]: https://github.com/tmux/tmux
[7]: https://www.gnu.org/software/bash/
[8]: https://www.zsh.org/
[10]: https://taskwarrior.org/
[11]: https://github.com/sheerun/vim-polyglot
[12]: https://github.com/morhetz/gruvbox
[13]: https://www.yubico.com/product/yubikey-5-nfc/
[14]: https://www.gnupg.org/
[15]: https://git-scm.com/
[16]: https://www.vim.org/
[17]: https://github.com/jwilm/alacritty

# Notable features
* Workflows and application configuration profiled for speed. See section on
  Latency for more information.
* Prompt/hostname colour based on hostname to make it easy to distinguish
  between hosts.
* SSH+GPG agent runs locally, forwarded remotely. SSH_AUTH_SOCK
  is synchronised between tmux sessions.
* history is globally shared, as I use my history as a database to search
* History is automaticall filtered: History is de-duplicated, most recent persists. History
  is also filtered leaving only useful commands. This increases the SNR in the
  history file about 5x, which makes searching the history using FZF quicker.
  History is only cleaned up on shell exit, so you won't lose your immediate
  history which allows for command correction.

# Other software I use
* `tinc` : A reliable mesh VPN
* `ncdu` + `tmpreaper` : tools for clearing up disk space
* `ipython` : interactive python shell
* `ansible` : idempotent, agentless configuration management
* `httpie` : curl alternative with better UX
* `jq` : Command line JSON processor (good with httpie)
* `brew` + `brew cask` : homebrew package manager for OS X
* `restic` : backup software
* `draw.io` : Diagram creation software
* `tig` : Git history visualiser
* `sox`/`ffmpeg`/`gstreamer` Tools to convert multimedia
* `httrack` : a website crawler better than wget (i.e. it works)

![Screenshot](etc/screenshot.png "Why do all terminal screenshots show top or htop running?")


# Custom bindings

| Binding        | Context      | Description                                                                                                                                    |
| -------------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `CTRL+p`       | bash/zsh/vim | Search current directory with FZF and launch editor with results. Tab to select multiple.                                                      |
| `r <string>`   | bash/zsh     | Search current directory with ripgrep for files containing `<string>`, filter with FZF and launch editor with results. Tab to select multiple. |
| `CTRL+r`       | bash/zsh     | History search using fzf.                                                                                                                      |
| `tm`           | bash/zsh     | Launch or connect tmux single session. This is automatic if there is already an unconnected session.                                           |
| `CTRL+s`       | bash/zsh     | Prepend `sudo` to the prompt and move the cursor back to the end of the prompt.                                                                |

See `home/.aliases`, `bin/`, `home/.functions.sh` and `home/.tmux.conf` for
more handy shortcuts/wrappers/bindings.

# Supported OSes

AKA the OSes I actively use.

* Ubuntu 16.04 LTS
* Ubuntu 18.04 LTS
* MacOS (~10.13 High Sierra) (GUI applications too)
* Raspbian Stretch
* ~~Raspbian Jessie~~
* ~~RHEL5~~
* ~~RHEL6~~
* ~~Ubuntu 11.10~~
* ~~Ubuntu 12.04 LTS~~
* ~~Ubuntu 14.04 LTS~~


# One liners

Obviously inspect the script to see what it does before you run it. Note that it
will clobber your settings files.

```bash
curl -sL https://github.com/naggie/dotfiles/raw/master/provision.sh | bash && bash
```

Ubuntu 17.04 does not have curl by default.

```bash
wget -O - https://github.com/naggie/dotfiles/raw/master/provision.sh | bash && bash
```

# Task management

I've tried quite a few TODO systems including simple text files, Todoist,
Trello, Github issues, JIRA, habitica and taskwarrior. The key is
not to use one system for everything. I've settled on:

1. Github issues for personal projects (also using the rest of github)
2. JIRA (with kanban) for work (not by choice but works well if set up with a
   good workflow, slow)
3. Taskwarrior for top level tasks and work logs, with contexts for
   home/work/inbox and detail sometimes tracked separately in (1) and (2).
   Loosely following GTD.
4. Text files to track ideas and proposals

I rely on Taskwarrior to keep a report of what I've done. I kept a log text
file for 3.5 years but stopped because taskwarrior can generate reports.

In my opinion the key for using taskwarrior effectively is reducing noise via
contexts, start/stop, scheduling and tagging. I keep a separate context for
work, home, someday; I defer tasks using the wait/schedule/due attributes. Also
I think it's important not to put tasks on the queue for the sake of it. Only
put tasks on the queue if you need to track them.


# Latency and speed

The lowest possible latency is a target for my workflow and code in this
repository.  Too many user interfaces waste time on stupid animations or are
just generally slow; working with a setup that is perceptually instantaneous is
very pleasant and makes other systems feel irritating to use once you are
familiar with the experience. Beyond the configuration here, here are some
other things that _may_ help reduce latency:

## Things that noticeably help
* Use an accelerated terminal such as `kitty` or `alacritty`
* Turn all animations off where possible. For example, Firefox's "cosmetic"
  animations and "smooth" scrolling.
* Profile  and optimise application startup time
* Use a SSD (preferably NVMe m.2 PCI-E based)
* Use a tiling window manager (no 3D nonsense or time spent adjusting windows)
* Adjust keyboard repeat rate to the lowest setting
* Mitigate [Bufferbloat][17]

## Things that may help
* Use a monitor with low latency and high refresh rate. Again, gaming monitors
  are usually optimised for this.
* Use a keyboard with a fast polling rate and minimal debounce time. A lot of
  gaming keyboards such as the Corsair K70 are optimised for this. MX Speed
  switches may also help.


[17]: https://www.bufferbloat.net/projects/bloat/wiki/What_can_I_do_about_Bufferbloat/


# Tips

1. Run a vim selection through a command with `:!cmd`. Useful for formatting as
   well as copying on a mac: `!pbcopy`. Write from the clipboard with
   `r!pbpaste`.
1. Keep useful local environment variables in ~/.env-local.sh

# Operational security
With major services being compromised more and more, good OPSEC is important.

1. 2FA (U2F) where possible
1. A different password for every service (important to prevent attacker pivot)
1. Yubikey (as an openPGP smartcard) to store my SSH and GPG keys
1. Full-disk encryption for every device
1. Lock-screen for every device
1. Backup 2FA codes, backup passwords and master passwords are in a physical fire safe
1. I may switch to a password manager (pass or Keepassxc)
1. UBlock origin on Firefox
1. HTTPS everywhere on Firefox
1. Own web services configured with A+ rating from ssllabs (best cipher suite, protocol etc)
1. Regular updates of all software
1. Subscription to vulnerability mailing lists
