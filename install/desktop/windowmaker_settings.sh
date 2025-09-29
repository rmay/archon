#!/usr/bin/env bash

MENU_DIR="$HOME/GNUstep/Defaults"
mkdir -p "$MENU_DIR"

echo "Creating default dock configuration..."
    
# Create WMDock configuration with default applications
cat > "$HOME/GNUstep/Defaults/WMState.default" << 'EOF'
{
  Dock = {
    Applications800 = (
      {
        Forced = No;
        Name = Logo.WMDock;
        BuggyApplication = No;
        AutoLaunch = No;
        Position = "0,0";
        Lock = No;
        Command = "/usr/bin/WPrefs";
      },
      {
        Forced = No;
        Name = wmclock.WMClock;
        DropCommand = "wmclock %d";
        BuggyApplication = No;
        AutoLaunch = Yes;
        Position = "0,2";
        Lock = No;
        PasteCommand = "wmclock %s";
        Command = "wmclock -12";
      },
      {
        Forced = No;
        Name = wmcpuload.DockApp;
        DropCommand = "wmcpuload %d";
        BuggyApplication = No;
        AutoLaunch = Yes;
        Position = "0,1";
        Lock = No;
        PasteCommand = "wmcpuload %s";
        Command = wmcpuload;
      },
      {
        Forced = No;
        Name = wmsystemtray0.wmsystemtray;
        DropCommand = "wmsystemtray %d";
        BuggyApplication = No;
        AutoLaunch = Yes;
        Position = "0,3";
        Lock = No;
        PasteCommand = "wmsystemtray %s";
        Command = wmsystemtray;
      }
    );
    AutoRaiseLower = No;
    Applications = (
      {
        Forced = No;
        Name = Logo.WMDock;
        BuggyApplication = No;
        AutoLaunch = No;
        Position = "0,0";
        Lock = No;
        Command = "/usr/bin/WPrefs";
      },
      {
        Forced = No;
        Name = wmclock.WMClock;
        DropCommand = "wmclock %d";
        BuggyApplication = No;
        AutoLaunch = Yes;
        Position = "0,2";
        Lock = No;
        PasteCommand = "wmclock %s";
        Command = "wmclock -12";
      },
      {
        Forced = No;
        Name = wmcpuload.DockApp;
        DropCommand = "wmcpuload %d";
        BuggyApplication = No;
        AutoLaunch = Yes;
        Position = "0,1";
        Lock = No;
        PasteCommand = "wmcpuload %s";
        Command = wmcpuload;
      },
      {
        Forced = No;
        Name = wmsystemtray0.wmsystemtray;
        DropCommand = "wmsystemtray %d";
        BuggyApplication = No;
        AutoLaunch = Yes;
        Position = "0,3";
        Lock = No;
        PasteCommand = "wmsystemtray %s";
        Command = wmsystemtray;
      }
    );
    Lowered = Yes;
    Position = "1216,0";
  };
  Clip = {
    Forced = No;
    Name = Logo.WMClip;
    BuggyApplication = No;
    AutoLaunch = No;
    Position = "0,0";
    Lock = No;
    Command = "-";
  };
  Applications = ();
  Drawers = ();
  Workspaces = (
    {
      Clip = {
        AutoRaiseLower = No;
        AutoCollapse = No;
        Applications = ();
        Collapsed = No;
        AutoAttractIcons = No;
        Lowered = Yes;
      };
      Name = Main;
    },
    {
      Clip = {
        AutoRaiseLower = No;
        AutoCollapse = No;
        Applications = ();
        Collapsed = No;
        AutoAttractIcons = No;
        Lowered = Yes;
      };
      Name = Programming;
    },
    {
      Clip = {
        AutoRaiseLower = No;
        AutoCollapse = No;
        Applications = ();
        Collapsed = No;
        AutoAttractIcons = No;
        Lowered = Yes;
      };
      Name = Productivity;
    },
    {
      Clip = {
        AutoRaiseLower = No;
        AutoCollapse = No;
        Applications = ();
        Collapsed = No;
        AutoAttractIcons = No;
        Lowered = Yes;
      };
      Name = Media;
    }
  );
  Workspace = Main;
}
EOF


