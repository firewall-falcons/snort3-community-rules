set -e

BASE_URL="https://www.snort.org/downloads/community" # no trailing slash
FILE_NAME="snort3-community-rules.tar.gz"
OUT="$(realpath ${1:-./dist})" # $1 or default to ./dist

mkdir -p "$OUT"

cd "$(mktemp -d /tmp/s3cr.XXXXXX)"
wget "$BASE_URL/$FILE_NAME"
curl "$BASE_URL/md5s" | grep "$FILE_NAME" > "$FILE_NAME.md5"

if md5sum -c "$FILE_NAME.md5"; then
	echo "Hash matched!"
	rm -rf "$OUT/*"
	tar xvf "$FILE_NAME" --strip-components=1 -C "$OUT"
	echo "Successfully updated $OUT folder"
else
	echo "ERROR: HASHES DID NOT MATCH!"
fi

TMP="$(pwd)"
cd /
rm -rf $TMP
