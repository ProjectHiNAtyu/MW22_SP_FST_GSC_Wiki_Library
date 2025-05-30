// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    setsaveddvar( "dvar_32196FA75434C856", 1 );
    setdvarifuninitialized( "dvar_A8BB993617FB139C", 0 );
    level.loot = spawnstruct();
    level.loot.types = [];
    level.loot.items = [];
    level.loot.spawned = [];
    level.loot.notifications = [];
    level.loot.lastloottime = 0;
    level.loot.spawntags = [ "j_spinelower" ];
    level.loot.sfx = scripts\engine\utility::spawn_script_origin( level.player.origin );
    level.loot.sfx linkto( level.player );
    level.loot.offhands = [];
    level.loot._id_32137B56AF4C22DD = [];

    if ( scripts\common\utility::playerarmorenabled() )
    {
        precacheshader( "ui_icon_armor_pickup" );
        registerloot( "Armor Plate", "hud_icon_loot_armor", &"EQUIPMENT/LOOT_ARMOR", "loot_armor_plate", "loot_pickup_armor", 1, ::lootarmor, ::playermaxarmor, ::probabilityarmor, undefined, undefined, ( 2, 0, 0 ) );
        registerloot( "Armor Vest", "hud_icon_loot_armor", &"EQUIPMENT/LOOT_ARMOR_VEST", "lm_armor_vest_01", "loot_pickup_armor", 1, ::_id_C59EF2AEB9431494, ::_id_A57539EB7FBC0627, ::probabilityarmor, undefined, undefined, ( 2, 0, 0 ) );
        thread updatearmordroptimer();
    }

    registerammoloot( "Rocket", "hud_icon_loot_ammo_rocket", &"EQUIPMENT/LOOT_ROCKET", "loot_ammo_rocket", "loot_pickup_ammo_sniper", "rocket" );
    registerammoloot( "40mm Grenade", "hud_icon_loot_ammo_40mmgrenade", &"EQUIPMENT/LOOT_40MMGRENADE", "loot_ammo_40mmgrenade", "loot_pickup_ammo_sniper", "40mmGrenade" );
    registerloot( "5.56mm", "hud_icon_loot_ammo_556", &"EQUIPMENT/LOOT_556MM" );
    registerloot( "12 Gauge", "hud_icon_loot_ammo_12gauge", &"EQUIPMENT/LOOT_12GAUGE" );
    registerloot( "9mm", "hud_icon_loot_ammo_9mm", &"EQUIPMENT/LOOT_9MM" );
    registeroffhandloot( "C4", "hud_icon_equipment_c4", &"EQUIPMENT/LOOT_C4", "loot_c4", "c4_sp", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "C4_short_throw", "hud_icon_equipment_c4", &"EQUIPMENT/LOOT_C4", "loot_c4", "c4_sp_short_throw", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "c4_sp_short_throw", "hud_icon_equipment_c4", &"EQUIPMENT/LOOT_C4", "loot_c4", "c4_sp_short_throw", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "M67 Frag", "hud_icon_equipment_frag", &"EQUIPMENT/LOOT_FRAG", "loot_frag", "frag", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "Semtex", "hud_icon_equipment_semtex", &"EQUIPMENT/LOOT_SEMTEX", "loot_semtex", "semtex", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "M84 Flash", "hud_icon_equipment_flash", &"EQUIPMENT/LOOT_FLASH", "loot_flash", "flash", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "Molotov", "hud_icon_equipment_molotov", &"EQUIPMENT/LOOT_MOLOTOV", "loot_molotov", "molotov", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "Bottle", "hud_icon_equipment_bottle", &"EQUIPMENT/LOOT_BOTTLE", "offhand_1h_wm_bottle_v0", "bottle", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "Smoke", "hud_icon_equipment_smoke", &"EQUIPMENT/SMOKE", "loot_smoke_empty", "smoke_empty", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "smoke_empty", "hud_icon_equipment_smoke", &"EQUIPMENT/SMOKE", "loot_smoke_empty", "smoke_empty", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "smoke", "hud_icon_equipment_smoke", &"EQUIPMENT/SMOKE", "loot_smoke_empty", "smoke", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "Throwing Knife", "hud_icon_equipment_throwing_knife", &"EQUIPMENT/LOOT_THROWING_KNIFE", "loot_throwingknife", "throwingknife", ( -2.5, 0, 0 ), "weap_pickup_knife_plr" );
    registeroffhandloot( "Kitchen Throwing Knife", "hud_icon_equipment_throwing_knife", &"EQUIPMENT/LOOT_THROWING_KNIFE", "loot_throwingknife_kitchen", "throwingknife_kitchen", ( -2.5, 0, 0 ), "weap_pickup_knife_plr" );
    registeroffhandloot( "Proximity Mine", "hud_icon_equipment_at_mine", &"EQUIPMENT/AT_MINE", "offhand_2h_wm_proximity_mine_v0", "at_mine_sp", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "improvised_mine", "ui_icon_crafting_recipe_mine", &"EQUIPMENT/IMPROVISED_MINE", "loot_c4", "improvised_mine", undefined, "loot_pickup_offhand" );
    registeroffhandloot( "Tear Gas", "hud_icon_equipment_gas", &"EQUIPMENT/GAS", "projectile_grenade_gas_v0_sp", "gas_grenade_sp", undefined, "loot_pickup_offhand" );
    registerloot( "Bolt", "hud_icon_equipment_bolt", &"EQUIPMENT/LOOT_BOLT", "loot_throwingknife", "loot_pickup_ammo_sniper", 1, ::donothing, ::inactive, ::probabilityzero );
    thread setworldloot();
}

