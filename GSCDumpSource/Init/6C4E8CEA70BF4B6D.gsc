// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_5F6D9FD82BDD2D05( _id_EFA8EF05B190D7D0 )
{
    _id_B8EBE3F71A08AB40 = spawnstruct();
    _id_B8EBE3F71A08AB40.teams = [];
    _id_B8EBE3F71A08AB40._id_AA1ED8F12D71A7A5 = _id_EFA8EF05B190D7D0;
    _id_B8EBE3F71A08AB40._id_EFA8EF05B190D7D0 = _id_EFA8EF05B190D7D0;
    _id_B8EBE3F71A08AB40.funcs = [];
    _id_B8EBE3F71A08AB40.index = 0;
    return _id_B8EBE3F71A08AB40;
}

_id_325390EDB051CD5D( _id_BFBE9638E9832D90, locations, _id_A61C75B156FC1EE0 )
{
    if ( !isdefined( self._id_B0F4BF8621B96C0A ) )
        self._id_B0F4BF8621B96C0A = [];

    foreach ( location in locations )
    {
        index = self._id_B0F4BF8621B96C0A.size;
        self._id_B0F4BF8621B96C0A[index] = spawnstruct();
        self._id_B0F4BF8621B96C0A[index] scripts\cp_mp\utility\game_utility::_id_6B6B6273F8180522( _id_BFBE9638E9832D90, location, _id_A61C75B156FC1EE0 );
    }
}

_id_8CD2AC82037F025C( _id_BFBE9638E9832D90, location, _id_A61C75B156FC1EE0 )
{
    if ( !isdefined( self._id_B0F4BF8621B96C0A ) )
        self._id_B0F4BF8621B96C0A = [];

    index = self._id_B0F4BF8621B96C0A.size;
    self._id_B0F4BF8621B96C0A[index] = spawnstruct();
    self._id_B0F4BF8621B96C0A[index] scripts\cp_mp\utility\game_utility::_id_6B6B6273F8180522( _id_BFBE9638E9832D90, location, _id_A61C75B156FC1EE0 );
}

_id_1851E9CFB7687F68( player )
{
    if ( isdefined( self._id_B0F4BF8621B96C0A ) )
    {
        foreach ( circle in self._id_B0F4BF8621B96C0A )
        {
            if ( isdefined( circle ) )
                circle scripts\cp_mp\utility\game_utility::_id_CFD53C8F6878014F( player );
        }
    }
}

_id_556FB3A465F0E978( player )
{
    if ( isdefined( self._id_B0F4BF8621B96C0A ) )
    {
        foreach ( circle in self._id_B0F4BF8621B96C0A )
        {
            if ( isdefined( circle ) )
                circle scripts\cp_mp\utility\game_utility::_id_D7D113D56EF0EF5B( player );
        }
    }
}

_id_E54DF8560BF7DC64( team )
{
    if ( isdefined( self._id_B0F4BF8621B96C0A ) )
    {
        foreach ( circle in self._id_B0F4BF8621B96C0A )
        {
            if ( isdefined( circle ) )
                circle _id_739560269BC164CF( team );
        }
    }
}

_id_2476DAEFA3384C5E()
{
    if ( isdefined( self._id_B0F4BF8621B96C0A ) )
    {
        foreach ( circle in self._id_B0F4BF8621B96C0A )
        {
            if ( isdefined( circle ) )
                circle scripts\cp_mp\utility\game_utility::_id_AF5604CE591768E1();
        }
    }
}

_id_4E927BFE9B585059( index )
{
    if ( isdefined( self._id_B0F4BF8621B96C0A ) )
    {
        self._id_B0F4BF8621B96C0A[index] scripts\cp_mp\utility\game_utility::_id_AF5604CE591768E1();
        self._id_B0F4BF8621B96C0A[index] = undefined;
    }
}

_id_AB50F62A3A730400( origin, radius )
{
    return origin + scripts\engine\utility::_id_D553466CF817A4DA() * radius;
}

