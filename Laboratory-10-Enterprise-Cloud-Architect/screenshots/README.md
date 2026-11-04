# Screenshots

Evidence for each Mission 10 requirement. Save images here with these names:

| File | Shows |
|------|-------|
| `01-virtualbox-vm-settings.png` | VM resources and port-forwarding rules |
| `02-docker-version.png` | `docker --version` and `docker compose version` |
| `03-compose-ps.png` | Both containers Up, database healthy |
| `04-wordpress-browser.png` | Site opened from the host browser |
| `05-persistence-after-reboot.png` | Test post still present after VM reboot |
| `06-ufw-status.png` | `sudo ufw status verbose` |
| `07-db-not-exposed.png` | `docker port cloudnova-db` prints nothing |
| `08-backup-run.png` | Script output and backup files |
| `09-crontab.png` | `sudo crontab -l` |
| `10-restore-drill.png` | Deleted post restored from backup |
