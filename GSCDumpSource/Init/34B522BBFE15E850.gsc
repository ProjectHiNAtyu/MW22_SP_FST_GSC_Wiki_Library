// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    enabled = _id_3ACF1C0EBAF602F2::registerquestcategory( "x1fin", 1 );

    if ( !enabled )
        return;

    _id_3ACF1C0EBAF602F2::getquestdata( "x1fin" ).missionbasetimer = getdvarint( "dvar_F2FBE10E70643F15", 180 );
    _id_3ACF1C0EBAF602F2::getquestdata( "x1fin" ).questbasetimer = getdvarint( "dvar_B47A3D9802744129", 240 );
    _id_3ACF1C0EBAF602F2::registerremovequestinstance( "x1fin", ::x1fin_removequestinstance );
    _id_3ACF1C0EBAF602F2::registeronplayerdisconnect( "x1fin", ::x1fin_playerdisconnect );
    _id_3ACF1C0EBAF602F2::registerquestthink( "x1fin", ::x1fin_think, 0.2 );
    _id_3ACF1C0EBAF602F2::registeronrespawn( "x1fin", ::x1fin_respawn );
    _id_3ACF1C0EBAF602F2::questtimerinit( "x1fin", 0 );
    _id_3ACF1C0EBAF602F2::registerontimerexpired( "x1fin", ::x1fin_ontimerexpired );
}

x1fin_respawn( player )
{
    if ( !checkforcorrectinstance( player ) )
        return;

    player _id_3ACF1C0EBAF602F2::uiobjectiveshow( "x1fin" );
    scripts\cp_mp\utility\game_utility::_id_CFD53C8F6878014F( player );
}

x1fin_ontimerexpired()
{
    _id_3ACF1C0EBAF602F2::displayteamsplash( self.team, "br_x1fin_quest_timer_expired" );
    level thread _id_2CEDCC356F1B9FC8::brleaderdialogteam( "mission_gen_fail", self.team, 1 );
}

x1fin_removequestinstance()
{
    _id_3ACF1C0EBAF602F2::releaseteamonquest( self.team );
}

x1fin_playerdisconnect( _id_345221032955C106 )
{
    if ( _id_345221032955C106.team == self.team )
    {
        playerlist = scripts\mp\utility\teams::getteamdata( self.team, "players" );
        _id_3ACF1C0EBAF602F2::getquestinstancedata( "x1fin", self.team ).playerlist = playerlist;

        if ( isdefined( self ) && isdefined( self.cacheentity ) && playerlist.size )
            self.cacheentity setotherent( playerlist[0] );

        if ( !_id_3ACF1C0EBAF602F2::isteamvalid( _id_345221032955C106.team ) )
        {
            self.result = "fail";
            _id_3ACF1C0EBAF602F2::removequestinstance();
        }
        else
        {
            self.goal--;
            _id_5B0188CCC151FBB6( self );
        }
    }
}

checkforcorrectinstance( player )
{
    if ( player.team == self.team )
        return 1;
    else
        return 0;
}

givequest( team, id, player, modifier, rewardscriptable )
{
    instance = _id_3ACF1C0EBAF602F2::createquestinstance( "x1fin", team, id, rewardscriptable );
    instance.modifier = modifier;

    if ( !isdefined( instance.modifier ) )
        instance.modifier = "";

    instance _id_3ACF1C0EBAF602F2::registerteamonquest( team, player );
    instance.team = team;
    instance.playerlist = scripts\mp\utility\player::getteamarray( instance.team );

    if ( instance.modifier != "_all" )
        instance _id_3ACF1C0EBAF602F2::questtimerset( _id_3ACF1C0EBAF602F2::getquestdata( "x1fin" ).questbasetimer, 4 );

    if ( instance.modifier == "_all_timed" )
        level.teamdata[team]["hasFailed"] = 0;

    _id_3ACF1C0EBAF602F2::addquestinstance( "x1fin", instance );
    _id_3ACF1C0EBAF602F2::startteamcontractchallenge( "x1fin", player, instance.team );
    params = spawnstruct();
    params.excludedplayers = [];
    params.excludedplayers[0] = player;
    _id_3ACF1C0EBAF602F2::displayteamsplash( player.team, "br_x1fin_quest_start_team_notify", params );
    _id_3ACF1C0EBAF602F2::displayplayersplash( player, "br_x1fin_quest_start_tablet_finder", params );

    if ( !isdefined( level.x1opsnpcs.npcbodies ) )
        level.x1opsnpcs.npcbodies = [];

    bodyindex = level.x1opsnpcs.npcbodies.size;
    _id_0BE9720EAAAA043E = bodyindex % level.x1opsnpcs.locationsnames.size;
    instance.x1opsnpc = x1opsspawnnpc( "body_mp_western_woods_1_1_lod1_reveal", "head_mp_western_woods_1_1", "j_spine4", "sksierra_script", _id_0BE9720EAAAA043E );
    level.x1opsnpcs.npcbodies[bodyindex] = instance.x1opsnpc;
    instance._id_F5CA237F98FB4CF6 = gettime() + level.brgametype._id_28EBAC07FDF67F25;
    instance thread updatex1finhud( _id_0BE9720EAAAA043E );
    instance _x1opsassignnpctoteam( team, _id_0BE9720EAAAA043E );
    waitframe();
    instance thread _x1opsnpcwaittilluse();
    _id_3ACF1C0EBAF602F2::uiobjectiveshowtoteam( "x1fin", instance.team );
    instance thread _id_6512C7640A59EC83();
    return instance;
}

