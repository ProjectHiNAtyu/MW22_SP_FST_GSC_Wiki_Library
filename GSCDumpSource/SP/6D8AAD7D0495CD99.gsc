// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init_vehicle_heavy_destruction()
{

}

reverse_impact_think()
{
    self endon( "stop_heavy_damage" );
    self setcandamage( 1 );
    _id_C8CCB71543F85BD2 = 1;
    _id_10307D8953138B5A = 12;
    contents = scripts\engine\trace::create_all_contents();

    for (;;)
    {
        self waittill( "damage", amount, attacker, direction_vec, point, type, modelname, tagname, partname, _id_44E290FB31B85206, objweapon );
        start_point = point;
        end_point = point;

        for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < _id_C8CCB71543F85BD2; _id_AC0E594AC96AA3A8++ )
        {
            end_point = start_point + direction_vec * 0.5;
            start_point = end_point + direction_vec * _id_10307D8953138B5A;
            color = ( randomfloat( 1 ), randomfloat( 1 ), randomfloat( 1 ) );
            jku_arrow( start_point, end_point, color, 1, 1, 200, direction_vec );
            magicbullet( "veh_exit_hack", start_point, end_point );
            waitframe();
        }
    }
}

jku_arrow( start, end, color, alpha, _id_FFB74DFE2FDAD3BE, duration, direction_vec )
{
    setdvarifuninitialized( "dvar_C57DA70CD16526C7", 0 );

    if ( getdvarint( "dvar_C57DA70CD16526C7" ) == 1 )
    {
        if ( !isdefined( color ) )
            color = ( randomfloat( 1 ), randomfloat( 1 ), randomfloat( 1 ) );
    }
}

jku_point( position, _id_A61C75B156FC1EE0, color, duration )
{
    setdvarifuninitialized( "dvar_C57DA70CD16526C7", 0 );

    if ( getdvarint( "dvar_C57DA70CD16526C7" ) == 1 )
    {
        if ( !isdefined( position ) )
            return;
        else
            point = position;

        if ( !isdefined( _id_A61C75B156FC1EE0 ) )
            _id_A61C75B156FC1EE0 = 6;

        if ( !isdefined( color ) )
            color = ( 1, 1, 1 );

        if ( !isdefined( duration ) )
            duration = 400;
    }
}
