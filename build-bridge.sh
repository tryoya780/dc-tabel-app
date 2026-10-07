#!/bin/sh
# Пилот: тестовая страница bridge/index.html — то же приложение (опубликованная версия index.html из git),
# но запросы идут в мост https://time.diamond-catering.ru/api/app, а не в Apps Script. Открывается командой /bridge в тестовом боте.
cd "$(dirname "$0")"
mkdir -p bridge
git show HEAD:index.html | sed -e "s#^const API='[^']*';#const API='https://time.diamond-catering.ru/api/app';#" -e "s#</body>#<div style=\"position:fixed;right:6px;bottom:calc(2px + env(safe-area-inset-bottom));font:10px system-ui,sans-serif;opacity:.45;pointer-events:none;z-index:9999\">мост · github</div></body>#" > bridge/index.html  # подпись в углу: какая сборка открыта
grep -q "^const API='https://time.diamond-catering.ru/api/app';" bridge/index.html && echo "bridge/index.html обновлён" || { echo "ОШИБКА: адрес не подменён" >&2; exit 1; }
