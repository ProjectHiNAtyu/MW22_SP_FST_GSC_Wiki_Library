// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

precache( offhand )
{
    scripts\sp\equipment\offhands::registeroffhandfirefunc( offhand, ::semtexfiremain );
}

semtexfiremain( grenade, weapon, _id_CFD88798AF9072E4 )
{
    if ( !isdefined( grenade ) )
        return;

    if ( isai( self ) )
    {
        thread _id_0F4E8D02D2F70888::evaluateattackevent( "frag" );
        grenade setentityowner( self );
        grenade setotherent( self );
    }

    grenade makeunusable();
    grenade thread semtex_watch_beacon( self, _id_CFD88798AF9072E4 );
    grenade thread semtex_watch_stuck();
    grenade thread semtex_watch_fuse();
}

semtex_watch_beacon( attacker, _id_CFD88798AF9072E4 )
{
    currentstate = self getscriptablepartstate( "state" );
    self endon( "entitydeleted" );

    if ( currentstate == "beacon_ai" || currentstate == "beacon" )
        return;

    if ( isai( attacker ) )
    {
        _id_DB4CC438CCD1B2B3 = 2;

        if ( isdefined( _id_CFD88798AF9072E4 ) )
            _id_DB4CC438CCD1B2B3 = _id_CFD88798AF9072E4;

        self setscriptablepartstate( "state", "beacon_ai", 0 );
        wait( _id_DB4CC438CCD1B2B3 );
    }

    self setscriptablepartstate( "state", "beacon", 0 );
}

semtex_watch_stuck()
{
    self endon( "death" );
    self waittill( "missile_stuck", stuckto );

    if ( isai( stuckto ) && isalive( stuckto ) )
        semtexstucktoenemy( self, stuckto );

    if ( isplayer( stuckto ) && isalive( stuckto ) )
        semtexstucktoplayer();
}

semtexstucktoplayer()
{
    if ( isdefined( level.func["semtex_player_stuck_workaround"] ) )
        self thread [[ level.func["semtex_player_stuck_workaround"] ]]();
}

semtexstucktoenemy( grenade, enemy, origin )
{
    enemy._blackboard.isburning = 1;
    enemy.burningtodeath = 0;
    enemy.burningdirection = undefined;
    enemy.semtexstuckto = 1;
    _id_013E753F7FE12D1B = anglestoright( enemy.angles );
    _id_F3982EE60FBBA2EE = vectornormalize( grenade.origin - enemy.origin );

    if ( vectordot( _id_013E753F7FE12D1B, _id_F3982EE60FBBA2EE ) > 0 )
        enemy.burningdirection = "right";
    else
        enemy.burningdirection = "left";

    enemy scripts\sp\utility::do_damage( 1, grenade.origin, grenade.owner, grenade.owner, "MOD_GRENADE", "molotov" );
    level thread scripts\sp\equipment\offhands::remove_blackboard_isburning( enemy );
    grenade.stucktoai = enemy;
}

semtex_watch_fuse()
{
    self waittill( "explode", org );
    playrumbleonposition( "grenade_rumble", org );
    earthquake( 0.45, 0.7, org, 800 );
}