applyquest()
{
    player = self;

    if ( isdefined( level.questinfo.quests["x1fin"].instances[player.team] ) )
        return;

    instance = givequest( player.team, "", player, "_all_timed" );

    if ( isdefined( instance ) )
    {
        instance thread _id_0D2B101E058D6F26();
        instance thread oninstanceremoved();
    }

    instance.progress = 0;
    instance.goal = instance.playerlist.size;
    return instance;
}

oninstanceremoved()
{
    instance = self;
    instance waittill( "removed" );
    index = scripts\engine\utility::array_find( level.x1opsnpcs.npcbodies, instance.x1opsnpc );
    scripts\engine\utility::array_remove( level.x1opsnpcs.npcbodies, level.x1opsnpcs.npcbodies[index] );
    instance notify( "update" );
}

updatex1finhud( _id_6E5D2CDD21F298DE )
{
    foreach ( player in self.playerlist )
    {
        player _id_3ACF1C0EBAF602F2::uiobjectiveshow( "x1fin" );
        player _id_3ACF1C0EBAF602F2::uiobjectivesetparameter( _id_6E5D2CDD21F298DE );
    }
}

hidex1finhudfromplayer( player )
{
    player _id_3ACF1C0EBAF602F2::uiobjectivehide();
}

deletex1finhud()
{
    foreach ( player in self.playerlist )
        hidex1finhudfromplayer( player );

    _id_3ACF1C0EBAF602F2::uiobjectivehidefromteam( self.team );
}

completex1finquest()
{
    params = spawnstruct();
    rewardtier = _id_3ACF1C0EBAF602F2::getquestrewardtier( self.team );
    missionid = _id_3ACF1C0EBAF602F2::getquestindex( "x1fin" );
    _id_11D65784F0B6AFA2 = _id_3ACF1C0EBAF602F2::getquestrewardgroupindex( _id_3ACF1C0EBAF602F2::getquestrewardbuildgroupref( "x1fin" ) );
    params.packedbits = _id_3ACF1C0EBAF602F2::packsplashparambits( missionid, rewardtier, _id_11D65784F0B6AFA2 );
    _id_3ACF1C0EBAF602F2::displayteamsplash( self.team, "br_x1fin_quest_complete" );
    deletex1finhud();
    self.rewardorigin = self.playerlist[0].origin;
    self.rewardangles = self.playerlist[0].angles;
    self.result = "success";
    _id_3ACF1C0EBAF602F2::removequestinstance();
}

failx1finquest()
{
    deletex1finhud();
    self.result = "fail";
    _id_3ACF1C0EBAF602F2::removequestinstance();
}

_id_5B0188CCC151FBB6( instance )
{
    if ( instance.progress >= instance.goal )
    {
        foreach ( player in level.teamdata[instance.team]["players"] )
            player scripts\cp_mp\calloutmarkerping::calloutmarkerping_removecallout( 7 );

        instance.x1opsnpc notify( "x1ContractCompleted" );
        instance completex1finquest();
        scripts\mp\objidpoolmanager::objective_playermask_hidefromall( instance.x1opsnpc.objectiveiconid );
        instance.progress = undefined;
        setteamradar( instance.team, 1 );
        setteamradarstrength( instance.team, 1 );
        return 1;
    }

    return 0;
}