_id_E68B37E06549547E( _id_A9706ADAF7C52E27, _id_A66785EDEC9E567B, circleindex )
{
    if ( !isdefined( circleindex ) )
        circleindex = 0;

    if ( !isdefined( _id_A9706ADAF7C52E27 ) )
        _id_A9706ADAF7C52E27 = self._id_B0F4BF8621B96C0A[circleindex].mapcircle.origin;

    if ( !isdefined( _id_A66785EDEC9E567B ) )
        _id_A66785EDEC9E567B = self._id_B0F4BF8621B96C0A[circleindex].mapcircle.origin[2];

    self._id_B0F4BF8621B96C0A[circleindex].mapcircle.origin = ( _id_A9706ADAF7C52E27[0], _id_A9706ADAF7C52E27[1], _id_A66785EDEC9E567B );
}

_id_A764B87CDF6D8AC4( points, height )
{
    _id_3C590D0EE220B409 = points[0][0];
    _id_C978C90E8E5AB1F7 = points[0][0];
    _id_3C590C0EE220B1D6 = points[0][1];
    _id_C978C80E8E5AAFC4 = points[0][1];

    foreach ( point in points )
    {
        if ( _id_3C590D0EE220B409 > point[0] )
            _id_3C590D0EE220B409 = point[0];

        if ( _id_C978C90E8E5AB1F7 < point[0] )
            _id_C978C90E8E5AB1F7 = point[0];

        if ( _id_3C590C0EE220B1D6 > point[1] )
            _id_3C590C0EE220B1D6 = point[1];

        if ( _id_C978C80E8E5AAFC4 < point[1] )
            _id_C978C80E8E5AAFC4 = point[1];
    }

    center = ( ( _id_C978C90E8E5AB1F7 + _id_3C590D0EE220B409 ) / 2, ( _id_C978C80E8E5AAFC4 + _id_3C590C0EE220B1D6 ) / 2, height );
    radiussq = 0;

    foreach ( point in points )
    {
        distsq = distance2dsquared( center, point );

        if ( radiussq <= distsq )
            radiussq = distsq;
    }

    return [ center, sqrt( radiussq ) ];
}

_id_9E357E07833A0D1A( team )
{
    level endon( "game_ended" );
    self endon( "task_ended" );
    wait 3;

    for (;;)
    {
        if ( !isdefined( self._id_B0F4BF8621B96C0A ) || self._id_B0F4BF8621B96C0A.size == 0 || !isdefined( self.icon ) )
            return;

        players = scripts\mp\utility\teams::getteamdata( team, "players" );

        foreach ( player in players )
        {
            showicon = 1;

            foreach ( circle in self._id_B0F4BF8621B96C0A )
            {
                if ( !isdefined( circle.mapcircle ) )
                    continue;

                dist = distance2dsquared( player.origin, circle.mapcircle.origin );

                if ( dist <= circle.mapcircle.origin[2] * circle.mapcircle.origin[2] )
                {
                    showicon = 0;
                    break;
                }
            }

            if ( showicon )
            {
                _id_FBF23AE15945EE5A( player );
                continue;
            }

            _id_401535E3FA9E171C( player );
        }

        wait 1.0;
    }
}

_id_A9F8002E49A69313( dialog, _id_FABF84450735DD93 )
{
    _id_CB3339ECE72DBDEB = game["dialog"][dialog];

    foreach ( _id_B2810E8D06E0A042 in scripts\mp\utility\teams::getteamdata( _id_FABF84450735DD93, "players" ) )
        _id_B2810E8D06E0A042 queuedialogforplayer( _id_CB3339ECE72DBDEB, dialog, 2 );
}

_id_4ED64AE8FC231A27( icon, _id_FABF84450735DD93, location, zoffset, waittime, _id_024C76FC549F7FD9 )
{
    level endon( "game_ended" );
    self endon( "RemoveIcon" );

    if ( isdefined( waittime ) )
        wait( waittime );
    else
        waitframe();

    _id_0E88784387008BD2( icon, _id_FABF84450735DD93, location, zoffset, _id_024C76FC549F7FD9 );
}

_id_05A2F918C5578514( icon, _id_FABF84450735DD93, entity, zoffset, _id_024C76FC549F7FD9 )
{
    _id_0E88784387008BD2( icon, _id_FABF84450735DD93, entity.origin, zoffset, _id_024C76FC549F7FD9 );
    scripts\mp\objidpoolmanager::update_objective_onentity( self.objidnum, entity );

    if ( isdefined( zoffset ) )
        scripts\mp\objidpoolmanager::update_objective_setzoffset( self.objidnum, zoffset );
}

