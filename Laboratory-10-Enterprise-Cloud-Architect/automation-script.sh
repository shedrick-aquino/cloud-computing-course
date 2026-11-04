#!/usr/bin/env bash
# ==========================================================
# CloudNova Technologies - automation-script.sh
# Purpose : Automated health check + disaster-recovery backup
#   1. Health check: restarts any stopped container
#   2. Dumps the MariaDB database (.sql.gz)
#   3. Archives the WordPress files volume (.tar.gz)
#   4. Deletes backups older than RETENTION_DAYS (7)
#   5. Warns when disk usage reaches DISK_WARN_PERCENT (80%)
# Every step is logged to /var/log/cloudnova-backup.log
# Schedule: cron, 0 2 * * * (daily 02:00) - see operational-manual.md
# ==========================================================
set -euo pipefail

# ---------- Settings (edit if needed) ----------
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
DB_CONTAINER="cloudnova-db"
WP_CONTAINER="cloudnova-wp"
WP_VOLUME="cloudnova_wp_data"
BACKUP_DIR="/opt/cloudnova/backups"
LOG_FILE="/var/log/cloudnova-backup.log"
RETENTION_DAYS=7
DISK_WARN_PERCENT=80
TIMESTAMP="$(date +%Y-%m-%d_%H-%M-%S)"

# ---------- Helper: write a log line ----------
log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# ---------- Must run as root (cron as root / sudo) ----------
if [[ $EUID -ne 0 ]]; then
  echo "Please run as root: sudo $0"
  exit 1
fi

mkdir -p "$BACKUP_DIR"
log "===== Backup job started ====="

# ---------- 1. Health check ----------
for c in "$DB_CONTAINER" "$WP_CONTAINER"; do
  state="$(docker inspect -f '{{.State.Status}}' "$c" 2>/dev/null || echo missing)"
  if [[ "$state" != "running" ]]; then
    log "WARNING: $c is '$state'. Trying to start it..."
    if docker start "$c" >/dev/null 2>&1; then
      log "Started $c"
    else
      log "ERROR: could not start $c"
    fi
  else
    log "OK: $c is running"
  fi
done

# ---------- 2. Database backup ----------
DB_FILE="$BACKUP_DIR/db_${TIMESTAMP}.sql.gz"
DUMP_CMD='exec mariadb-dump --all-databases --single-transaction'
DUMP_CMD+=' -uroot -p"$MARIADB_ROOT_PASSWORD"'
if docker exec "$DB_CONTAINER" sh -c "$DUMP_CMD" | gzip > "$DB_FILE"; then
  log "OK: database saved to $DB_FILE ($(du -h "$DB_FILE" | cut -f1))"
else
  log "ERROR: database backup FAILED"
  rm -f "$DB_FILE"
  exit 1
fi

# ---------- 3. WordPress files backup ----------
WP_FILE="wp_${TIMESTAMP}.tar.gz"
if docker run --rm -v "${WP_VOLUME}:/data:ro" -v "${BACKUP_DIR}:/backup" \
     alpine tar czf "/backup/${WP_FILE}" -C /data . ; then
  log "OK: WordPress files saved to $BACKUP_DIR/$WP_FILE"
else
  log "ERROR: WordPress files backup FAILED"
fi

# ---------- 4. Retention (delete old backups) ----------
deleted="$(find "$BACKUP_DIR" -type f \
  \( -name '*.sql.gz' -o -name '*.tar.gz' \) \
  -mtime +"$RETENTION_DAYS" -print -delete | wc -l)"
log "Cleanup: removed $deleted backup(s) older than $RETENTION_DAYS days"

# ---------- 5. Disk space check ----------
used="$(df --output=pcent / | tail -1 | tr -dc '0-9')"
if (( used >= DISK_WARN_PERCENT )); then
  log "WARNING: disk usage is ${used}% (limit ${DISK_WARN_PERCENT}%)"
else
  log "OK: disk usage is ${used}%"
fi

log "===== Backup job finished ====="
exit 0
