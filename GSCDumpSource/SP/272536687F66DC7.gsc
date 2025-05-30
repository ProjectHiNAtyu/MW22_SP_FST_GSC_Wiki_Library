// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

precache( offhand )
{
    level.offhands._id_E1D317C7329AC2D2 = spawnstruct();
    level.offhands._id_E1D317C7329AC2D2._id_83FC771306EDED0F = [];
    scripts\sp\equipment\offhands::registeroffhandfirefunc( offhand, ::_id_8A9F51E377F0E1AF );
}

_id_8A9F51E377F0E1AF( grenade, weapon )
{
    if ( !isdefined( grenade ) )
        return;

    self notify( "player_improvisedMinePlaced" );
    thread _id_F5964C57CC8DA167( grenade, self, self.team, weapon );
}

_id_F5964C57CC8DA167( grenade, _id_EC0C4E7C490C12D5, team, _id_04FA68E590A2BCF6 )
{
    grenade endon( "entitydeleted" );
    grenade endon( "death" );
    _id_EC0C4E7C490C12D5 endon( "death" );
    level.offhands._id_E1D317C7329AC2D2._id_83FC771306EDED0F = scripts\engine\utility::array_add( level.offhands._id_E1D317C7329AC2D2._id_83FC771306EDED0F, grenade );
    grenade.team = scripts\engine\utility::_id_53C4C53197386572( _id_EC0C4E7C490C12D5.team, team );
    grenade setentityowner( _id_EC0C4E7C490C12D5 );
    grenade setotherent( _id_EC0C4E7C490C12D5 );
    grenade makeunusable();
    grenade.targetname = "offhand_car_grenade";
    grenade waittill( "missile_stuck" );
    grenade setcandamage( 1 );
    thread scripts\sp\equipment\offhands::_id_6E5CE23490C6FEA6( grenade, _id_04FA68E590A2BCF6, &"EQUIPMENT/IMPROVISED_MINE_PICKUP" );
    grenade childthread _id_D5B93C92C3F30A80( _id_EC0C4E7C490C12D5 );
    grenade thread _id_57ABE555DD7DD3B8( _id_EC0C4E7C490C12D5 );
}

_id_180C6F276018E945()
{
    _id_5A532B3D41B19C7A = getaiarrayinradius( self.origin, 200, "axis" );

    foreach ( _id_A09E6D340590460A in _id_5A532B3D41B19C7A )
    {
        if ( !isdefined( _id_A09E6D340590460A.stealth ) )
            continue;

        _id_A09E6D340590460A aieventlistenerevent( "investigate", self, self.origin );
    }
}

_id_FC5CA7252F44256A( _id_EC0C4E7C490C12D5, _id_FF882F75755F7367 )
{
    _id_EC0C4E7C490C12D5 endon( "death" );
    _id_EC0C4E7C490C12D5 endon( "detonate" );

    for (;;)
    {
        scripts\sp\player\cursor_hint::create_cursor_hint( undefined, ( 0, 0, 5 ), &"EQUIPMENT/IMPROVISED_MINE_PICKUP", 55, 100, 70, 0 );
        childthread scripts\sp\equipment\offhands::_id_BB7D0FD0262D852D( &"EQUIPMENT/IMPROVISED_MINE_PICKUP", _id_FF882F75755F7367 );
        self waittill( "trigger" );
        pickedup = scripts\sp\equipment\offhands::_id_E2C7F0ED80637008( _id_FF882F75755F7367 );

        if ( !pickedup )
            continue;
        else
        {
            if ( isdefined( self ) )
            {
                if ( isdefined( self.trigger ) )
                    self.trigger delete();
            }

            self delete();
            return;
        }
    }
}

_id_D5B93C92C3F30A80( _id_EC0C4E7C490C12D5 )
{
    self endon( "entitydeleted" );
    self.trigger = spawn( "trigger_radius", self.origin, 23, 55, 72 );
    wait 2.0;

    for (;;)
    {
        self.trigger waittill( "trigger", _id_02087E4030AA793B );

        if ( !scripts\engine\utility::is_equal( _id_02087E4030AA793B.team, self.team ) )
            break;

        if ( !isdefined( _id_02087E4030AA793B.velocity ) )
            continue;

        if ( !length( _id_02087E4030AA793B.velocity ) )
            continue;
    }

    thread _id_5A73691D0868CA47( _id_EC0C4E7C490C12D5 );
}

_id_57ABE555DD7DD3B8( _id_EC0C4E7C490C12D5 )
{
    self endon( "entitydeleted" );
    _id_EC0C4E7C490C12D5 endon( "death" );

    for (;;)
    {
        self waittill( "damage", _id_DDD80F5D1DA23C60, attacker, _id_DDD80F5D1DA23C60, _id_DDD80F5D1DA23C60, meansofdeath );

        if ( !isplayer( attacker ) )
            continue;

        if ( meansofdeath == "MOD_MELEE" )
            continue;

        if ( meansofdeath == "MOD_IMPACT" && scripts\engine\utility::is_equal( attacker.team, self.team ) )
            continue;

        thread _id_5A73691D0868CA47( attacker );
        break;
    }
}

_id_5A73691D0868CA47( attacker )
{
    earthquake( 0.25, 0.35, self.origin, 1000 );
    playrumbleonposition( "grenade_rumble", self.origin );

    if ( scripts\engine\trace::ray_trace_passed( self.origin, level.player geteye(), self, scripts\engine\trace::create_world_contents() ) )
    {
        _id_A830AA21C1B60A3C = distancesquared( level.player.origin, self.origin );

        if ( _id_A830AA21C1B60A3C <= 10000 )
            level.player scripts\sp\utility::do_damage( 99999, self.origin, attacker, self, "MOD_EXPLOSIVE" );
        else if ( _id_A830AA21C1B60A3C <= 16900 )
            level.player shellshock( "default_nosound", 2.0 );
    }

    enemies = getaiarrayinradius( self.origin, 350 );

    foreach ( enemy in enemies )
        enemy scripts\sp\utility::do_damage( 2000, self.origin, attacker, self, "MOD_EXPLOSIVE" );

    if ( isdefined( self ) )
    {
        if ( isdefined( self.trigger ) )
            self.trigger delete();

        _id_DC31EF5A2D33BE25();
        scripts\sp\player\cursor_hint::remove_cursor_hint();
        self detonate();
    }

    _func_1C1B9D33706C152D( attacker, "explosion" );
}

_id_DC31EF5A2D33BE25()
{
    level.offhands._id_E1D317C7329AC2D2._id_83FC771306EDED0F = scripts\engine\utility::array_remove( level.offhands._id_E1D317C7329AC2D2._id_83FC771306EDED0F, self );
}
