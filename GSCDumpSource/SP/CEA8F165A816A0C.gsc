// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    scripts\stealth\manager::main();
}

set_stealth_mode( enabled, _id_BD2621A5F467FE6C, _id_A1F4D479A8C138CD )
{
    if ( enabled )
    {
        if ( isdefined( _id_BD2621A5F467FE6C ) && isdefined( _id_A1F4D479A8C138CD ) )
            level thread scripts\stealth\utility::stealth_music( _id_BD2621A5F467FE6C, _id_A1F4D479A8C138CD );

        level thread scripts\stealth\threat_sight::threat_sight_set_enabled( 1 );

        foreach ( player in level.players )
            player thread scripts\stealth\player::main();
    }
    else
    {
        level thread scripts\stealth\utility::stealth_music_stop();
        level thread scripts\stealth\threat_sight::threat_sight_set_enabled( 0 );
    }

    if ( isdefined( level.stealth.fnsetstealthmode ) )
        level thread [[ level.stealth.fnsetstealthmode ]]( enabled, _id_BD2621A5F467FE6C, _id_A1F4D479A8C138CD );
}