corpselootthink()
{
    if ( !cancarryloot() )
        return;

    if ( !worldmaxspawnedloot() )
        onspawnloot();

    self waittill( "death", attacker );

    if ( !shoulddroploot( attacker ) )
        return;

    spawncorpseloot();
}

cancarryloot()
{
    if ( !isdefined( self ) )
        return 0;

    if ( !isdefined( level.loot ) )
        return 0;

    if ( self.team != "axis" )
        return 0;

    if ( self.classname == "actor_enemy_dog" )
        return 0;

    if ( self.classname == "actor_enemy_alq_desert_bomber" )
        return 0;

    if ( self.classname == "actor_enemy_alq_urban_bomber" )
        return 0;

    return 1;
}

shoulddroploot( attacker )
{
    if ( !isdefined( self ) )
        return 0;

    if ( !isdefined( level.loot ) )
        return 0;

    if ( !scripts\sp\utility::playerlootenabled() )
        return 0;

    if ( force_armor_drop() )
        return 1;

    if ( indonotspawnlootvolume( self ) )
        return 0;

    if ( istrue( self.noloot ) )
        return 0;

    if ( !scripts\engine\utility::is_equal( attacker, level.player ) )
        return 0;

    if ( worldmaxspawnedloot() )
        return 0;

    return 1;
}

onspawnloot()
{
    self.loot = [];

    foreach ( name, type in level.loot.types )
    {
        if ( isdefined( level.loot.types[name].onspawnfunc ) && isdefined( level.loot.types[name].probabilityfunc ) )
        {
            if ( [[ level.loot.types[name].probabilityfunc ]]( name, self.origin ) )
            {
                self thread [[ level.loot.types[name].onspawnfunc ]]();
                self.loot[name] = 1;
            }
        }
    }
}

registerloot( name, shader, loc, model, sound, createnotification, lootfunc, inactivefunc, probabilityfunc, onspawnfunc, weaponname, _id_4EEA72A373570008 )
{
    if ( isdefined( shader ) )
        precacheshader( shader );

    if ( isdefined( model ) )
        precachemodel( model );

    level.loot.types[name] = spawnstruct();
    level.loot.types[name].shader = shader;
    level.loot.types[name].loc = loc;
    level.loot.types[name].model = model;
    level.loot.types[name].sound = sound;
    level.loot.types[name].createnotification = createnotification;
    level.loot.types[name].lootfunc = lootfunc;
    level.loot.types[name].inactivefunc = inactivefunc;
    level.loot.types[name].probabilityfunc = probabilityfunc;
    level.loot.types[name].onspawnfunc = onspawnfunc;
    level.loot.types[name].weapon = weaponname;
    level.loot.types[name]._id_4EEA72A373570008 = _id_4EEA72A373570008;
}

deregisterloot( name )
{
    level.loot.types[name] = undefined;
    level.loot.types = scripts\engine\utility::array_remove_key( level.loot.types, name );
}

registerammoloot( name, shader, loc, model, sound, type )
{
    if ( type == "rocket" )
        probabilityfunc = ::probabilityzero;
    else if ( type == "40mmGrenade" )
        probabilityfunc = ::probabilityzero;
    else
        probabilityfunc = ::probabilityzero;

    registerloot( name, shader, loc, model, sound, 1, ::lootammo, ::playermaxammo, probabilityfunc );
    level.loot._id_32137B56AF4C22DD[level.loot._id_32137B56AF4C22DD.size] = name;
}

registeroffhandloot( name, shader, loc, model, weaponname, _id_4EEA72A373570008, _id_2CD2B9F1E533253A )
{
    registerloot( name, shader, loc, model, _id_2CD2B9F1E533253A, 1, ::lootoffhand, ::inactiveoffhand, ::probabilityoffhand, undefined, weaponname, _id_4EEA72A373570008 );
}

