#!/usr/bin/env bash
# If you are executing this script in cron with a restricted environment,
# modify the shebang to specify appropriate path; /bin/bash in most distros.
# And, also if you aren't comfortable using(abuse?) env command.
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"
chmod 755 ./*.sh

cp ./scsi-mount.sh /usr/local/bin/

# Systemd unit file for scsi automount/unmount 
cp ./scsi-mount@.service /etc/systemd/system/scsi-mount@.service

# Create udev rule to start/stop scsi-mount@.service on hotplug/unplug
cat ./99-local.rules.scsi-mount >> /etc/udev/rules.d/99-local.rules

systemctl daemon-reload
udevadm control --reload-rules
