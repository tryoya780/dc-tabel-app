#!/bin/sh
# Пилот: тестовая страница bridge/index.html — то же приложение (опубликованная версия index.html из git),
# но запросы идут в мост https://time.diamond-catering.ru/api/app, а не в Apps Script. Открывается командой /bridge в тестовом боте.
cd "$(dirname "$0")"
mkdir -p bridge
git show HEAD:index.html | sed -e "s#^const API='[^']*';#const API='https://time.diamond-catering.ru/api/app';#" > bridge/index.html
grep -q "^const API='https://time.diamond-catering.ru/api/app';" bridge/index.html && echo "bridge/index.html обновлён" || { echo "ОШИБКА: адрес не подменён" >&2; exit 1; }
