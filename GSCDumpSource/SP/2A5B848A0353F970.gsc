// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init_gamer_profile()
{
    if ( level.script == level.missionsettings.levels[0].name && !level.player _meth_569AC32FF1837D7C( "hasEverPlayed_SP" ) )
        scripts\engine\utility::delaythread( 0.1, ::update_gamer_profile );
}

update_gamer_profile()
{
    level.player _meth_98122FA7C7A078D8( "hasEverPlayed_SP", 1 );
    _func_71B5F6B0E248E225();
}
