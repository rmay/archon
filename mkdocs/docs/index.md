# Welcome!

## What is Archon?

I was inspired by DHH's [Omarchy](https://omarchy.org/) early versions, pre-ISO, when it was a collection of Bash scripts.

While I wanted [Arch](https://archlinux.org/), I didn't want Wayland, at all.

I took his ideas and started my own project.

Archon uses [Arch](https://archlinux.org/), but instead of Wayland, I'm using X11 and [Window Maker](https://www.windowmaker.org/).

This is not for the casual computer user, this is for people that like computers as tinkering machines but still want get stuff done.

It comes pre-installed with shells, a few development tools, Docker, Chromium, Brave, LibreOffice, basically everything needed to get started developing.

It's a mix of TUI and GUI elements, wrangled together to present a more cohesive whole than what comes out of the box.

If you want something much more polished, check out DHH's [Omakub](https://omakub.org/) or [Omarchy](https://omarchy.org/). Both are stellar projects and I promise you won't hurt my feelings if you choose one or the other.

Still with me? Let's do this.

## Brief install instructions for the busy developer

Burn the Arch iso to a thumbdrive.

Here the installation settings that have been worked for me: 

* Archinstall Language -- default  
* Locales -- default  
* Mirrors and repositories -> Select region -> United States  
* Disk configuration -> Partitioning -> Use a best-effort default partition layout -> Filesystem -> btrfs -> Use BTRFS subvolumes with a default structure -> Yes -> Use Compression  
* Swap -- default  
* Bootloader -- default  
* Unified kernel image -- default  
* Hostname -> change to your hostname  
* Root password -> change to what you want  
* User account -> Add your user account here -> make yourself a superuser  
* Profile -- default  
* Audio -> pipewire  
* Kernels -- default  
* Network configuration -> Use NetworkManager (this has worked for me the best)  
* Additional packages -> `/wget`  
* Timezone -> set to your timezone  
* Automatic time sync (NTP -- default)  

After rebooting into your fresh Arch install, run this command (that's a capital "o", not a zero):  
`wget -qO- https://solarvoid.com/archon | bash`

This will set up the base system with all the default settings. Once that's done, the system will reboot and present you with a login screen. Login again with your Arch user, and welcome to the cutting edge of retro-future 90's!

I've been mostly developing on a VM, but I have tried it on real hardware and I am slowly making it my primary non-work development environment. Just one more Bash script, bro.

## What's in the box?

Here's a partial list of what it comes with out of the box:

* Window Maker and some extras
* A curated Window Maker menu
* Window Maker set up for 4 workspaces. You access them quickly by `Super+<n>` or by using the mouse wheel on the root window. The clip in the upper right corner shows the current workspace and lets you move through them by clicking the arrows. You can move a window to a workspace with `Super+ctrl+<n>`
* Four terminals: Ghostty, Alacritty, xterm, and st, with the last one being built from source during install. The default terminal is currently Ghostty.
* Two browsers: Brave and Chromium, with the latter the default.
* Three file managers: Nautilus, Thunar, and Ranger in a terminal.
* Development tools: VSCode, neovim using LazyVim for the defaults, gVim, and Doom Emacs.
* Docker and a TUI with lazydocker
* LibreOffice
* Two pdf viewers: Evince and xPdf
* Loqseq
* Nextcloud
* Gimp
* VLC
* mpv
* Rofi and dmenu

I've also taken DHH's command line tool and changed it.

In the terminal, run: `archon`

* You can set the default terminal between the ones listed, change the curated theme to one I've copied from DHH, and install one of the three programming languages I'm currently supporting as extras: Go, Ruby, Java, SBCL with Quicklisp, and Squeak. C, C++, and Python are already there, with versions 20.1.8, 15.1.1, and 3.13.5 respectively, as of this writing (September 2025). I'm using [mise-en-place](https://mise.jdx.dev/) to manage Ruby and Go. First time using it and I'm interested to see how it shakes out.

In addition to the default keyboard shortcuts offered by Window Maker, I'm using xbindkeys.

A few shortcuts:

* `Super+Return` starts the default terminal.
* `Super+Return+Shift` starts xterm, just in case.
* `Super+~` starts dmenu
* `Super+space` starts rofi

See [Shortcuts](shortcuts.md) for more details.


# But, why?

I want a stable, repeatable experience in Linux. I've tried a bunch of stuff over the years, but nothing really gelled. I've liked things from all sorts of places, but never in a complete package. And while not perfect, I have a fondness for the 90's computer aesthetic. And I wanted to do just do a thing.

* Arch for the packages and a rolling update to keep things fresh.
* X11 because it is still a better system than Wayland. Not flashier, but battle-hardened and proven.
* Window Maker because the asthetic is solid, it's lightweight, and I like it, despite being so old.
* C/C++ to compile all the things.
* Ruby because it's a great language.
* Go because it's the best get stuff done language I've found.
* Squeak Smalltalk because the concepts are from a future we could have had.
* Java because it runs everything.
* SBCL because if you don't have some half-started Common Lisp app buried somewhere are you really trying?
* Neovim because it's hip.
* Doom Emacs because it's not.
* LazyDocker because the desktop version is really heavy and the plain cli tool is a pain when you only use it occasionally.
* LazyGit because it's really slick and easy to use.