wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/account/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/base/people/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/base/footertext/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/breads/breadingredient/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/breads/breadtype/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/breads/country/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/pages/search/?q=test
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/pages/search/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/reports/locked/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/reports/workflows/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/reports/workflow/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/reports/workflow_task/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/reports/workflow_tasks/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/reports/site-history/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/reports/aging-pages/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/forms/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/workflows/list/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/workflows/edit/1/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/workflows/disable/1/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/workflows/tasks/index/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/workflows/tasks/edit/1/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/workflows/tasks/disable/1/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/workflows/tasks/users/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/users/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/groups/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/locales/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/collections/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/redirects/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/searchpicks/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/sites/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/snippets/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/images/chooser/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/pages/68/privacy/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/choose-page/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/documents/chooser/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/embeds/chooser/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/snippets/choose/base/people/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/search/queries/chooser/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/workflows/task_chooser/
wget --no-host-directories -P ./static-wagtail-dark-theme-playground --mirror --load-cookies cookies.txt http://localhost:8009/admin/pages/62/edit/preview/
mkdir -p static-wagtail-dark-theme-playground/admin/sprite-2e07ce56/
wget -O static-wagtail-dark-theme-playground/admin/sprite-2e07ce56/index.html http://localhost:8009/admin/sprite-2e07ce56/
rm -rf static-wagtail-dark-theme-playground/static
cp -R bakerydemo/bakerydemo/collect_static static-wagtail-dark-theme-playground/static
cp -R ../v4.1/static-wagtail-v4-1/admin/api ./static-wagtail-dark-theme-playground/admin/api
cp -R ../v4.1/static-wagtail-v4-1/_redirects ./static-wagtail-dark-theme-playground/_redirects
