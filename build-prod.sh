#!/bin/sh
# Собирает боевую страницу из index.html, подменяя адрес сервера на боевой скрипт босса.
cd "$(dirname "$0")"
sed "s#^const API='[^']*';#const API='https://script.google.com/macros/s/AKfycbyxcSvr6_EzWSApSJMaoSwOC2NeU_Er24dOvaA4RPJIpudVgrgG0A8R3Rk0DiCFs1Nr/exec';#" index.html > prod/index.html
grep -c "https://script.google.com/macros/s/AKfycbyxcSvr6_EzWSApSJMaoSwOC2NeU_Er24dOvaA4RPJIpudVgrgG0A8R3Rk0DiCFs1Nr/exec" prod/index.html >/dev/null && echo "prod/index.html обновлён"
