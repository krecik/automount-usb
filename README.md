### Automount SCSI drives with systemd

_This is a dirty solution; but works. A good approach would be to use 
__libudev__._


On inserting an SCSI drive, automounts the drive at /mnt/ as a
directory named by device label; just the device name if label is
empty: /mnt/tank-001

Tracks the list of mounted drives in /var/log/scsi-mount.track.

Logs the actions in /var/log/messages with tag 'scsi-mount.sh'

Please do not expect it to perfectly handle all your needs.
Be warned, minimally tested; okay for temporary plug-ins but certainly
not recommended for enclosures with longer TTL.

**To setup, run `CONFIGURE.sh` with sudo or as root; `REMOVE.sh` to undo the
setup.**
