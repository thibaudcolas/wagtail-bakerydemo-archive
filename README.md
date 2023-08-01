# Wagtail bakerydemo archive

Static snapshots of Wagtail’s bakerydemo across [past versions](https://github.com/wagtail/wagtail/wiki/release-schedule) of the CMS.

- [v5.1](https://static-wagtail-v5-0.netlify.app/): 2023-08-01
- [v5.0](https://static-wagtail-v5-0.netlify.app/): 2023-05-02
- [v4.2](https://static-wagtail-v4-2.netlify.app/): 2023-02-01
- [v4.1](https://static-wagtail-v4-1.netlify.app/): 2022-11-01
- [v4.0](https://static-wagtail-v4-0.netlify.app/): 2022-08-31
- [v3.0](https://static-wagtail-v3-0.netlify.app/): 2022-05-16
- [v2.16](https://static-wagtail-v2-16.netlify.app/): 2022-02-07

## Supported features

Due to the snapshots being static, there are a few clear limitations:

- Content / data is not editable. Form fields can be updated, but saving the changes won’t work.
- Parts of the CMS relying on API calls only show their most basic functionality, such as:
  - Choosers
  - Page explorer
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
virtualenv -p python3.9 venv
source venv/bin/activate
pip install -r requirements.txt
./manage.py migrate
./manage.py load_initial_data
./manage.py collectstatic
./manage.py runserver 0:8009
```

Then prepare the backup,

```bash
cd v4.2
cp ../v4.1/cookies.txt .
# Edit the cookies.txt with the correct sessionid from browser DevTools.
vim cookies.txt
cp ../v4.1/backup.sh .
# Edit the backup.sh with the correct sprite URL from browser DevTools (`localStorage.getItem('wagtail:spriteRevision')`).
# Also make sure to use the correct folder name.
vim backup.sh
bash backup.sh
```

The last step of the backup script is to copy API response payloads, and set up redirects in Netlify so the right payload is served based on query parameter. This is only needed for the page explorer – other parts of the CMS will work with any static files server.
