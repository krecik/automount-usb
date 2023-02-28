#!/usr/bin/env bash
# If you are executing this script in cron with a restricted environment,
# modify the shebang to specify appropriate path; /bin/bash in most distros.
# And, also if you aren't comfortable using(abuse?) env command.
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"

# Just a best effort
rm -f /usr/local/bin/scsi-mount.sh

# Systemd unit file for scsi automount/unmount 
rm -f /etc/systemd/system/scsi-mount@.service

# Remove the track files
rm -f /var/log/scsi-mount.track*

# Remove udev rule
unlink /etc/udev/rules.d/99-scsi-automount.rules

systemctl daemon-reload
udevadm control --reload-rules
