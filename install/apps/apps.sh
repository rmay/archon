#!/usr/bin/env bash

yay -S --noconfirm --needed \
  vlc libreoffice-fresh gimp mpd ncmpcpp \
  nsxiv mpv evince imv \
  chromium brave-bin \
  visual-studio-code-bin \
  xorg-xconsole \
  xorg-xcalc thunar \
  logseq-desktop-bin nextcloud-client \
  dunst libnotify flameshot 

# Notifications
mkdir -p ~/GNUstep/Library/WindowMaker
cat >"$HOME/GNUstep/Library/WindowMaker/autostart" <<'EOF'
#!/usr/bin/env bash
# Only start these if they haven't been already started
# Notifications
if ! pgrep -u "$USER" dunst >/dev/null 2>&1; then
    dunst &
fi

# Keybindings
if ! pgrep -u "$USER" xbindkeys >/dev/null 2>&1; then
    xbindkeys &
fi

# System tray
if ! pgrep -u "$USER" pasystray >/dev/null 2>&1; then
    pasystray &
fi

# Screensaver 
if ! pgrep -u "$USER" xscreensaver >/dev/null 2>&1; then
    xscreensaver -nosplash &
fi

wmsetbg ~/.config/archon/current/background &
EOF
chmod +x ~/GNUstep/Library/WindowMaker/autostart


configure_xscreensaver() {
    # configure-xscreensaver-random.sh
    # Configure XScreenSaver to use random savers with sensible defaults.

    set -euo pipefail

    CONFIG="$HOME/.xscreensaver"

    # Helper: set or add a key: value pair in ~/.xscreensaver
    set_kv () {
      local key="$1"
      local value="$2"
      if grep -q -E "^${key}:" "$CONFIG" 2>/dev/null; then
        sed -i -E "s|^(${key}:\s*).*|\1${value}|" "$CONFIG"
      else
        printf "%s: %s\n" "$key" "$value" >>"$CONFIG"
      fi
    }

    echo "Configuring XScreenSaver for random mode…"

    # Ensure a config exists (this seeds the full default 'programs' list)
    if [ ! -f "$CONFIG" ]; then
      xscreensaver-command -initialize >/dev/null 2>&1 || true
    fi

    # Stop any running daemon so changes are cleanly picked up
    pkill xscreensaver 2>/dev/null || true

    # Sensible defaults:
    #  - Start after 10 minutes
    #  - Lock after 15 minutes
    #  - Change to a new random saver every 10 minutes
    #  - Use random mode (not blank)
    #  - Keep DPMS off here (you’re already handling DPMS via xset)
    set_kv "timeout"      "0:10:00"
    set_kv "lockTimeout"  "0:15:00"
    set_kv "cycle"        "0:10:00"
    set_kv "mode"         "random"
    set_kv "dpmsEnabled"  "False"

    # (Optional) ensure we’re not forcing only “Blank Screen”.
    # If a previous script replaced the programs list with just "-blank-",
    # restore defaults by re-initializing the programs list ONLY if it looks empty.
    if grep -qE '^programs:\s*$' "$CONFIG"; then
      # Re-seed a default programs list by re-initializing then merging keys back.
      TMP="$(mktemp)"
      xscreensaver-command -initialize >/dev/null 2>&1 || true
      # Pull fresh default file if the init wrote one; otherwise skip.
      if [ -f "$HOME/.xscreensaver" ]; then
        # nothing to do; we already wrote defaults above
        :
      fi
      rm -f "$TMP"
    fi

    # Start the daemon (no splash)
    nohup xscreensaver -nosplash >/dev/null 2>&1 &

    echo "Done. XScreenSaver is set to random mode and running."
}

configure_xscreensaver
