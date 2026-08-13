[1.35]

Updated to U247
Various bug fixes and code improvements

Fixed:

    [string "lib/units/enemies/cop/logics/coplogicattack.lua"]:147: attempt to index field 'team' (a nil value)
    [string "lib/managers/trademanager.lua"]:694: attempt to index a nil value
    [string "lib/managers/playermanager.lua"]:468: attempt to index field '_ammo_efficiency' (a nil value)
    [string "lib/units/weapons/newraycastweaponbase.lua"]:2431: attempt to index local 'user_unit' (a nil value)
    [string "lib/managers/hudmanagerpd2.lua"]:756: attempt to index a nil value
    [string "lib/managers/hudmanagerpd2.lua"]:1359: attempt to index a nil value
    [string "lib/tweak_data/groupaitweakdata.lua"]:3469: attempt to index local 'lvl_tweak_data' (a nil value)
    [string "lib/managers/gameplaycentralmanager"]:768: attempt to index a number value
    [string "lib/managers/mission/elementaccesscamera.lua"]:41: attempt to call method 'set_access_camera_mission_element' (a nil value)
    [string "lib/units/enemies/cop/actions/upper_body/copa..."]:103: attempt to index local 'attention_unit' (a nil value)
    [string "lib/network/matchmaking/networkaccountsteam.lua"]:99: attempt to concatenate local 'difficulty' (a nil value)
    [string "lib/managers/menu/menuscenemanager.lua"]:1708: attempt to index local 'unit' (a nil value)
    [string "lib/managers/menu/menuscenemanager.lua"]:712: attempt to index field '_environments' (a nil value)
    [string "lib/units/weapons/newnpcraycastweaponbase.lua"]:514: attempt to index a nil value
    [string "lib/units/enemies/cop/actions/full_body/copac..."]:196: attempt to call method 'base' (a nil value)
    [string "lib/managers/skilltreemanager.lua"]:1692: attempt to index local 'value' (a nil value)
    [string "lib/units/equipment/shield/shieldbase.lua"]:524: attempt to index local 'unit' (a nil value)

[1.34]

Fixed:

    [string "lib/managers/blackmarketmanager.lua"]:1572: attempt to index local 'weapon' (a nil value)
    [string "lib/managers/blackmarketmanager.lua"]:3026: attempt to index local 'weapon' (a nil value)

[1.33]

Fixed:

    [string "lib/managers/blackmarketmanager.lua"]:1388: attempt to index local 'equipped' (a nil value)
    [string "core/lib/utils/coreevent.lua"]:134: attempt to perform arithmetic on local 'interval' (a nil value)
    [string "lib/states/ingamefatalstate.lua"]:13: attempt to index local 'player' (a nil value)

[1.32]

Fixed:

    [string "lib/units/interactions/interactionext.lua"]:71: attempt to index field '_interact_obj' (a number value)
    [string "lib/managers/blackmarketmanager.lua"]:9103: attempt to index local 'skin_data' (a nil value)

[1.31]

Updated to U244

[1.30]

Fixed:

    [string "lib/units/enemies/cop/actions/upper_body/copa..."]:674: attempt to index local 'w_tweak' (a number value)
    [string "core/lib/utils/coreunit.lua"]:111: attempt to index local 'ext' (a number value)

[1.29]

Fixed:

    [string "lib/units/weapons/sentrygunweapon.lua"]:296: attempt to index field '_muzzle_effect_table' (a nil value)
    [string "lib/managers/occlusionmanager.lua"]:53: attempt to perform arithmetic on a boolean value
    [string "lib/managers/occlusionmanager.lua"]:66: attempt to index local 'obj' (a number value)

[1.28 - 1.28.3]

Fixed:

    [string "lib/managers/mission/elementequipment.lua"]:23: attempt to index local 'instigator' (a nil value)
    [string "lib/managers/experiencemanager.lua"]:811: attempt to perform arithmetic on local 'mission_xp_dissect' (a table value)
    Bug with PocoHud Jukebox


[1.26.7 - 1.27]

Removed:
    
    [string "lib/units/cameras/fpcameraplayerbase.lua"]:286: bad argument #1 to 'abs' (number expected, got nil) (fixed in the base game)
    removed checks for heist difficulty in crime.net / socialhub panels (fixed in the base game)

[1.26 - 1.26.6]

    Minor Fixes

[1.25 - 1.25.9]

Fixed:
    
    [string "lib/network/matchmaking/networkvoicechatsteam..."]:30: attempt to index global 'Steam' (a nil value)
    Bug with drills upgrade

[1.24 - 1.24.5]

Fixed:
    
    [string "lib/managers/crimenetmanager.lua"]:3012: attempt to perform arithmetic on field 'difficulty_id' (a nil value)
    Long host's names
    [string "lib/managers/social_hub/socialhubpanels.lua"]:389: attempt to perform arithmetic on field 'DIFFICULTY' (a string value)

[1.22 - 1.23]

Fixed:

    Bug with VanillaHUD Plus / Other huds

[1.20 - 1.21]

Fixed:

    [string "lib/network/matchmaking/networkvoicechatsteam..."]:113: attempt to perform arithmetic on field 'time' (a nil value)
    [string "lib/units/cameras/fpcameraplayerbase.lua"]:286: bad argument #1 to 'abs' (number expected, got nil)

[1.12 - 1.19]

    Minor fixes

[1.1 - 1.11]

Fixed:

    [string "lib/units/enemies/cop/logics/coplogicbase.lua"]:1551: attempt to index local 'data' (a nil value)
    [string "lib/network/base/handlers/basenetworkhandler.lua"]:46: attempt to index local 'rpc' (a nil value)
    _set_dummies_visible() lib/managers/mission/elementlasertrigger.lua:513

[1.0]

Initial commit