_id_0E88784387008BD2( icon, _id_FABF84450735DD93, location, zoffset, _id_024C76FC549F7FD9 )
{
    if ( !isdefined( zoffset ) )
        zoffset = 0;

    self.curorigin = location;
    self.offset3d = ( 0, 0, zoffset );
    scripts\mp\gameobjects::requestid( 1, 1, undefined, 1 );
    scripts\mp\objidpoolmanager::update_objective_icon( self.objidnum, icon );

    if ( isdefined( _id_FABF84450735DD93 ) )
        scripts\mp\objidpoolmanager::objective_teammask_single( self.objidnum, _id_FABF84450735DD93 );
    else
        objective_removeallfrommask( self.objidnum );

    scripts\mp\objidpoolmanager::update_objective_state( self.objidnum, scripts\engine\utility::ter_op( isdefined( _id_024C76FC549F7FD9 ), _id_024C76FC549F7FD9, "invisible" ) );
}

_id_188BF2B5951A0060( _id_ADBAB86D1C12E542 )
{
    self._id_04F84F5E80FF9F3B = _id_ADBAB86D1C12E542;
    scripts\mp\objidpoolmanager::update_objective_onentity( self.objidnum, _id_ADBAB86D1C12E542 );
}

_id_30C89AC91CFAE119( _id_FABF84450735DD93 )
{
    if ( isdefined( _id_FABF84450735DD93 ) && isdefined( self.objidnum ) )
        scripts\mp\objidpoolmanager::objective_teammask_single( self.objidnum, _id_FABF84450735DD93 );
}

_id_E8D8DF3DA4392F0F( _id_FABF84450735DD93 )
{
    if ( isdefined( _id_FABF84450735DD93 ) && isdefined( self.objidnum ) )
    {
        objective_removeteamfrommask( self.objidnum, _id_FABF84450735DD93 );
        objective_showtoplayersinmask( self.objidnum );
    }
}

_id_D062142F367ED7B2()
{
    self notify( "RemoveIcon" );

    if ( isdefined( self ) && isdefined( self.objidnum ) )
        scripts\mp\gameobjects::releaseid();
}

_id_F76241DB305FB78F( entity, zoffset )
{
    if ( !isdefined( zoffset ) )
        zoffset = 50;

    _id_C847BFD52C064289( entity.origin );
    self.icon linkto( entity, "tag_origin", ( 0, 0, zoffset ), ( 0, 0, 0 ) );
}

_id_C847BFD52C064289( origin, type )
{
    icon = spawn( "script_model", origin );
    icon setmodel( "dmz_activity_icon_xmodel" );

    if ( !isdefined( type ) )
        type = self._id_EFA8EF05B190D7D0.type;

    icon setscriptablepartstate( "dmz_activity_icon", type );
    icon hide();
    self.icon = icon;
}

_id_FBF23AE15945EE5A( player )
{
    if ( isdefined( self.icon ) )
        self.icon showtoplayer( player );
}

_id_A92867E16C21DA22( team )
{
    foreach ( player in scripts\mp\utility\teams::getteamdata( team, "players" ) )
        _id_FBF23AE15945EE5A( player );
}

_id_401535E3FA9E171C( player )
{
    if ( isdefined( self.icon ) )
        self.icon hidefromplayer( player );
}

_id_743033B2E6C2D930( team )
{
    foreach ( player in scripts\mp\utility\teams::getteamdata( team, "players" ) )
        _id_401535E3FA9E171C( player );
}

_id_629ED367D1393020()
{
    if ( isdefined( self.icon ) )
        self.icon delete();
}

_id_CEF2ED613A8338BE( location )
{
    if ( isdefined( self.icon ) )
        self.icon.origin = location;
}

_id_1F56932B47981CBB( _id_26F853388D329915 )
{
    if ( isdefined( self.icon ) )
        self.icon setscriptablepartstate( "dmz_activity_icon", _id_26F853388D329915 );
}

