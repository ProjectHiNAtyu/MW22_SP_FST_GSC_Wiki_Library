// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_98A4E2A877EF7BB1()
{
    scripts\cp_mp\utility\script_utility::registersharedfunc( "reconDrone", "onSuperStarted", ::_id_52D2DE9AD62CAE12 );
}

_id_52D2DE9AD62CAE12()
{
    if ( scripts\cp_mp\utility\game_utility::_id_0BEFF479639E6508() && !scripts\mp\flags::gameflag( "prematch_fade_done" ) )
        thread _id_5A031333C402A6CE();
}

_id_5A031333C402A6CE()
{
    self endon( "death_or_disconnect" );
    self endon( "reconDroneEnded" );
    self endon( "reconDroneUnset" );
    scripts\mp\flags::gameflagwait( "prematch_fade_done" );
    objweapon = makeweapon( "ks_remote_drone_mp" );

    if ( self hasweapon( objweapon ) )
        scripts\cp_mp\utility\inventory_utility::_takeweapon( objweapon );
}
