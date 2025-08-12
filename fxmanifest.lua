fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Template Multi Framework'
description 'Multi-Framework FiveM Template - Compatible with ES Extended, QB-Core, QBX-Core, and OX-Core'
version '1.0.0'

shared_scripts {
    'shared/config.lua',
    'shared/utils.lua',
    'shared/framework.lua'
}

client_scripts {
    'client/framework/*.lua',
    'client/modules/*.lua',
    'client/main.lua'
}

server_scripts {
    'server/framework/*.lua',
    'server/modules/*.lua',
    'server/main.lua'
}

dependencies {
    'es_extended', -- Optional dependency
    'qb-core',     -- Optional dependency
    'qbx_core',    -- Optional dependency
    'ox_core'      -- Optional dependency
}

-- Framework detection will handle which dependencies are actually needed