_id_9BE29AD72A155EE1( _id_B37714A572B93F0E )
{
    self endon( "death" );
    weaponname = "intel_pickup_phone";

    if ( isdefined( _id_B37714A572B93F0E ) )
        weaponname = _id_B37714A572B93F0E;

    if ( istrue( self.insertingarmorplate ) )
    {
        self notify( "try_armor_cancel" );

        while ( isdefined( self.currentweapon ) && isdefined( self.currentweapon.basename ) && self.currentweapon.basename == "iw9_armor_plate_deploy_mp" )
            waitframe();

        waitframe();
    }

    self notify( "cancel_all_killstreak_deployments" );

    while ( scripts\cp_mp\utility\killstreak_utility::iskillstreakdeployweapon( self getcurrentweapon() ) )
        waitframe();

    omnvar = _id_32E9314DEAF4C7BE( weaponname );
    _id_3B64EB40368C1450::set( "show_intel", "weapon_switch", 0 );
    _id_3B64EB40368C1450::set( "show_intel", "mantle", 0 );
    _id_3B64EB40368C1450::set( "show_intel", "prone", 0 );
    _id_3B64EB40368C1450::set( "show_intel", "melee", 0 );
    _id_3B64EB40368C1450::set( "show_intel", "offhand_weapons", 0 );
    _id_3B64EB40368C1450::set( "show_intel", "weapon_pickup", 0 );
    _id_3B64EB40368C1450::set( "show_intel", "usability", 0 );
    _id_3B64EB40368C1450::set( "show_intel", "vehicle_use", 0 );
    currentweapon = self getcurrentweapon();
    _id_2FAA2C4B7D9E16E4 = makeweapon( weaponname );
    scripts\cp_mp\utility\inventory_utility::_giveweapon( _id_2FAA2C4B7D9E16E4 );
    self switchtoweapon( _id_2FAA2C4B7D9E16E4 );
    self setclientomnvar( "ui_tablet_usb", omnvar );
    wait( _id_2D0D55D0D1148C4D( weaponname ) );
    self takeweapon( _id_2FAA2C4B7D9E16E4 );
    self switchtoweapon( currentweapon );
    _id_3B64EB40368C1450::_id_C9D0B43701BDBA00( "show_intel" );
    self setclientomnvar( "ui_tablet_usb", 0 );
}

_id_32E9314DEAF4C7BE( _id_D5958F44DF33323A )
{
    switch ( _id_D5958F44DF33323A )
    {
        case "intel_pickup_phone":
            return 1;
        case "intel_call_phone":
            return 2;
        case "intel_put_usb_in_tablet":
            return 3;
        case "intel_found_usb":
            return 8;
        default:
            return 0;
    }
}

_id_2D0D55D0D1148C4D( _id_D5958F44DF33323A )
{
    switch ( _id_D5958F44DF33323A )
    {
        case "intel_pickup_phone":
            return 4;
        case "intel_call_phone":
            return 3;
        case "intel_put_usb_in_tablet":
            return 4.5;
        case "intel_found_usb":
            return 4;
    }

    return 5;
}

_id_CD4F277CF0D6A560( _id_FABF84450735DD93, _id_52C67624A2BB680E )
{
    if ( !isdefined( _id_52C67624A2BB680E ) )
        _id_52C67624A2BB680E = self._id_EFA8EF05B190D7D0._id_723B8F7CB71CEB11;

    foreach ( player in scripts\mp\utility\teams::getteamdata( _id_FABF84450735DD93, "players" ) )
        player _id_6AFF3948CF4CCA03::playerplunderpickup( _id_52C67624A2BB680E );
}

_id_84E79AB809A8EEA3( _id_5E671FC71E72D5E8, _id_644A33D86D8514BF )
{
    self._id_EFA8EF05B190D7D0 _id_03314ADD7998AB13::_id_018D4E8025EC24A0( self, _id_5E671FC71E72D5E8, _id_644A33D86D8514BF );
}

_id_6F6F83AB76483811( instance, player )
{
    if ( !isdefined( instance ) || !isdefined( instance._id_B8EBE3F71A08AB40 ) )
        return;

    _id_B8EBE3F71A08AB40 = instance._id_B8EBE3F71A08AB40;

    if ( scripts\engine\utility::array_contains( _id_B8EBE3F71A08AB40.teams, player.team ) )
        _id_B8EBE3F71A08AB40 _id_84E79AB809A8EEA3( player.team );
}

