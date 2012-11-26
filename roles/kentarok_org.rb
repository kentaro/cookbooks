name        'kentarok_org'
description 'kentarok_org'
run_list    'recipe[base]',
            'recipe[nginx]',
            'recipe[subsonic]'