if [ ! -f "$HOME/GNUstep/Defaults/WMState" ]; then
  cp "$HOME/GNUstep/Defaults/WMState.default" "$HOME/GNUstep/Defaults/WMState"
fi

if [ ! -f "$HOME/GNUstep/Defaults/WMWindowAttributes" ]; then
  cat > "$HOME/GNUstep/Defaults/WMWindowAttributes" << "EOF"

EOF
fi

echo "Dock configuration created"


# Create Window Maker preferences
echo "Creating Window Maker preferences..."

if [ ! -f "$HOME/GNUstep/Defaults/WindowMaker" ]; then

cat > "$HOME/GNUstep/Defaults/WindowMaker" << 'EOF'
{
  FrameBorderColor = "#000000";
  FTitleColor = "#ffffff";
  KeepDockOnPrimaryHead = YES;
  CenterKey = None;
  IconTitleColor = "#ffffff";
  MoveTo6to12Head = None;
  DbClickFullScreen = NO;
  DoubleClickTilebar = Shade;
  WindowSnapping = No;
  FrameFocusedBorderColor = "#000000";
  OpenTransientOnOwnerWorkspace = YES;
  CloseRootMenuByLeftOrRightMouseClick = YES;
  FrameSelectedBorderColor = "#ffffff";
  HotCornerDelay = 250;
  AntialiasedText = YES;
  MouseWheelAction = SwitchWorkspaces;
  HighlightColor = "#ffffff";
  CClipTitleColor = "#616161";
  IconPath = (
    "~/GNUstep/Library/WindowMaker/CachedPixmaps",
    "/usr/share/WindowMaker/Icons",
    "/usr/share/WindowMaker/Pixmaps",
    "/usr/share/pixmaps"
  );
  CirculateRaise = YES;
  DontLinkWorkspaces = NO;
  MenuDisabledColor = "#7f7f7f";
  IconTitleBack = "#000000";
  HotCornerEdge = 2;
  MenuTitleColor = "#ffffff";
  HotCorners = NO;
  EnableWorkspacePager = YES;
  NoWindowOverDock = YES;
  HighlightTextColor = "#000000";
  EnforceIconMargin = NO;
  AutoArrangeIcons = YES;
  ClipTitleColor = "#000000";
  MoveTo12to6Head = None;
  HotCornerActions = (None, None, None, None);
  WindowTitleFont = "CaskaydiaMono Nerd Font:slant=0:weight=80:width=100:pixelsize=13";
  KbdModeLock = NO;
  Workspace1Key = "Mod4+1";
  Workspace2Key = "Mod4+2";
  Workspace3Key = "Mod4+3";
  Workspace4Key = "Mod4+4";
  MoveToWorkspace1Key = "Control+Mod4+1";
  MoveToWorkspace2Key = "Control+Mod4+2";
  MoveToWorkspace3Key = "Control+Mod4+3";
  MoveToWorkspace4Key = "Control+Mod4+4";
  ToggleKbdModeKey = None;
  RaiseAppIconsWhenBouncing = YES;
  WindowPlacement = smart;
  CycleWorkspaces = YES;
  OpaqueMoveResizeKeyboard = YES;
  MenuTextColor = "#000000";
  WrapMenus = YES;
  UTitleColor = "#000000";
  ViKeyMenus = YES;
  PTitleColor = "#ffffff";
  LHMaximizeKey = "Mod4+Left";
  RHMaximizeKey = "Mod4+Right";
  MaximizeKey = "Mod4+Up";
}
EOF
fi

echo "Window Maker preferences created"