removeoffhandloot( offhand )
{
    if ( isstring( offhand ) )
        weaponname = offhand;
    else
        weaponname = offhand.basename;

    key = scripts\sp\equipment\offhands::getweaponoffhandtype( weaponname );

    if ( isdefined( level.loot.offhands[key] ) )
        level.loot.offhands = scripts\engine\utility::array_remove_key( level.loot.offhands, key );

    level.player notify( "offhand_loot_change" );
}

setoffhandloot( offhand )
{
    if ( isstring( offhand ) )
        weaponname = offhand;
    else
        weaponname = offhand.basename;

    key = scripts\sp\equipment\offhands::getweaponoffhandtype( weaponname );

    if ( isdefined( level.loot.offhands[key] ) )
        level.loot.offhands = scripts\engine\utility::array_remove_key( level.loot.offhands, key );

    level.loot.offhands[key] = weaponname;
    level.player notify( "offhand_loot_change" );
}

updatearmordroptimer()
{
    level.player endon( "death" );
    level.loot.lastdroppedarmortime = -60000;
    level.loot.armordroptimer = 0;

    for (;;)
    {
        if ( level.player enemynearplayer() && !level.player scripts\sp\player::hasarmor() )
            level.loot.armordroptimer = level.loot.armordroptimer + 0.05;

        waitframe();
    }
}

enemynearplayer()
{
    foreach ( enemy in getaiarray( "axis" ) )
    {
        if ( distancesquared( self.origin, enemy.origin ) <= 1048576 )
            return 1;
    }

    return 0;
}

worldmaxspawnedloot()
{
    if ( level.loot.spawned.size >= 25 )
    {
        if ( trylootdropdespawn() )
            return 0;

        return 1;
    }

    return 0;
}

trylootdropdespawn()
{
    _id_1D4B111B034C7AD1 = level.loot.items;
    _id_831F7EACAAF27271 = sortbydistance( _id_1D4B111B034C7AD1, level.player.origin )[_id_1D4B111B034C7AD1.size - 1];

    for (;;)
    {
        if ( !_id_1D4B111B034C7AD1.size )
            return 0;

        _id_831F7EACAAF27271 = sortbydistance( _id_1D4B111B034C7AD1, level.player.origin )[_id_1D4B111B034C7AD1.size - 1];

        if ( !isdefined( _id_831F7EACAAF27271 ) )
            return 0;

        if ( !itemworldplaced( _id_831F7EACAAF27271 ) )
            break;

        _id_1D4B111B034C7AD1 = scripts\engine\utility::array_remove( _id_1D4B111B034C7AD1, _id_831F7EACAAF27271 );
    }

    if ( !itemworldplaced( _id_831F7EACAAF27271 ) && distancesquared( _id_831F7EACAAF27271.origin, level.player.origin ) > distancesquared( self.origin, level.player.origin ) )
    {
        _id_831F7EACAAF27271 cleanuplootitem();
        return 1;
    }

    return 0;
}

trylootdespawn( name )
{
    _id_CF5AD7339AD946EF = undefined;
    _id_379C31FD2BE3E9FF = -1;

    foreach ( item in level.loot.items )
    {
        if ( !scripts\engine\utility::is_equal( item.name, name ) )
            continue;

        if ( itemworldplaced( item ) )
            continue;

        _id_4EB801042B324702 = distancesquared( item.origin, level.player.origin );

        if ( level.player scripts\engine\math::point_in_fov( item.origin ) && _id_4EB801042B324702 < 2250000 )
            continue;

        if ( !isdefined( _id_CF5AD7339AD946EF ) || _id_4EB801042B324702 > _id_379C31FD2BE3E9FF )
        {
            _id_CF5AD7339AD946EF = item;
            _id_379C31FD2BE3E9FF = _id_4EB801042B324702;
        }
    }

    if ( isdefined( _id_CF5AD7339AD946EF ) && distancesquared( self.origin, level.player.origin ) < _id_379C31FD2BE3E9FF )
    {
        _id_CF5AD7339AD946EF cleanuplootitem();
        return 1;
    }

    return 0;
}

spawncorpseloot()
{
    if ( !isdefined( self ) )
        return;

    if ( !isdefined( self.loot ) )
        self.loot = [];

    _id_9BE70D6D4FF253A1 = self.loot.size;

    foreach ( name, type in level.loot.types )
    {
        if ( _id_9BE70D6D4FF253A1 >= 2 )
            break;

        _id_553B9CE0FB47F47D = isdefined( level.loot.types[name].onspawnfunc );
        _id_F0A79D697E4F5FE1 = istrue( self.loot[name] );

        if ( isdefined( level.loot.types[name].probabilityfunc ) )
            _id_E0902DB164AF1B76 = [[ level.loot.types[name].probabilityfunc ]]( name, self.origin );
        else
            _id_E0902DB164AF1B76 = 0;

        if ( !_id_553B9CE0FB47F47D && !_id_F0A79D697E4F5FE1 && _id_E0902DB164AF1B76 )
        {
            tag = level.loot.spawntags[randomint( level.loot.spawntags.size )];
            spawnlootitem( name, self gettagorigin( tag ), undefined, 685, 0, 0 );
            _id_9BE70D6D4FF253A1++;
        }
    }
}

