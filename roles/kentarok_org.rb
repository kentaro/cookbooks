name        'nginx'
description 'Installs Nginx'
run_list    'recipe[base]', 'recipe[nginx]'
