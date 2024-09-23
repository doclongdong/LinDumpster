


A script for locking the screen automatically at certain intervals when outside an allowed usage window for a linux device. Will also send an notification to all users that they will be locked soon.


Works with GNOME 3 (Version 46)

A crontab should be made for the root user to run this script every X interval e.g., 

```
0,30 * * * * python3 /path/to/screentime.py
```

Should work without a virtualenv


will lock screen for all users



notify-send-all from https://gist.github.com/Thrilleratplay/aa8d6e2b8ee4c4a939d109743e07171c