spawnlootitem( name, origin, angles, _id_F8048727716242B0, worldplaced, _id_8FE6922025E77BEA, usephysics )
{
    if ( ( _id_A6E152B655FAAE22( name ) || _id_468E6AA1F3DDB5C4( name ) ) && !scripts\common\utility::playerarmorenabled() )
        return;

    if ( !isdefined( angles ) )
        angles = scripts\engine\utility::randomvectorrange( 0, 360 );

    if ( isdefined( _id_8FE6922025E77BEA ) && !isdefined( usephysics ) )
        usephysics = !_id_8FE6922025E77BEA;

    spawnflags = scripts\sp\script_items::scriptitem_buildspawnflags( _id_8FE6922025E77BEA, usephysics, 1, 0, 1 );
    model = level.loot.types[name].model;
    _id_D71630B8BAF84FA8 = ( randomfloat( 0.5 ), randomfloat( 0.5 ), 1 ) * _id_F8048727716242B0;
    item = _func_FFF4D80D6947B950( "script_item_" + name, origin, angles, spawnflags, model, "", _id_D71630B8BAF84FA8, origin );

    if ( isdefined( item ) )
    {
        setitemasloot( item, name, worldplaced );
        return item;
    }
}

setitemasloot( item, name, worldplaced )
{
    item.name = name;
    item.worldplaced = worldplaced;
    item thread cleanuplootitemondelete();
    item thread checkforlootitemtrigger( name );
    level.loot.items = scripts\engine\utility::array_add( level.loot.items, item );

    if ( !isdefined( worldplaced ) || !worldplaced )
        level.loot.spawned = scripts\engine\utility::array_add( level.loot.spawned, item );
}

itemworldplaced( item )
{
    return item.worldplaced;
}

cleanuplootitemondelete()
{
    self waittill( "death" );
    cleanuplootitem();
}

cleanuplootitem()
{
    safedelete();
    level.loot.items = scripts\engine\utility::array_removeundefined( level.loot.items );
    level.loot.spawned = scripts\engine\utility::array_removeundefined( level.loot.spawned );
}

safedelete()
{
    if ( isdefined( self ) )
        self delete();
}

checkforlootitemtrigger( name )
{
    self endon( "death" );

    for (;;)
    {
        if ( istrue( self.worldplaced ) )
            _id_0D6A22D94BBD3C5C( name );
        else
        {
            self waittill( "trigger", _id_FA8D840338038893 );

            if ( _id_FA8D840338038893 != level.player )
                continue;
        }

        waittillplayercanloot();
        waittillnextloottime();

        if ( [[ level.loot.types[name].inactivefunc ]]( name ) )
            continue;

        if ( istrue( self.worldplaced ) )
            level.player playgestureviewmodel( "iw9_ges_pickup", self );

        lootfuncandnotification( name );
        self delete();
    }
}

_id_0D6A22D94BBD3C5C( name )
{
    _id_30BA11F2E1D09B42 = level.loot.types[name].loc;

    if ( isdefined( self.script_fov_outer ) )
        _id_CF1DDA7C717E1BE0 = self.script_fov_outer;
    else
        _id_CF1DDA7C717E1BE0 = 90;

    if ( isdefined( self.script_dist_only ) )
        _id_49861F7CE64579ED = self.script_dist_only;
    else
        _id_49861F7CE64579ED = 110;

    if ( isdefined( self.script_maxdist ) )
        usedist = self.script_maxdist;
    else
        usedist = 85;

    if ( isdefined( self.script_fov_inner ) )
        usefov = self.script_fov_inner;
    else
        usefov = 40;

    offset = level.loot.types[name]._id_4EEA72A373570008;

    if ( !isdefined( offset ) )
        offset = ( 0, 0, 0 );

    self._id_2962AF1B05702467 = 1;
    scripts\sp\player\cursor_hint::create_cursor_hint( undefined, offset, _id_30BA11F2E1D09B42, _id_CF1DDA7C717E1BE0, _id_49861F7CE64579ED, usedist, 0, undefined, undefined, undefined, undefined, undefined, undefined, usefov );
    thread _id_8B9CC449B9F5159D( name, _id_30BA11F2E1D09B42 );

    for (;;)
    {
        self.cursor_hint_ent waittill( "trigger", _id_FA8D840338038893 );

        if ( _id_FA8D840338038893 != level.player )
            continue;

        break;
    }

    scripts\sp\player\cursor_hint::remove_cursor_hint();
}