# Create basic Window Maker menu configuration
cat > "$MENU_DIR/WMRootMenu.default" << 'EOF'
(
  "ARCHON",
  (Run..., EXEC, "%a(Run,Type command to run:)"),
  (Terminals, ("Archon Terminal", EXEC, "archon-terminal"), (Ghostty, EXEC, ghostty), (Alacritty, EXEC, alacritty), (xterm, EXEC, xterm), (st, EXEC, st)),
  (Browsers, (Brave, EXEC, brave), (Chromium, EXEC, chromium)),
  ("File Managers", (Nautilus, EXEC, "nautilus --no-desktop"), (Thunar, EXEC, "thunar"), (Ranger, EXEC, "archon-terminal -e ranger")),
  (Development, 
    (VSCode, EXEC, code),
    (Neovim, EXEC, "archon-terminal -e nvim"),
    ("Doom Emacs", EXEC, "emacs"),
    (gVIM, EXEC, gvim), 
    ("Terminal VIM", EXEC, "archon-terminal -e vim"), 
    (xev, EXEC, "archon-terminal -e xev")
  ),
  (
    Productivity,
    (Office,
      ("LibreOffice Writer", EXEC, lowriter),
      ("LibreOffice Calc", EXEC, localc),
      ("LibreOffice Draw", EXEC, lodraw),
      ("LibreOffice Impress", EXEC, loimpress),
      ("LibreOffice Math", EXEC, lomath),
      ("LibreOffice Base", EXEC, lobase),
      ("LibreOffice Web", EXEC, loweb),
      (LibreOffice, EXEC, libreoffice)),
    (Viewers, (Evince, EXEC, evince), (Xpdf, EXEC, xpdf)),
    (Loqseq, EXEC, logseq),
    (Nextcloud, EXEC, nextcloud)  
  ),
  (
    Utils,
    (Graphics, (GIMP, EXEC, gimp)),
    (Multimedia, (VLC, EXEC, vlc), (mpv, EXEC, "mpv --player-operation-mode=pseudo-gui -- %U")),
    (System, ("CPU Load", EXEC, wmcpuload), (btop, EXEC, "archon-terminal -e btop"),("System Console", EXEC, "archon-terminal -e journalctl -f &")),
    (Docker, EXEC, "archon-terminal -e lazydocker"),
    ("Time & Date", EXEC, wmclock),
    (Magnify, EXEC, wmagnify),
    (Calculator, EXEC, xcalc),
    ("Volume Control", EXEC, pavucontrol),
    ("Screenshot", EXEC, "archon-terminal -e flameshot gui"),
    ("XScreensaver", EXEC, "xscreensaver-settings"),
    ("Kill X Application", EXEC, xkill)
  ),
  (Workspaces, WORKSPACE_MENU),
  (
    Workspace,
    ("Hide Others", HIDE_OTHERS),
    ("Show All", SHOW_ALL),
    ("Arrange Icons", ARRANGE_ICONS)
  ),
  (Appearance, OPEN_MENU, appearance.menu),
  (
    Info,
    ("Info Panel", INFO_PANEL),
    (Legal, LEGAL_PANEL),
    ("Manual Browser", EXEC, xman),
    ("About", EXEC, "archon-terminal --class=About --title=About -e bash -c 'fastfetch; read -n 1 -s'")
  ),
  (
    Session,
    ("Save Session", SAVE_SESSION),
    ("Clear Session", CLEAR_SESSION),
    ("Restart Window Maker", RESTART),
    (Lock, EXEC, "xlock -allowroot -usefirst"),
    ("Reboot", EXEC, "systemctl reboot"),
    ("Shutdown", EXEC, "systemctl poweroff"),
    (Exit, EXIT)
  )
)
EOF

if [ ! -f "$HOME/GNUstep/Defaults/WMRootMenu" ]; then
  cp "$MENU_DIR/WMRootMenu.default" "$MENU_DIR/WMRootMenu"
fi

echo "Window Maker menu created"

echo "Setting up xbindkeys"
yay -S --noconfirm --needed xbindkeys

if [ ! -f "$HOME/.xbindkeysrc" ]; then
cat > "$HOME/.xbindkeysrc" << 'EOF'
# Arhcon terminal
"archon-terminal"
  Mod4 + Return

# Archon dmenu launcher
"archon_dmenu_run"
  Mod4 + grave

# Archon rofi launcher
"rofi -show run"
  Mod4 + space

# X terminal
"xterm"
  Shift + Mod4 + Return

# PrintScreen → region screenshot
"flameshot gui"
    Alt + F10

# Shift+PrintScreen → full screen
"flameshot full -p ~/Pictures"
    Alt + F11

# Ctrl+PrintScreen → active window
"flameshot screen -p ~/Pictures"
    Alt + F12
EOF
fi
echo "xbindkeys done"