x1fin_think()
{
    instance = self;
    instance.x1opsnpc endon( "death" );
    instance.x1opsnpc endon( "x1ContractCompleted" );
    level endon( "game_ended" );

    if ( _id_5B0188CCC151FBB6( instance ) )
        return;

    if ( !isdefined( instance._id_F5CA237F98FB4CF6 ) )
        instance._id_F5CA237F98FB4CF6 = gettime() + level.brgametype._id_28EBAC07FDF67F25;

    if ( gettime() >= instance._id_F5CA237F98FB4CF6 )
    {
        instance._id_F5CA237F98FB4CF6 = gettime() + level.brgametype._id_28EBAC07FDF67F25;
        instance thread _id_5F5288DF243746E3();
    }
}

_id_5F5288DF243746E3()
{
    instance = self;
    _id_00960823DCF1E65D = randomint( 4 ) + 1;
    animalias = "sdr_mp_xpromo_woods_nag_0" + scripts\engine\utility::string( _id_00960823DCF1E65D );
    soundalias = "dx_mpb_wood_flavor_hurryup_" + _id_00960823DCF1E65D + "0";
    instance.x1opsnpc scriptmodelplayanim( animalias );
    instance.x1opsnpc.x1opsnpcheadmodel scriptmodelplayanim( animalias );
    instance.x1opsnpc.x1opsnpcheadmodel playsoundtoteam( soundalias, instance.team );
    _id_397E83BD0FEB6399 = 0;

    switch ( _id_00960823DCF1E65D )
    {
        case 1:
            _id_397E83BD0FEB6399 = getanimlength( level._id_1A209BD995A7FA83["sdr_mp_xpromo_woods_nag_01"] );
            break;
        case 2:
            _id_397E83BD0FEB6399 = getanimlength( level._id_1A209BD995A7FA83["sdr_mp_xpromo_woods_nag_02"] );
            break;
        case 3:
            _id_397E83BD0FEB6399 = getanimlength( level._id_1A209BD995A7FA83["sdr_mp_xpromo_woods_nag_03"] );
            break;
        case 4:
            _id_397E83BD0FEB6399 = getanimlength( level._id_1A209BD995A7FA83["sdr_mp_xpromo_woods_nag_04"] );
            break;
        case 5:
            _id_397E83BD0FEB6399 = getanimlength( level._id_1A209BD995A7FA83["sdr_mp_xpromo_woods_nag_05"] );
            break;
    }

    wait( _id_397E83BD0FEB6399 );
    instance.x1opsnpc scriptmodelplayanim( "sdr_mp_xpromo_woods_idle_01" );
    instance.x1opsnpc.x1opsnpcheadmodel scriptmodelplayanim( "sdr_mp_xpromo_woods_idle_01" );
}

_id_6512C7640A59EC83()
{
    instance = self;
    instance.x1opsnpc endon( "death" );
    instance.x1opsnpc endon( "x1ContractCompleted" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( istrue( instance.forcefail ) )
        {
            instance failx1finquest();
            return;
        }

        wait 0.5;
    }
}