_id_0512014A40727DE4( name )
{
    if ( !isdefined( level.loot.types[name].weaponobj ) )
    {
        _id_DE88CD14114C1E24 = getoffhandweaponname( name );

        if ( isdefined( _id_DE88CD14114C1E24 ) )
        {
            attachments = _func_6527364C1ECCA6C6( _id_DE88CD14114C1E24 );

            if ( istrue( attachments.size ) )
            {
                weaponobj = makeweapon( _id_DE88CD14114C1E24 );

                foreach ( attachment in attachments )
                    weaponobj = weaponobj withattachment( attachment );
            }
            else
                weaponobj = makeweaponfromstring( _id_DE88CD14114C1E24 );

            level.loot.types[name].weaponobj = weaponobj;
        }
    }
}

_id_8B9CC449B9F5159D( name, _id_30BA11F2E1D09B42 )
{
    self endon( "hint_destroyed" );
    _id_0512014A40727DE4( name );
    _id_B971E09CE070BD58 = -1;

    for (;;)
    {
        _id_D5F6F287AC22711A = _id_B971E09CE070BD58;

        if ( _id_66D13E39B09C4901( name ) )
            _id_B971E09CE070BD58 = level.player scripts\sp\player::getammonameamount( name );
        else if ( _id_A6E152B655FAAE22( name ) )
            _id_B971E09CE070BD58 = level.player scripts\sp\player::_id_85E373BB15921966();
        else if ( _id_468E6AA1F3DDB5C4( name ) )
            _id_B971E09CE070BD58 = level.player scripts\sp\player::getarmoramount();
        else
            _id_B971E09CE070BD58 = _id_EDF54AA6C57ADB98( name );

        if ( _id_B971E09CE070BD58 != _id_D5F6F287AC22711A )
        {
            if ( _id_66D13E39B09C4901( name ) )
                maxammo = level.player scripts\sp\player::getammonamemaxamount( name );
            else if ( _id_A6E152B655FAAE22( name ) )
                maxammo = level.player scripts\sp\player::_id_C241AEEC324282F0();
            else if ( _id_468E6AA1F3DDB5C4( name ) )
                maxammo = level.player scripts\sp\player::getarmormaxamount();
            else
                maxammo = _id_57888D406854DC7F( name );

            if ( _id_B971E09CE070BD58 >= maxammo )
            {
                self.cursor_hint_ent sethintinoperable( 1 );
                self.cursor_hint_ent sethintstring( &"EQUIPMENT/FULL" );
            }
            else
            {
                self.cursor_hint_ent sethintinoperable( 0 );
                self.cursor_hint_ent sethintstring( _id_30BA11F2E1D09B42 );
            }
        }

        waitframe();
    }
}

lootfuncandnotification( name )
{
    level.player thread [[ level.loot.types[name].lootfunc ]]( name );
    scripts\sp\analytics::analytics_event_upload( "loot_pickup", name );
    level.player notify( "item_loot" );
    playlootsound( name );
    thread createnotification( name );
}

lootnearbyitems( origin, parent, name )
{
    foreach ( item in level.loot.items )
    {
        if ( scripts\engine\utility::is_equal( parent, item ) )
            continue;

        if ( !scripts\engine\utility::is_equal( name, item.name ) )
            continue;

        if ( distancesquared( origin, item.origin ) <= 16384 )
        {
            level.player thread [[ level.loot.types[item.name].lootfunc ]]( item.name );
            item delete();
        }
    }
}

playermaxarmor( name )
{
    return level.player scripts\sp\player::_id_83151236CDB3CE27();
}

_id_A57539EB7FBC0627( name )
{
    return level.player scripts\sp\player::hasmaxarmor();
}

playermaxammo( name )
{
    return level.player scripts\sp\player::getammonameamount( name ) >= level.player scripts\sp\player::getammonamemaxamount( name );
}

inactiveoffhand( name )
{
    weaponname = getoffhandweaponname( name );

    if ( !isdefined( weaponname ) )
    {

    }

    if ( !scripts\engine\sp\utility::player_has_equipment( weaponname ) )
    {
        _id_99F4520333E40283 = scripts\sp\equipment\offhands::getweaponoffhandtype( weaponname );

        if ( !player_offhand_empty( _id_99F4520333E40283 ) )
            return 1;
    }

    _id_B971E09CE070BD58 = _id_EDF54AA6C57ADB98( name );
    maxammo = _id_57888D406854DC7F( name );
    return _id_B971E09CE070BD58 >= maxammo;
}

inactive( name )
{
    return 0;
}

player_offhand_empty( _id_99F4520333E40283 )
{
    offhand = level.player _meth_51BB5F1539048C4C( _id_99F4520333E40283 );

    if ( !isdefined( offhand ) || offhand.basename == "none" )
        return 1;
    else
        return 0;
}

_id_3FD5749F637651B7( weapon )
{
    foreach ( name, loot in level.loot.types )
    {
        if ( scripts\engine\utility::is_equal( loot.weapon, weapon ) )
            return name;
    }

    return undefined;
}

