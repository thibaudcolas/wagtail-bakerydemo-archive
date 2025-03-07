#!/bin/bash

SESSIONID=$1
ADMIN_PATH=$2
HOST=$3
MIRROR_PATHS=$4
EXTRA_PATHS=$5
COOKIES=cookies.txt
VERSION=v6-4
SITE_NAME=static-wagtail-$VERSION

if [ -z "$ADMIN_PATH" ]; then
  ADMIN_PATH="/admin"
fi
if [ -z "$HOST" ]; then
  HOST="http://localhost:8000"
fi
if [ -z "$MIRROR_PATHS" ]; then
  MIRROR_PATHS="mirror_paths.csv"
fi
if [ -z "$EXTRA_PATHS" ]; then
  EXTRA_PATHS="extra_paths.csv"
fi

touch $COOKIES
echo "localhost:8000	FALSE	/	FALSE	1745303695	sessionid	$SESSIONID" > $COOKIES


if [ "$ADMIN_PATH" = "/admin" ]; then
  wget --no-host-directories -P ./$SITE_NAME --mirror --load-cookies $COOKIES $HOST/
  wget --no-host-directories -P ./$SITE_NAME --mirror --mirror --level=1 --load-cookies $COOKIES $HOST/search/?q=bread

  wget --no-host-directories -P ./$SITE_NAME --mirror --level=1 $HOST$ADMIN_PATH/login/
  wget --no-host-directories -P ./$SITE_NAME --mirror --level=1 $HOST$ADMIN_PATH/password_reset/
  wget --no-host-directories -P ./$SITE_NAME --mirror --level=1 $HOST$ADMIN_PATH/password_reset/done/
else
  wget --no-host-directories -P ./$SITE_NAME --mirror --load-cookies $COOKIES $HOST$ADMIN_PATH/
fi

while IFS= read -r path; do
  FULL_URL="${HOST}${ADMIN_PATH}${path}"
  wget --no-host-directories -P ./$SITE_NAME --mirror --load-cookies $COOKIES $FULL_URL
done < $MIRROR_PATHS

while IFS= read -r path; do
  FULL_URL="${HOST}${ADMIN_PATH}${path}"
  # No mirror.
  wget --no-host-directories -P ./$SITE_NAME --mirror --level=1 --load-cookies $COOKIES $FULL_URL
done < $EXTRA_PATHS

# Finish with this to reset the dashboard and avoid a "no permissions message".
wget --no-host-directories -P ./$SITE_NAME --load-cookies $COOKIES $HOST/

find ./$SITE_NAME -name "*export=xlsx*" | xargs rm
find ./$SITE_NAME -name "*export=csv*" | xargs rm

for i in `find $SITE_NAME -type f -name "*\?*"`; do mv $i `echo $i | cut -d '?' -f1`; done
rename 's/index.html\?id=blockdef-//g' $SITE_NAME$ADMIN_PATH/block-preview/*.html

rm -rf .$ADMIN_PATH/pages/*/edit/preview/

rm -rf $SITE_NAME/static
cp -R bakerydemo/bakerydemo/collect_static $SITE_NAME/static
rm -rf $SITE_NAME/static/admin
rm -rf $SITE_NAME/static/rest_framework
rm $SITE_NAME/media/images/*.webp
cp -R ../evergreen$ADMIN_PATH/api ./$SITE_NAME$ADMIN_PATH/api

cp -R ../evergreen/_redirects ./$SITE_NAME/_redirects
cp ../evergreen/netlify.toml ./$SITE_NAME/netlify.toml

echo "netlify deploy --site $SITE_NAME --dir $SITE_NAME --prod"
