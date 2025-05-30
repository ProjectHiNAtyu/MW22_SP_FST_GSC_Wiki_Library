// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

vehicle_treads()
{
    _id_D0B6BC7DA35F797C = self.classname;

    if ( !isdefined( level.vehicle.templates.surface_effects[_id_D0B6BC7DA35F797C] ) )
        return;

    if ( scripts\common\vehicle_code::no_treads() )
        return;

    if ( isdefined( level.tread_override_thread ) )
        self thread [[ level.tread_override_thread ]]( "tag_origin", "back_left", ( 160, 0, 0 ) );
    else
    {
        if ( isdefined( level.vehicle.templates.single_tread_list ) && isdefined( level.vehicle.templates.single_tread_list[self.vehicletype] ) )
        {
            thread do_single_tread();
            return;
        }

        thread do_multiple_treads();
    }
}

do_multiple_treads()
{
    self endon( "death" );
    self endon( "kill_treads_forever" );

    for (;;)
    {
        scale = tread_wait();

        if ( scale == -1 )
        {
            wait 0.1;
            continue;
        }

        tread( self, scale, "tag_wheel_back_left", "back_left", 0 );
        wait 0.05;
        tread( self, scale, "tag_wheel_back_right", "back_right", 0 );
        wait 0.05;
    }
}

tread_wait()
{
    speed = self vehicle_getspeed();

    if ( !speed )
        return -1;

    speed = speed * 17.6;
    waittime = 1 / speed;
    waittime = clamp( waittime * 35, 0.1, 0.3 );

    if ( isdefined( self.treadfx_freq_scale ) )
        waittime = waittime * self.treadfx_freq_scale;

    wait( waittime );
    return waittime;
}

tread( dummy, scale, tagname, _id_A66BA9B157533F5A, _id_974D8FF6C0E6F78E, _id_39FDA469A708031F )
{
    _id_4643B33060D67DA5 = get_treadfx( self, _id_A66BA9B157533F5A );

    if ( !isdefined( _id_4643B33060D67DA5 ) )
        return;

    _id_8BC14603A27FA3E7 = dummy gettagangles( tagname );
    forwardvec = anglestoforward( _id_8BC14603A27FA3E7 );
    _id_24D4ADBE595ACFEA = self gettagorigin( tagname );

    if ( _id_974D8FF6C0E6F78E )
    {
        _id_741536587920C2D1 = self gettagorigin( _id_39FDA469A708031F );
        _id_24D4ADBE595ACFEA = ( _id_24D4ADBE595ACFEA + _id_741536587920C2D1 ) / 2;
    }

    playfx( _id_4643B33060D67DA5, _id_24D4ADBE595ACFEA, anglestoup( _id_8BC14603A27FA3E7 ), forwardvec * scale );
}

get_treadfx( vehicle, _id_A66BA9B157533F5A )
{
    if ( vehicle vehicle_isphysveh() )
        _id_895F3C282BC9FC68 = self _meth_2124BFE74C1872B1( 0 );
    else
        _id_895F3C282BC9FC68 = self _meth_2124BFE74C1872B1( _id_A66BA9B157533F5A );

    if ( !isdefined( vehicle.vehicletype ) )
    {
        _id_4643B33060D67DA5 = -1;
        return _id_4643B33060D67DA5;
    }

    classname = vehicle.classname;
    return scripts\common\vehicle_code::get_vehicle_effect( classname, _id_895F3C282BC9FC68 );
}

do_single_tread()
{
    self endon( "death" );
    self endon( "kill_treads_forever" );

    for (;;)
    {
        scale = tread_wait();

        if ( scale == -1 )
        {
            wait 0.1;
            continue;
        }

        tread( self, scale, "tag_wheel_back_left", "back_left", 1, "tag_wheel_back_right" );
    }
}