getoffhandprobabilityfromname( name )
{
    if ( name == "Proximity Mine" )
        return 0;
    else
        return 40;
}

getoffhandweaponname( name )
{
    return level.loot.types[name].weapon;
}

_id_173C699830122E92( name )
{
    return level.loot.types[name].weaponobj;
}

_id_EDF54AA6C57ADB98( name )
{
    weaponobj = _id_173C699830122E92( name );

    if ( !isdefined( weaponobj ) )
        weaponobj = getoffhandweaponname( name );

    if ( scripts\engine\sp\utility::player_has_equipment( weaponobj ) )
    {
        weaponname = getoffhandweaponname( name );
        _id_70148FF25532A07F = level.player.offhandinventory;

        foreach ( weapon in _id_70148FF25532A07F )
        {
            if ( weapon.basename == weaponname )
                return level.player getweaponammostock( weapon );
        }
    }

    return 0;
}

_id_57888D406854DC7F( name )
{
    if ( isdefined( level.loot.types[name].maxammo ) )
        return level.loot.types[name].maxammo;

    weaponname = getoffhandweaponname( name );
    return weaponmaxammo( weaponname );
}

_id_138CE2F6A3E08E1B( name, maxammo )
{
    level.loot.types[name].maxammo = maxammo;
}

lootammo( name )
{
    _id_EA34E536B58878DD = scripts\sp\player::getammonameamount( name );
    maxammo = scripts\sp\player::getammonamemaxamount( name );
    _id_FAB97C83933F6B68 = getammolootamount( _id_EA34E536B58878DD, maxammo );
    _id_402CBD10005539A1 = int( min( maxammo, _id_EA34E536B58878DD + _id_FAB97C83933F6B68 ) );

    if ( _id_402CBD10005539A1 != _id_EA34E536B58878DD )
        level.player scripts\sp\player::setammonameamount( name, _id_402CBD10005539A1 );
}

getammolootamount( _id_EA34E536B58878DD, maxammo )
{
    _id_D2FDB42A90D365D3 = scripts\engine\math::normalize_value( 0, maxammo, _id_EA34E536B58878DD );
    _id_4C92F7B0AAC1631B = scripts\engine\math::factor_value( 0.5, 0.1, _id_D2FDB42A90D365D3 );
    return max( 1, int( _id_4C92F7B0AAC1631B * maxammo ) );
}

lootarmor( name )
{
    _id_2239CFF6841032DC = level.player scripts\sp\player::_id_85E373BB15921966();
    level.player scripts\sp\player::_id_E9E42CFFEDAA98D5( _id_2239CFF6841032DC + 1 );
    thread createnotification( "Armor Plate" );
}

_id_C59EF2AEB9431494( name )
{
    level.player scripts\sp\player::give_player_max_armor();
    thread createnotification( "Armor Vest" );
}

lootoffhand( name )
{
    weaponname = getoffhandweaponname( name );

    if ( !isdefined( weaponname ) )
    {

    }

    if ( scripts\engine\sp\utility::player_has_equipment( weaponname, 1 ) )
    {
        _id_70148FF25532A07F = level.player.offhandinventory;

        foreach ( weapon in _id_70148FF25532A07F )
        {
            if ( isweapon( weapon ) )
            {
                if ( weapon.basename == weaponname )
                {
                    _id_EA34E536B58878DD = level.player getweaponammostock( weapon );
                    maxammo = _id_57888D406854DC7F( name );
                    _id_402CBD10005539A1 = int( min( _id_EA34E536B58878DD + 1, maxammo ) );
                    level.player setweaponammoclip( weapon, _id_402CBD10005539A1 );
                }

                continue;
            }

            if ( isstring( weapon ) )
            {
                if ( weapon == weaponname )
                {
                    attachments = _func_6527364C1ECCA6C6( weapon );

                    if ( istrue( attachments.size ) )
                    {
                        objweapon = makeweapon( weapon );

                        foreach ( attachment in attachments )
                        {
                            objweapon = objweapon withattachment( attachment );
                            _id_EA34E536B58878DD = level.player getweaponammostock( objweapon );
                            maxammo = _id_57888D406854DC7F( name );
                            _id_402CBD10005539A1 = int( min( _id_EA34E536B58878DD + 1, maxammo ) );
                            level.player setweaponammoclip( objweapon, _id_402CBD10005539A1 );
                        }
                    }
                }
            }
        }
    }
    else
        level.player scripts\engine\sp\utility::give_offhand( weaponname, 1 );
}

donothing( name )
{

}

probabilityarmor( name, origin )
{
    if ( istrue( self.noarmor ) )
        return 0;

    if ( force_armor_drop() )
        return 1;

    return 0;
}

