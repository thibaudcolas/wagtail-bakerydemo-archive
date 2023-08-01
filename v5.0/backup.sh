wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/account/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/base/people/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/base/footertext/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/breads/breadingredient/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/breads/breadtype/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/breads/country/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/pages/search/?q=test
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/pages/search/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/reports/locked/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/reports/workflows/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/reports/workflow/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/reports/workflow_task/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/reports/workflow_tasks/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/reports/site-history/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/reports/aging-pages/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/forms/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/workflows/list/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/workflows/edit/1/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/workflows/disable/1/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/workflows/tasks/index/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/workflows/tasks/edit/1/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/workflows/tasks/disable/1/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/workflows/tasks/users/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/users/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/groups/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/locales/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/collections/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/redirects/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/searchpicks/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/sites/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/styleguide/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/snippets/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/images/chooser/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/pages/68/privacy/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/choose-page/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/documents/chooser/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/embeds/chooser/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/snippets/choose/base/people/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/search/queries/chooser/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/workflows/task_chooser/
wget --no-host-directories -P ./static-wagtail-v5-0 --mirror --load-cookies cookies.txt http://localhost:8000/admin/pages/62/edit/preview/
# Keep all **three** sprite hash references up-to-date
mkdir -p static-wagtail-v5-0/admin/sprite-fa0a1bb8/
wget -O static-wagtail-v5-0/admin/sprite-fa0a1bb8/index.html http://localhost:8000/admin/sprite-fa0a1bb8/
rm -rf static-wagtail-v5-0/static
cp -R bakerydemo/bakerydemo/collect_static static-wagtail-v5-0/static
cp -R ../evergreen/api ./static-wagtail-v5-0/admin/api
cp -R ../evergreen/_redirects ./static-wagtail-v5-0/_redirects