_id_8158903A6E2F32FD( _id_B8EBE3F71A08AB40, player )
{
    return isdefined( _id_B8EBE3F71A08AB40 ) && isdefined( _id_B8EBE3F71A08AB40.teams ) && isdefined( player ) && isdefined( player.team ) && scripts\engine\utility::array_contains( _id_B8EBE3F71A08AB40.teams, player.team );
}

_id_65A2513D3692EA1A( _id_FABF84450735DD93 )
{
    _id_1759ACFD39BB5EDF( "dmz_generic_" + self._id_EFA8EF05B190D7D0.type + "_mission_assigned", _id_FABF84450735DD93 );
}

_id_A1738A95D7AA8094( _id_1B4ADA49A21B51CA, _id_1BBEB265EF74BC60, _id_723B8F7CB71CEB11, _id_FABF84450735DD93 )
{
    _id_D4FC3B4E84704775 = level._id_1B7407DFFE81E6E8._id_B2F15037287A033A[_id_1BBEB265EF74BC60].index;
    params = _id_64ACB6CE534155B7::packsplashparambits( _id_D4FC3B4E84704775, _id_723B8F7CB71CEB11 );
    _id_4480C6CE37B2BDF3::_id_AE6091699E25D8B4( _id_1B4ADA49A21B51CA, scripts\mp\utility\teams::getteamdata( _id_FABF84450735DD93, "players" ), undefined, params );
}

_id_1759ACFD39BB5EDF( _id_1B4ADA49A21B51CA, _id_FABF84450735DD93 )
{
    _id_4480C6CE37B2BDF3::_id_AE6091699E25D8B4( _id_1B4ADA49A21B51CA, scripts\mp\utility\teams::getteamdata( _id_FABF84450735DD93, "players" ), self.node._id_B205D90302DA2F07 );
}

_id_3A1B792C4EAB210F( _id_1B4ADA49A21B51CA )
{
    _id_4480C6CE37B2BDF3::_id_AE6091699E25D8B4( _id_1B4ADA49A21B51CA, level.players );
}

_id_C9F97BAA0D7F59BF( _id_1B4ADA49A21B51CA, _id_FABF84450735DD93 )
{
    _id_4480C6CE37B2BDF3::_id_AE6091699E25D8B4( _id_1B4ADA49A21B51CA, scripts\engine\utility::array_remove_array( level.players, scripts\mp\utility\teams::getteamdata( _id_FABF84450735DD93, "players" ) ), self.node._id_B205D90302DA2F07 );
}

_id_137D718C82AC0947( _id_FABF84450735DD93 )
{
    if ( !isdefined( level._id_33A2175A9A4306BC ) || !istrue( level._id_33A2175A9A4306BC._id_009BADBB469626F6 ) )
    {
        wait 5.0;
        _id_4480C6CE37B2BDF3::_id_AE6091699E25D8B4( "dmz_contract_reminder", scripts\mp\utility\teams::getteamdata( _id_FABF84450735DD93, "players" ) );
    }
}

_id_1458F4E9320A8AE1( point )
{
    radius = 0;

    if ( point.spawnflags & 4 )
        radius = 256;
    else if ( point.spawnflags & 2 )
        radius = 128;
    else if ( point.spawnflags & 1 )
        radius = 168;

    return radius;
}

_id_70313F3B61E1AEEF()
{
    if ( isdefined( level._id_FE29A5BF2F96B5D3 ) && level._id_FE29A5BF2F96B5D3.size > 1 )
        return level._id_FE29A5BF2F96B5D3;

    return [];
}

_id_739560269BC164CF( _id_FABF84450735DD93 )
{
    foreach ( player in scripts\mp\utility\teams::getteamdata( _id_FABF84450735DD93, "players" ) )
        scripts\cp_mp\utility\game_utility::_id_CFD53C8F6878014F( player );
}

_id_9688F0DC7DFD3D53( _id_FABF84450735DD93 )
{
    foreach ( player in scripts\mp\utility\teams::getteamdata( _id_FABF84450735DD93, "players" ) )
        scripts\cp_mp\utility\game_utility::_id_D7D113D56EF0EF5B( player );
}

_id_42718C89B38E260B( objidnum, teams )
{
    foreach ( team in teams )
        _id_6DAD7E4D170DE4BA( objidnum, team );
}

