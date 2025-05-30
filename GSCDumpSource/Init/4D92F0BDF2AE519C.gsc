// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

hostmigration_waitlongdurationwithpause( duration )
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "hostmigration", "waitLongDurationWithPause" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "hostmigration", "waitLongDurationWithPause" ) ]]( duration );
    else
        wait( duration );
}

hostmigration_waittillnotifyortimeoutpause( msg, duration )
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "hostmigration", "waittillNotifyOrTimeoutPause" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "hostmigration", "waittillNotifyOrTimeoutPause" ) ]]( msg, duration );
    else
        scripts\engine\utility::waittill_any_timeout_1( duration, msg );
}