armorinventoryratio()
{
    _id_6C8D21B2E54B2478 = 1 - level.player scripts\sp\player::_id_85E373BB15921966() / level.player scripts\sp\player::_id_C241AEEC324282F0();
    return 0.15 * _id_6C8D21B2E54B2478;
}

armorhealthratio()
{
    _id_6C8D21B2E54B2478 = 1 - level.player scripts\sp\player::getarmoramount() / level.player scripts\sp\player::getarmormaxamount();
    return 0.1 * _id_6C8D21B2E54B2478;
}

armordistanceratio( _id_4EB801042B324702 )
{
    _id_1280F17F7036F6E9 = 0.000000444444;
    _id_6C8D21B2E54B2478 = _id_1280F17F7036F6E9 * _id_4EB801042B324702;
    return 0.75 * _id_6C8D21B2E54B2478;
}

armormaxprobability()
{
    _id_6C8D21B2E54B2478 = min( level.loot.armordroptimer / 120, 1 );
    _id_FD98FF1546F7C620 = 82 * _id_6C8D21B2E54B2478;
    return 3 + _id_FD98FF1546F7C620;
}

probabilityzero( name, origin )
{
    return 0;
}

get_stowed_primary_weapon()
{
    foreach ( weapon in self.primaryinventory )
    {
        if ( !issameweapon( weapon, self.currentprimaryweapon, 1 ) )
            return weapon;
    }

    return nullweapon();
}

probabilityoffhand( name, origin )
{
    weaponname = getoffhandweaponname( name );

    if ( !isdefined( weaponname ) )
    {

    }

    if ( !scripts\engine\utility::array_contains( level.loot.offhands, weaponname ) )
        return 0;

    _id_4EB801042B324702 = distancesquared( origin, level.player.origin );

    if ( _id_4EB801042B324702 > 2250000 )
        return 0;

    _id_71D884E0E60AC631 = getoffhandprobabilityfromname( name );

    if ( _id_71D884E0E60AC631 == 0 )
        return 0;

    if ( !isdefined( _id_71D884E0E60AC631 ) )
    {

    }

    _id_B971E09CE070BD58 = _id_EDF54AA6C57ADB98( name );
    maxammo = _id_57888D406854DC7F( name );

    if ( _id_B971E09CE070BD58 >= maxammo )
        _id_302E82DA1A1989AD = 0;
    else
        _id_302E82DA1A1989AD = _id_71D884E0E60AC631 * ( 1 - _id_B971E09CE070BD58 / maxammo );

    if ( randomint( 100 ) > _id_302E82DA1A1989AD )
        return 0;

    _id_59E7B247980174BE = 0;

    foreach ( item in level.loot.items )
    {
        if ( scripts\engine\utility::is_equal( item.name, name ) && !itemworldplaced( item ) )
            _id_59E7B247980174BE++;
    }

    _id_27372C85ED16C136 = _id_59E7B247980174BE + _id_B971E09CE070BD58 >= maxammo;

    if ( !_id_27372C85ED16C136 )
        return 1;

    if ( trylootdespawn( name ) )
        return 1;
    else
        return 0;
}

waittillplayercanloot()
{
    while ( level.player ismeleeing() )
        waitframe();
}

playlootsound( name )
{
    if ( isdefined( level.loot.types[name].sound ) && soundexists( level.loot.types[name].sound ) )
        level.loot.sfx scripts\engine\utility::delaycall( 0.2, ::playsound, level.loot.types[name].sound );
    else if ( soundexists( "loot_pickup_offhand" ) )
        level.loot.sfx scripts\engine\utility::delaycall( 0.2, ::playsound, "loot_pickup_offhand" );
}

createnotification( name, _id_1F0318CA2D6C648E )
{
    if ( !isdefined( name ) || !isdefined( level.loot.types[name] ) || !isdefined( level.loot.types[name].createnotification ) )
        return;

    _id_3E30FDC227F6E37C = !scripts\engine\sp\utility::in_realism_mode() || istrue( _id_1F0318CA2D6C648E );

    if ( _id_3E30FDC227F6E37C )
    {
        shader = level.loot.types[name].shader;
        locname = level.loot.types[name].loc;
        setomnvar( "ui_loot_splash_name", locname );
        setomnvar( "ui_loot_splash_icon", shader );
        waitframe();
        destroylootnotification();
    }
}

waittillnextloottime()
{
    currenttime = gettime();
    goaltime = level.loot.lastloottime + 250;

    if ( currenttime > goaltime )
        level.loot.lastloottime = currenttime;
    else
    {
        level.loot.lastloottime = goaltime;

        while ( gettime() < goaltime )
            waitframe();
    }
}

destroylootnotification()
{
    setomnvar( "ui_loot_splash_name", "none" );
    setomnvar( "ui_loot_splash_icon", "none" );
}

