# Wagtail bakerydemo archive

Static snapshots of Wagtail’s bakerydemo across [past versions](https://github.com/wagtail/wagtail/wiki/release-schedule) of the CMS.

- [v6.3](https://static-wagtail-v6-3.netlify.app/): 2024-11-01
  - [v6.3 admin in dark mode](https://static-wagtail-v6-3.netlify.app/admin-dark/)
  - [v6.3 admin in prefers-contrast mode](https://static-wagtail-v6-3.netlify.app/admin-contrast/)
  - [v6.3 admin in Arabic](https://static-wagtail-v6-3.netlify.app/admin-arabic/)
  - [v6.3 admin in German](https://static-wagtail-v6-3.netlify.app/admin-german/)
  - [v6.3 admin for non-admin user](https://static-wagtail-v6-3.netlify.app/admin-editor/)
- [v6.2](https://static-wagtail-v6-2.netlify.app/): 2024-08-01
  - [v6.2 admin in dark mode](https://static-wagtail-v6-2.netlify.app/admin-dark/)
  - [v6.2 admin in Arabic](https://static-wagtail-v6-2.netlify.app/admin-arabic/)
  - [v6.2 admin in German](https://static-wagtail-v6-2.netlify.app/admin-german/)
- [v6.1](https://static-wagtail-v6-1.netlify.app/): 2024-05-01
  - [v6.1 admin in dark mode](https://static-wagtail-v6-1.netlify.app/admin-dark/)
  - [v6.1 admin in Arabic](https://static-wagtail-v6-1.netlify.app/admin-arabic/)
  - [v6.1 admin in German](https://static-wagtail-v6-1.netlify.app/admin-german/)
  - [v6.1 admin for non-admin user](https://static-wagtail-v6-1.netlify.app/admin-editor/)
- [v6.0](https://static-wagtail-v6-0.netlify.app/): 2024-02-07
- [v5.2](https://static-wagtail-v5-2.netlify.app/): 2023-11-01
  - [v5.2 admin in dark mode](https://static-wagtail-v5-2.netlify.app/admin-dark/)
  - [v5.2 admin in Arabic](https://static-wagtail-v5-2.netlify.app/admin-arabic/)
  - [v5.2 admin in German](https://static-wagtail-v5-2.netlify.app/admin-german/)
  - [v5.2 admin for non-admin user](https://static-wagtail-v5-2.netlify.app/admin-editor/)
- [v5.1](https://static-wagtail-v5-1.netlify.app/): 2023-08-01
  - [v5.1 admin in dark mode](https://static-wagtail-v5-1.netlify.app/admin-dark/)
  - [v5.1 admin in Arabic](https://static-wagtail-v5-1.netlify.app/admin-arabic/)
  - [v5.1 admin in German](https://static-wagtail-v5-1.netlify.app/admin-german/)
  - [v5.1 admin for non-admin user](https://static-wagtail-v5-1.netlify.app/admin-editor/)
- [v5.0](https://static-wagtail-v5-0.netlify.app/): 2023-05-02
- [v4.2](https://static-wagtail-v4-2.netlify.app/): 2023-02-01
- [v4.1](https://static-wagtail-v4-1.netlify.app/): 2022-11-01
- [v4.0](https://static-wagtail-v4-0.netlify.app/): 2022-08-31
- [v3.0](https://static-wagtail-v3-0.netlify.app/): 2022-05-16
- [v2.16](https://static-wagtail-v2-16.netlify.app/): 2022-02-07
- [v2.0](https://static-wagtail-v2-0.netlify.app/): 2018-02-28

## Supported features

Due to the snapshots being static, there are a few clear limitations:

- Content / data is not editable. Form fields can be updated, but saving the changes won’t work.
- Parts of the CMS relying on API calls only show their most basic functionality, such as:
  - Choosers
  - Live previews

## Creating a new snapshot

First get a new bakerydemo copy set up:

```bash
mkdir v4.2
cd v4.2
git clone git@github.com:wagtail/bakerydemo.git
cd bakerydemo
# Remove the bakerydemodb from the list.
vim .gitignore
# Edit the wagtail requirement to target the desired version.
# Depending on the selected version, you may also need to switch to a specific commit of the bakerydemo, or make arbitrary changes to the code.
vim requirements/base.txt
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
./manage.py migrate
./manage.py load_initial_data
./manage.py collectstatic
./manage.py runserver 0:8000
```

Then prepare the backup,

```bash
cd v4.2
cp ../evergreen/backup.sh .
# Edit the backup.sh with the correct sprite URL from browser DevTools (`localStorage.getItem('wagtail:spriteRevision')`).
# Also make sure to use the correct folder name.
vim backup.sh
bash backup.sh
# See which files are taking up a lot of place.
cd folder with the backed up files.
du -h admin-*/*/* | sort -h
rm media/images/*.{original.jpg,webp}
```

The last step of the backup script is to copy API response payloads, and set up redirects in Netlify so the right payload is served based on query parameter. This is only needed for the page explorer – other parts of the CMS will work with any static files server.