_id_6DAD7E4D170DE4BA( objidnum, team )
{
    foreach ( player in scripts\mp\utility\teams::getteamdata( team, "players" ) )
    {
        scripts\mp\objidpoolmanager::objective_unpin_player( objidnum, player );
        scripts\mp\objidpoolmanager::_id_7299A742781A5030( 0, player );
    }
}

_id_83DD17F313FFDEC0( _id_7E05C139FBBD8374, _id_5B9C864B21207FF6, _id_B8EBE3F71A08AB40 )
{
    _id_B038ED928EC17A81 = spawnscriptable( "br_loot_cache", _id_7E05C139FBBD8374, _id_5B9C864B21207FF6 );
    _id_B038ED928EC17A81 setscriptablepartstate( "body", "open_usable" );
    _id_C573D8A23F7FAF06( _id_B038ED928EC17A81, [] );
    _id_B038ED928EC17A81._id_B8EBE3F71A08AB40 = _id_B8EBE3F71A08AB40;
    _id_B8EBE3F71A08AB40._id_B038ED928EC17A81 = _id_B038ED928EC17A81;
    return _id_B038ED928EC17A81;
}

_id_C573D8A23F7FAF06( _id_B038ED928EC17A81, teams )
{
    validplayers = [];

    foreach ( team in teams )
        validplayers = scripts\engine\utility::array_combine( validplayers, scripts\mp\utility\teams::getteamdata( team, "players" ) );

    foreach ( player in level.players )
    {
        if ( scripts\engine\utility::array_contains( validplayers, player ) )
        {
            _id_B038ED928EC17A81 enablescriptableplayeruse( player );
            continue;
        }

        _id_B038ED928EC17A81 disablescriptableplayeruse( player );
    }
}

_id_F8CD22FB229F4138( _id_52C67624A2BB680E )
{
    return int( _id_52C67624A2BB680E / 25 - 1 );
}

_id_B43E9536B7E60884( player, index )
{
    player _id_64ACB6CE534155B7::setquestindexomnvar( index );
}

_id_B7BBE29ED551EE90( index, tier, _id_FABF84450735DD93 )
{
    foreach ( player in scripts\mp\utility\teams::getteamdata( _id_FABF84450735DD93, "players" ) )
        _id_B43E9536B7E60884( player, index );

    if ( !isdefined( tier ) )
        tier = 1;

    _id_64ACB6CE534155B7::setquestrewardtier( _id_FABF84450735DD93, tier );
}

_id_6D93BE335873296E( player )
{
    player _id_64ACB6CE534155B7::setquestindexomnvar( 0 );
}

_id_83D7EB52598BE0B3( _id_FABF84450735DD93 )
{
    foreach ( player in scripts\mp\utility\teams::getteamdata( _id_FABF84450735DD93, "players" ) )
        _id_6D93BE335873296E( player );
}

_id_5314298E777E5688( ref )
{
    self.ref = ref;
    self._id_30E8A65CFF941C7A = _id_64ACB6CE534155B7::getquesttableindex( self.ref );
    tier = 1;

    if ( isdefined( self._id_EFA8EF05B190D7D0 ) )
    {
        _id_723B8F7CB71CEB11 = self._id_EFA8EF05B190D7D0._id_723B8F7CB71CEB11;
        tier = _id_F8CD22FB229F4138( _id_723B8F7CB71CEB11 );
    }

    foreach ( team in self.teams )
        _id_B7BBE29ED551EE90( self._id_30E8A65CFF941C7A, tier, team );
}

_id_DFFCBCE998C9EE50( _id_FABF84450735DD93 )
{
    key = self._id_65513AD5397A67EF;
    players = scripts\mp\utility\teams::getteamdata( _id_FABF84450735DD93, "players" );

    foreach ( player in players )
        player._id_65513AD5397A67EF = key;
}

_id_45BD3184FF146B46( _id_FABF84450735DD93 )
{
    if ( isdefined( _id_FABF84450735DD93 ) )
    {
        players = scripts\mp\utility\teams::getteamdata( _id_FABF84450735DD93, "players" );

        foreach ( player in players )
            player._id_65513AD5397A67EF = undefined;
    }
}
