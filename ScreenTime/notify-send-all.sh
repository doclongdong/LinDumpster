#!/usr/bin/env bash

# Send notification to all users. Useful for sending notifications
# from scripts that are run as root.
#
# EXAMPLES:
#
# $> notify-everyone.sh 'Hello!'
#
# $> notify-everyone.sh 'No running by the pool' --icon=dialog-warning
#
# $> notify-everyone.sh 'This text in bold' 'You failed to fail successfully' --icon=dialog-error
#
# Sources:
#
# https://gist.github.com/Thrilleratplay/aa8d6e2b8ee4c4a939d109743e07171c
# https://stackoverflow.com/questions/28195805/running-notify-send-as-root/49533938#49533938
# https://forums.bunsenlabs.org/viewtopic.php?id=2685


function notify-everyone() {
  local display type user uid sessions

  # list of open senssions
  sessions=$(loginctl --no-legend list-sessions | sed -e 's/^ *//g'| cut -f1 -d " ")

  for sessionid in $sessions;
  do
    type=$(loginctl --property Type --value show-session "$sessionid")
    user=$(loginctl --property Name --value show-session "$sessionid");
    if [[ "$type" = 'x11' || "$type" = 'wayland' ]]; then
      # determine username, uid and display the used by user
      uid=$(loginctl --property User --value show-session "$sessionid");
      display=$(loginctl --property Display --value show-session "$sessionid");

      # display notification to that user
      sudo -u "$user" DISPLAY="$display" DBUS_SESSION_BUS_ADDRESS=unix:path="/run/user/$uid/bus" notify-send "$@"
    else
        # write in user tty
        echo "$@" | write "$user"
    fi
  done
}

notify-everyone "$@"

