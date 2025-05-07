#!/bin/bash

# Named arguments.
while [ $# -gt 0 ]; do
  if [[ $1 == *"--"* ]]; then
    v="${1/--/}"
    declare $v="$2"
  fi
  shift
done

if [ -z "$version" ]; then version=7.0; fi
if [ -z "$user" ]; then user=admin; fi
if [ -z "$origin" ]; then origin=http://localhost:8000; fi
if [ -z "$path" ]; then path=/admin; fi
if [ -z "$mirror" ]; then mirror=mirror_paths.csv; fi
if [ -z "$extra" ]; then extra=extra_paths.csv; fi
if [ -z "$site" ]; then site=static-wagtail-v7-0; fi


if [ "$path" = "/admin" ]; then
  wget --no-verbose --no-host-directories -P $site --mirror  --header="X-Auto-Login: $user" $origin/
  wget --no-verbose --no-host-directories -P $site --mirror --level=1  --header="X-Auto-Login: $user" $origin/search/?q=bread

  wget --no-verbose --no-host-directories -P $site --mirror --level=1 $origin$path/login/
  wget --no-verbose --no-host-directories -P $site --mirror --level=1 $origin$path/password_reset/
  wget --no-verbose --no-host-directories -P $site --mirror --level=1 $origin$path/password_reset/done/
else
  wget --no-verbose --no-host-directories -P $site --mirror  --header="X-Auto-Login: $user" $origin$path/
fi

while IFS= read -r p; do
  full_url="${origin}${path}${p}"
  wget --no-verbose --no-host-directories -P $site --mirror  --header="X-Auto-Login: $user" $full_url
done < $mirror

while IFS= read -r p; do
  full_url="${origin}${path}${p}"
  # No mirror.
  wget --no-verbose --no-host-directories -P $site --mirror --level=1  --header="X-Auto-Login: $user" $full_url
done < $extra

# Finish with this to reset the dashboard and avoid a "no permissions message".
# wget --no-verbose --no-host-directories -P $site  --header="X-Auto-Login: $user" $origin$path/

find ./$site -name "*export=xlsx*" | xargs rm
find ./$site -name "*export=csv*" | xargs rm

for i in `find $site -type f -name "*\?*"`; do mv $i `echo $i | cut -d '?' -f1`; done
rename 's/index.html\?id=blockdef-//g' $site$path/block-preview/*.html

rm -rf $site/static
cp -R bakerydemo/bakerydemo/collect_static $site/static
rm -rf $site/static/admin
rm -rf $site/static/rest_framework
rm -rf $site/static/django_extensions
rm -rf $site/static/table_block/js/vendor/handsontable-6.2.2.full.min.js
rm -rf $site/$path/pages/*/edit/preview
rm $site/media/images/*.webp
rm $site/media/images/*.original.*
cp -R ../evergreen$path/api ./$site$path/api

if [ "$path" = "/admin" ]; then
  cp -R ../evergreen/_redirects ./$site/_redirects
  cp -R ../evergreen/netlify ./$site/netlify
  cp ../evergreen/netlify.toml ./$site/netlify.toml
fi

echo "netlify deploy --site $site --dir $site --prod"