setworldloot()
{
    waittillframeend;

    foreach ( struct in scripts\engine\utility::getstructarray( "lootSpawn", "targetname" ) )
    {
        if ( !isrefloot() )
            spawnlootitem( struct.script_noteworthy, struct.origin, struct.angles, 0, 1, istrue( struct.script_suspend ) );
    }
}

isrefloot()
{
    if ( isdefined( self.spawnflags ) && self.spawnflags & 1 )
        return 1;
    else
        return 0;
}

_id_66D13E39B09C4901( name )
{
    return scripts\engine\utility::array_contains( level.loot._id_32137B56AF4C22DD, name );
}

_id_A6E152B655FAAE22( name )
{
    return scripts\engine\utility::is_equal( tolower( "Armor Plate" ), tolower( name ) );
}

_id_468E6AA1F3DDB5C4( name )
{
    return scripts\engine\utility::is_equal( tolower( "Armor Vest" ), tolower( name ) );
}

createpickupicon( shader )
{
    self endon( "death" );
    self endon( "entitydeleted" );

    while ( distancesquared( level.player.origin, self.origin ) > 2250000 )
        waitframe();

    _func_BC08527083E0BB42( self, ( 0, 0, 10 ) );
    _func_B5BCECDE956B3398( self );
    _func_4A4069845E9FFA27( self );
    _func_AF687D59F60C3AD6( self, ( 1, 1, 1 ), 0 );
    _func_525294B169EE099E( self, 0 );
    _func_9676783B10449A0C( self, level.player );
    _func_EADCC3BB89E313B2( self, shader );
    _func_63152742917AC959( self );
    childthread updatepickupicon();
}

updatepickupicon()
{
    self.alpha = 0;
    self.iconsize = 0;
    spawntime = gettime();

    for (;;)
    {
        distance = distance( level.player.origin, self.origin );
        _id_0955695D3F4BC112 = gettime() < spawntime + 2150;
        _id_8161C1BF99DDCFC4 = isalive( level.player ) && level.player scripts\engine\trace::can_see_origin( self.origin + ( 0, 0, 10 ), 0 );

        if ( _id_0955695D3F4BC112 || _id_8161C1BF99DDCFC4 )
        {
            _id_1ADEE2FDD285AAF8 = 1 - scripts\engine\math::normalize_value( 0, 1000, distance );
            _id_0889A9ABD01DB332 = _id_1ADEE2FDD285AAF8 * 1.25;
        }
        else
            _id_0889A9ABD01DB332 = 0;

        if ( _id_0889A9ABD01DB332 != self.alpha )
        {
            _id_DC159C0CF90E1F51 = clamp( ( _id_0889A9ABD01DB332 - self.alpha ) * 0.45, -0.125, 0.125 );
            _id_E1FA213D78FA2A9B = self.alpha + _id_DC159C0CF90E1F51;
            _func_AF687D59F60C3AD6( self, ( 1, 1, 1 ), _id_E1FA213D78FA2A9B );
            self.alpha = _id_E1FA213D78FA2A9B;
        }

        _id_EDBDB7B149A0B4BD = scripts\engine\math::normalize_value( 100, 1000, distance );
        iconsize = int( scripts\engine\math::factor_value( 32, 8, _id_EDBDB7B149A0B4BD ) * 1 );

        if ( iconsize != self.iconsize )
        {
            _func_70373647E4F963B0( self, iconsize, 0 );
            _func_59ECA5C5C0C38EA6( self, iconsize, 0 );
            self.iconsize = iconsize;
        }

        waitframe();
    }
}

indonotspawnlootvolume( entity )
{
    _id_788DC5C5A040CC11 = getentarray( "doNotSpawnLoot", "targetname" );

    foreach ( volume in _id_788DC5C5A040CC11 )
    {
        if ( entity istouching( volume ) )
            return 1;
    }

    return 0;
}

_id_27E046998BAC14DC( weapon )
{
    primaryoffhand = self _meth_E6B751989CF4F30F();
    secondaryoffhand = self _meth_264848618C0DFC4F();

    if ( isstring( weapon ) )
    {
        _id_2622298F62890966 = self getweaponslistall();

        foreach ( item in _id_2622298F62890966 )
        {
            if ( isnullweapon( item ) )
                continue;

            if ( weapontype( item ) == "grenade" && !scripts\engine\utility::is_equal( item.basename, primaryoffhand ) && !scripts\engine\utility::is_equal( item.basename, secondaryoffhand ) )
            {
                if ( item.basename != "smoke_empty" )
                    continue;
            }

            if ( scripts\engine\utility::is_equal( item.basename, weapon ) )
                return 1;
        }

        return 0;
    }
    else
        return self hasweapon( weapon );
}

set_force_armor_drop( _id_B96D126FC701024B )
{
    self.lootforcearmordrop = _id_B96D126FC701024B;
}

force_armor_drop()
{
    return istrue( self.lootforcearmordrop );
}
