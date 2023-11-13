#!/bin/bash

SESSIONID=$1
ADMIN_PATH=$2
HOST=$3
URL_PATHS=admin_paths.csv
SPRITE_HASH=e6c9bd7d
COOKIES=cookies.txt
VERSION=v5-2
SITE_NAME=static-wagtail-$VERSION

if [ -z "$ADMIN_PATH" ]; then
  ADMIN_PATH="/admin"
fi
if [ -z "$HOST" ]; then
  HOST="http://localhost:8000"
fi

touch $COOKIES
echo "localhost:8000	FALSE	/	FALSE	1711645349	sessionid	$SESSIONID" > $COOKIES


if [ "$ADMIN_PATH" = "/admin" ]; then
  wget --no-host-directories -P ./$SITE_NAME --mirror --load-cookies $COOKIES $HOST/
  wget --no-host-directories -P ./$SITE_NAME --mirror --load-cookies $COOKIES $HOST/search/?q=bread

  wget --no-host-directories -P ./$SITE_NAME --mirror $HOST$ADMIN_PATH/login/
  wget --no-host-directories -P ./$SITE_NAME --mirror $HOST$ADMIN_PATH/password_reset/
  wget --no-host-directories -P ./$SITE_NAME --mirror $HOST$ADMIN_PATH/password_reset/done/
else
  wget --no-host-directories -P ./$SITE_NAME --mirror --load-cookies $COOKIES $HOST$ADMIN_PATH/
fi

while IFS= read -r path; do
  FULL_URL="${HOST}${ADMIN_PATH}${path}"
  wget --no-host-directories -P ./$SITE_NAME --mirror --load-cookies $COOKIES $FULL_URL
done < $URL_PATHS

find ./$SITE_NAME -name "*export=xlsx*" | xargs rm
find ./$SITE_NAME -name "*export=csv*" | xargs rm

mkdir -p $SITE_NAME$ADMIN_PATH/sprite-$SPRITE_HASH/
wget -O $SITE_NAME$ADMIN_PATH/sprite-$SPRITE_HASH/index.html $HOST$ADMIN_PATH/sprite-$SPRITE_HASH/
rm -rf $SITE_NAME/static
cp -R bakerydemo/bakerydemo/collect_static $SITE_NAME/static
cp -R ../evergreen$ADMIN_PATH/api ./$SITE_NAME$ADMIN_PATH/api

cp -R ../evergreen/_redirects ./$SITE_NAME/_redirects
