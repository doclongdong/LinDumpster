Objective: Create desktop application (ie, shows up in the search, cna be put on taskbar etc) from a web URL. Works on GNOME3 (V46)


# Step 1: Create .desktop file

```
[Desktop Entry]
Comment=Open Notion
Terminal=false
Name=Notion
Exec=firefox notion.so
Type=Application
Icon=notion.png
NoDisplay=false
```

Put this desktop file in `~/.local/share/applications`. 

# Step 2: Download icon and put in correct dir 

Put the icon in `~/.local/share/icons` (create folder if it does not exist) and make sure the name (eg `notion.png`) matches the filename in the .desktop file.
You may also be able to use a full path but I have not tried it

