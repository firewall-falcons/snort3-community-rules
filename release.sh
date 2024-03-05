set -e

STAT_FILE="${1-./dist/snort3-community.rules}"

MOD_STAMP=$(stat "$STAT_FILE" --format %Y)
DATE=$(date -d @$MOD_STAMP --iso-8601)

git add dist
git commit -m "chore: release dist for $DATE"
git tag -a "$DATE" -m "Mirrored from snort.org"
git push
git push --tags