x1opsspawnnpc( bodymodelname, headmodelname, _id_06B509A0E0D2ED88, _id_A1A0A176D7628BC2, index )
{
    _id_3C4CAED075385F02 = level.x1opsnpcs.origins[index];
    _id_9A46EC338598FF9E = spawn( "script_model", _id_3C4CAED075385F02 );
    _id_9A46EC338598FF9E setmodel( bodymodelname );
    _id_9A46EC338598FF9E.angles = level.x1opsnpcs.rotations[index];

    if ( !isdefined( _id_9A46EC338598FF9E.x1opsnpcheadmodel ) )
    {
        x1opsnpcheadmodel = spawn( "script_model", _id_3C4CAED075385F02 );
        x1opsnpcheadmodel setmodel( headmodelname );
        x1opsnpcheadmodel linkto( _id_9A46EC338598FF9E, _id_06B509A0E0D2ED88, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        _id_9A46EC338598FF9E.x1opsnpcheadmodel = x1opsnpcheadmodel;
    }

    if ( !isdefined( _id_9A46EC338598FF9E.x1opsnpcweaponreceivermodel ) )
    {
        x1opsnpcweaponreceivermodel = spawn( "script_model", _id_3C4CAED075385F02 );
        x1opsnpcweaponreceivermodel setmodel( _id_A1A0A176D7628BC2 );
        x1opsnpcweaponreceivermodel linkto( _id_9A46EC338598FF9E, "tag_inhand", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        _id_9A46EC338598FF9E.x1opsnpcweaponreceivermodel = x1opsnpcweaponreceivermodel;
    }

    _id_9A46EC338598FF9E makeusable();
    _id_9A46EC338598FF9E disableplayeruseforallplayers();
    _id_9A46EC338598FF9E setcursorhint( "HINT_NOICON" );
    _id_9A46EC338598FF9E setuseholdduration( "duration_none" );
    _id_9A46EC338598FF9E sethintdisplayfov( 120 );
    _id_9A46EC338598FF9E setusefov( 120 );
    _id_9A46EC338598FF9E setuserange( 80 );
    _id_9A46EC338598FF9E setusepriority( -1 );
    _id_9A46EC338598FF9E sethintstring( &"MP/X1FIN_RENDEZVOUS" );
    _id_9A46EC338598FF9E sethinttag( "tag_use" );
    _id_9A46EC338598FF9E setuseprioritymax();
    _id_9A46EC338598FF9E scriptmodelplayanim( "sdr_mp_xpromo_woods_idle_01" );
    _id_9A46EC338598FF9E.x1opsnpcheadmodel scriptmodelplayanim( "sdr_mp_xpromo_woods_idle_01" );
    _id_9A46EC338598FF9E.assignedteam = undefined;
    _id_9A46EC338598FF9E hide();
    _id_9A46EC338598FF9E.x1opsnpcheadmodel hide();
    _id_9A46EC338598FF9E.x1opsnpcweaponreceivermodel hide();
    return _id_9A46EC338598FF9E;
}

_x1opsassignnpctoteam( team, _id_0BE9720EAAAA043E )
{
    instance = self;
    x1opsnpc = instance.x1opsnpc;

    if ( isdefined( x1opsnpc.assignedteam ) )
        return;

    x1opsnpc.assignedteam = team;
    instance.x1opsnpc._id_DA4D8774DB3F7B4D = [];

    foreach ( player in scripts\mp\utility\teams::getteamdata( team, "players" ) )
    {
        x1opsnpc enableplayeruse( player );
        x1opsnpc showtoplayer( player );
        x1opsnpc.x1opsnpcheadmodel showtoplayer( player );
        x1opsnpc.x1opsnpcweaponreceivermodel showtoplayer( player );
        instance.x1opsnpc._id_DA4D8774DB3F7B4D[instance.x1opsnpc._id_DA4D8774DB3F7B4D.size] = player;
        player _x1opsplayerunredacttacmaplocation( _id_0BE9720EAAAA043E );
    }
}

x1opsdeletenpcs()
{
    foreach ( x1opsnpc in level.x1opsnpcs.npcbodies )
    {
        x1opsnpc delete();
        x1opsnpc.x1opsnpcheadmodel delete();
        x1opsnpc.x1opsnpcweaponreceivermodel delete();
        x1opsnpc _id_64ACB6CE534155B7::deletequestobjicon();
        x1opsnpc notify( "death" );
    }
}

_x1opsnpcwaittilluse()
{
    instance = self;
    instance.x1opsnpc._id_9AD40E67BC221D56 = 0;
    level endon( "game_ended" );
    instance.x1opsnpc endon( "death" );

    if ( instance.team != instance.x1opsnpc.assignedteam )
        return;

    instance.x1opsnpc _id_3ACF1C0EBAF602F2::createquestobjicon( "ui_mp_br_mapmenu_icon_x1_04_objective", "current", instance.x1opsnpc.origin + ( 0, 0, 85 ) );
    objective_addalltomask( instance.x1opsnpc.objectiveiconid );
    objective_hidefromplayersinmask( instance.x1opsnpc.objectiveiconid );

    for ( _id_3995EC6A46BD14DF = scripts\mp\utility\teams::getteamdata( instance.team, "players" ).size; _id_3995EC6A46BD14DF > instance.x1opsnpc._id_9AD40E67BC221D56; _id_3995EC6A46BD14DF = scripts\mp\utility\teams::getteamdata( instance.team, "players" ).size )
    {
        instance.x1opsnpc waittill( "trigger", player );
        player _x1opsplayerredactalltacmaplocation();

        if ( instance.progress == 0 )
        {
            objective_removeallfrommask( instance.x1opsnpc.objectiveiconid );
            objective_addteamtomask( instance.x1opsnpc.objectiveiconid, instance.team );
            objective_showtoplayersinmask( instance.x1opsnpc.objectiveiconid );
        }

        alias = "dx_mpb_wood_flavor_positive_10";

        if ( soundexists( alias ) )
            instance.x1opsnpc playsoundtoplayer( alias, player );

        instance.x1opsnpc disableplayeruse( player );
        instance.x1opsnpc._id_9AD40E67BC221D56++;
        player scripts\cp_mp\challenges::onunlockitem( "x1_blueprint_weapon" );

        if ( getdvarint( "dvar_A9BF6B9173CB8347", 1 ) )
            _id_95E7B825DF7E7BCA( player );

        instance.progress++;

        if ( instance.progress >= instance.goal )
        {
            instance.x1opsnpc.x1opsnpcweaponreceivermodel hide();
            thread _id_5B0188CCC151FBB6( instance );
            instance.x1opsnpc scriptmodelplayanim( "sdr_mp_xpromo_woods_accept_02" );
            instance.x1opsnpc.x1opsnpcheadmodel scriptmodelplayanim( "sdr_mp_xpromo_woods_accept_02" );
            animduration = getanimlength( level._id_1A209BD995A7FA83["sdr_mp_xpromo_woods_accept_02"] );
            wait( animduration );
            instance.x1opsnpc scriptmodelplayanim( "sdr_mp_xpromo_woods_idle_02" );
            instance.x1opsnpc.x1opsnpcheadmodel scriptmodelplayanim( "sdr_mp_xpromo_woods_idle_02" );
            continue;
        }

        instance.x1opsnpc scriptmodelplayanim( "sdr_mp_xpromo_woods_accept_01" );
    }
}

_x1opsplayerunredacttacmaplocation( _id_0BE9720EAAAA043E )
{
    player = self;
    _id_F50D468C940E852E = level.x1opsnpcs.locationsnames[_id_0BE9720EAAAA043E];

    if ( tableexists( "mp/map_callouts/mp_don3_callouts.csv" ) )
        index = int( tablelookup( "mp/map_callouts/mp_don3_callouts.csv", 1, _id_F50D468C940E852E, 0 ) );
    else
        index = 0;

    player setclientomnvar( "ui_br_x1ops_unredact_area", index );
}

_x1opsplayerredactalltacmaplocation()
{
    player = self;
    player setclientomnvar( "ui_br_x1ops_unredact_area", 0 );
}

_id_95E7B825DF7E7BCA( player )
{
    attachments = [ "barlong_sksierra", "maxammo", "pistolgrip04_sksierra", "rec_sksierra", "smags_sksierra", "snprscope_sksierra" ];
    weaponobj = makeweapon( "iw8_sn_sksierra_mp", attachments );
    _id_724736FCF0FB6604::br_forcegivecustomweapon( player, weaponobj, "iw8_sn_sksierra_mp+barlong_sksierra|2+maxammo+pistolgrip04_sksierra|2+rec_sksierra|7+smags_sksierra|3+snprscope_sksierra|2+loot7", "iw8_sn_sksierra_mp" );
}

_id_0D2B101E058D6F26()
{
    instance = self;
    instance endon( "update" );
    level waittill( "x1fin_failstate" );

    if ( instance.x1opsnpc.objectiveiconid != -1 )
    {
        objective_removeallfrommask( instance.x1opsnpc.objectiveiconid );
        objective_addteamtomask( instance.x1opsnpc.objectiveiconid, instance.team );
        objective_showtoplayersinmask( instance.x1opsnpc.objectiveiconid );
    }
}

_id_61E37FD29263F449( timer )
{
    level endon( "game_ended" );
    level endon( "x1Ops6Start" );

    if ( timer <= 0 )
        timer = 1;

    wait( timer );
    level notify( "x1fin_failstate" );
}
