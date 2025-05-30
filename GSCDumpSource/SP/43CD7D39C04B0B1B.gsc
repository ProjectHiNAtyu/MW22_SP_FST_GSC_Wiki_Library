// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

objective_add( objectivename, _id_05FA71E8FED5161B, _id_1CC0D51C86BC4411, _id_2215EEB563F7A3B8, _id_F34635B53ACCBCAC, _id_C6CAF52C65D084B8, _id_14847A630D9835AF, _id_780B9710A4C60F44, _id_D54B9310847F6BF4, _id_2F87F92EB31189CC, _id_2431EBABBCC67A2C )
{
    _objective_validatename( objectivename );
    _objective_initindexforname( objectivename );
    objective_update( objectivename, _id_05FA71E8FED5161B, _id_1CC0D51C86BC4411, _id_2215EEB563F7A3B8, _id_F34635B53ACCBCAC, _id_C6CAF52C65D084B8, _id_14847A630D9835AF, _id_780B9710A4C60F44, _id_D54B9310847F6BF4, _id_2431EBABBCC67A2C );

    if ( istrue( _id_2F87F92EB31189CC ) )
        level.player [[ level._id_B9EEE5BAD6EC9BCD.callback ]]( objectivename, _id_2215EEB563F7A3B8 );
}

_id_1A7F32A7C56AD4E0( _id_6A210F4755586405 )
{
    level._id_B9EEE5BAD6EC9BCD.callback = _id_6A210F4755586405;
}

objective_update( objectivename, _id_05FA71E8FED5161B, _id_1CC0D51C86BC4411, _id_2215EEB563F7A3B8, _id_F34635B53ACCBCAC, _id_C6CAF52C65D084B8, _id_14847A630D9835AF, _id_780B9710A4C60F44, _id_D54B9310847F6BF4, _id_2431EBABBCC67A2C, _id_4A6DF3C7FF3EA1E6 )
{
    _objective_validatename( objectivename );

    if ( isdefined( _id_05FA71E8FED5161B ) )
        objective_set_state( objectivename, _id_05FA71E8FED5161B );

    if ( isdefined( _id_1CC0D51C86BC4411 ) )
    {
        if ( isent( _id_1CC0D51C86BC4411 ) )
        {
            objective_set_on_entity( objectivename, objectivename, _id_1CC0D51C86BC4411 );

            if ( isdefined( _id_4A6DF3C7FF3EA1E6 ) )
                _id_5E1102EC9D97ED2C( objectivename, _id_4A6DF3C7FF3EA1E6 );
        }
        else
            objective_set_position( objectivename, _id_1CC0D51C86BC4411 );
    }

    if ( isdefined( _id_2215EEB563F7A3B8 ) )
        objective_set_description( objectivename, _id_2215EEB563F7A3B8 );

    if ( isdefined( _id_F34635B53ACCBCAC ) )
        objective_set_label( objectivename, _id_F34635B53ACCBCAC );

    if ( isdefined( _id_C6CAF52C65D084B8 ) )
        objective_set_icon( objectivename, _id_C6CAF52C65D084B8 );

    if ( isdefined( _id_14847A630D9835AF ) )
        objective_set_z_offset( objectivename, _id_14847A630D9835AF );

    if ( isdefined( _id_780B9710A4C60F44 ) )
        objective_set_show_distance( objectivename, _id_780B9710A4C60F44 );

    if ( isdefined( _id_D54B9310847F6BF4 ) )
        objective_set_show_progress( objectivename, _id_D54B9310847F6BF4 );

    if ( isdefined( _id_2431EBABBCC67A2C ) )
        _id_FF959EC1BD44C166( objectivename, _id_2431EBABBCC67A2C );

    level notify( "objectives_updated" );
}

objective_remove( objectivename )
{
    objectiveindex = _objective_getindexforname( objectivename );
    level.objective_array[objectiveindex] = undefined;
    objective_delete( objectiveindex );
    level notify( "objectives_updated" );
}

objective_exists( objectivename )
{
    _objective_validatename( objectivename );

    if ( isdefined( level.objective_array ) )
    {
        foreach ( objective in level.objective_array )
        {
            if ( isdefined( objective.objectivename ) && objective.objectivename == objectivename )
                return 1;
        }
    }

    return 0;
}

objective_complete( objectivename )
{
    objective_set_state( objectivename, "done" );
    objectiveindex = _objective_getindexforname( objectivename );
}

objective_set_state( objectivename, _id_05FA71E8FED5161B )
{
    _objective_validatename( objectivename );
    objectiveindex = _objective_getindexforname( objectivename );
    objective_state( objectiveindex, _id_05FA71E8FED5161B );
    level notify( "objectives_updated" );
    level notify( "objectives_updated_state", _id_05FA71E8FED5161B );
}

objective_set_position( objectivename, _id_1CC0D51C86BC4411 )
{
    _objective_validatename( objectivename );
    objectiveindex = _objective_getindexforname( objectivename );
    objective_position( objectiveindex, _id_1CC0D51C86BC4411 );
    level notify( "objectives_updated" );
}

objective_set_description( objectivename, _id_2215EEB563F7A3B8 )
{
    _objective_validatename( objectivename );
    objectiveindex = _objective_getindexforname( objectivename );
    objective_setdescription( objectiveindex, _id_2215EEB563F7A3B8 );
    level notify( "objectives_updated" );
}

objective_set_label( objectivename, _id_F34635B53ACCBCAC )
{
    _objective_validatename( objectivename );
    objectiveindex = _objective_getindexforname( objectivename );
    objective_setlabel( objectiveindex, _id_F34635B53ACCBCAC );
    level notify( "objectives_updated" );
}

objective_set_icon( objectivename, _id_C6CAF52C65D084B8 )
{
    _objective_validatename( objectivename );
    objectiveindex = _objective_getindexforname( objectivename );
    objective_icon( objectiveindex, _id_C6CAF52C65D084B8 );
    level notify( "objectives_updated" );
}

objective_set_z_offset( objectivename, _id_14847A630D9835AF )
{
    _objective_validatename( objectivename );
    objectiveindex = _objective_getindexforname( objectivename );
    objective_setzoffset( objectiveindex, _id_14847A630D9835AF );
    level notify( "objectives_updated" );
}

_id_FF959EC1BD44C166( objectivename, _id_2431EBABBCC67A2C )
{
    _objective_validatename( objectivename );
    objectiveindex = _objective_getindexforname( objectivename );
    _func_7D22ACC637A98C43( objectiveindex, _id_2431EBABBCC67A2C );
    level notify( "objectives_updated" );
}

_id_3234E40DF03B0A40( objectivename )
{
    _objective_validatename( objectivename );
    _id_FF959EC1BD44C166( objectivename, -50 );
}

_id_54586A40E8A00778( objectivename )
{
    _objective_validatename( objectivename );
    _id_5E1102EC9D97ED2C( objectivename, "j_head" );
    objective_set_z_offset( objectivename, 25 );
}

objective_set_show_distance( objectivename, _id_780B9710A4C60F44 )
{
    _objective_validatename( objectivename );
    objectiveindex = _objective_getindexforname( objectivename );
    objective_setshowdistance( objectiveindex, _id_780B9710A4C60F44 );
    level notify( "objectives_updated" );
}

objective_set_show_progress( objectivename, _id_D54B9310847F6BF4 )
{
    _objective_validatename( objectivename );
    objectiveindex = _objective_getindexforname( objectivename );
    objective_setshowprogress( objectiveindex, _id_D54B9310847F6BF4 );
    level notify( "objectives_updated" );
}

objective_set_on_entity( objectivename, _id_9A1612BF33A317B1, _id_766DFF81C68B20F9 )
{
    _objective_validatename( objectivename );
    objectiveindex = _objective_getindexforname( objectivename );

    if ( level.objective_array[objectiveindex].locations.size > 0 )
    {
        scripts\engine\utility::error( "Calling this function while having locations set is scary. OnEntity always takes the first index." );
        objective_remove_all_locations( objectivename );
    }

    level.objective_array[objectiveindex].locations[0] = _id_9A1612BF33A317B1;
    objective_onentity( objectiveindex, _id_766DFF81C68B20F9 );
    level notify( "objectives_updated" );
}

_id_5E1102EC9D97ED2C( objectivename, _id_4A6DF3C7FF3EA1E6 )
{
    _objective_validatename( objectivename );
    objectiveindex = _objective_getindexforname( objectivename );
    _func_FD97ACB2885E7860( objectiveindex, _id_4A6DF3C7FF3EA1E6 );
    level notify( "objectives_updated" );
}

objective_add_location_entity( objectivename, _id_9A1612BF33A317B1, _id_766DFF81C68B20F9 )
{
    _objective_addlocation( objectivename, _id_9A1612BF33A317B1, _id_766DFF81C68B20F9 );
}

objective_add_location_position( objectivename, _id_9A1612BF33A317B1, _id_093862E78A31A715 )
{
    _objective_addlocation( objectivename, _id_9A1612BF33A317B1, _id_093862E78A31A715 );
}

objective_remove_location( objectivename, _id_9A1612BF33A317B1 )
{
    _id_9BE69C18C91160A9 = -1;
    objectiveindex = _objective_getindexforname( objectivename );
    objectivelocations = level.objective_array[objectiveindex].locations;

    foreach ( _id_0BE9720EAAAA043E, location in objectivelocations )
    {
        if ( isdefined( location ) && location == _id_9A1612BF33A317B1 )
        {
            _id_9BE69C18C91160A9 = _id_0BE9720EAAAA043E;
            break;
        }
    }

    level.objective_array[objectiveindex].locations[_id_9BE69C18C91160A9] = undefined;
    objective_unsetlocation( objectiveindex, _id_9BE69C18C91160A9 );
    level notify( "objectives_updated", "location" );
}

_id_9ECF0D4A951ABEBF( objectivename, _id_9A1612BF33A317B1 )
{
    _id_9BE69C18C91160A9 = -1;
    objectiveindex = _objective_getindexforname( objectivename );
    objectivelocations = level.objective_array[objectiveindex].locations;

    foreach ( _id_0BE9720EAAAA043E, location in objectivelocations )
    {
        if ( isdefined( location ) && location == _id_9A1612BF33A317B1 )
        {
            _id_9BE69C18C91160A9 = _id_0BE9720EAAAA043E;
            break;
        }
    }

    return _id_9BE69C18C91160A9 >= 0;
}

objective_remove_all_locations( objectivename )
{
    objectiveindex = _objective_getindexforname( objectivename );

    for ( _id_0BE9720EAAAA043E = 0; _id_0BE9720EAAAA043E < 8; _id_0BE9720EAAAA043E++ )
        objective_unsetlocation( objectiveindex, _id_0BE9720EAAAA043E );

    level.objective_array[objectiveindex].locations = [];
    level notify( "objectives_updated" );
}

_id_AB69B0FE7021A308( _id_9235D6CCD79A3362 )
{
    if ( !isdefined( _id_9235D6CCD79A3362 ) )
        _id_9235D6CCD79A3362 = 1000;

    setomnvar( "ui_objective_scale_distance", _id_9235D6CCD79A3362 );
}

_id_0CD037DBE1FE3943( index )
{
    if ( level.objective_array != undefined && level.objective_array.size )
        return level.objective_array[index];

    return undefined;
}

_objective_addlocation( objectivename, _id_9A1612BF33A317B1, _id_08C7C19C9172500F )
{
    objectiveindex = _objective_getindexforname( objectivename );
    _id_9BE69C18C91160A9 = _objective_getnextfreelocationindex( objectiveindex );
    level.objective_array[objectiveindex].locations[_id_9BE69C18C91160A9] = _id_9A1612BF33A317B1;
    objective_setlocation( objectiveindex, _id_9BE69C18C91160A9, _id_08C7C19C9172500F );
    level notify( "objectives_updated" );
}

_objective_validatename( objectivename )
{

}

_objective_initindexforname( objectivename )
{
    _objective_getindexforname( objectivename, 1 );
}

_objective_getindexforname( objectivename, _id_2E5A6B3339D8D1E0 )
{
    if ( !isdefined( level.objective_array ) )
        level.objective_array = [];

    objectiveindex = -1;

    if ( istrue( _id_2E5A6B3339D8D1E0 ) )
    {
        objectiveindex = _objective_getnextfreeobjectiveindex();
        level.objective_array[objectiveindex] = spawnstruct();
        level.objective_array[objectiveindex].objectivename = objectivename;
        level.objective_array[objectiveindex].locations = [];
        objective_delete( objectiveindex );
    }
    else
    {
        for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < 32; _id_AC0E594AC96AA3A8++ )
        {
            if ( isdefined( level.objective_array[_id_AC0E594AC96AA3A8] ) && isdefined( level.objective_array[_id_AC0E594AC96AA3A8].objectivename ) && level.objective_array[_id_AC0E594AC96AA3A8].objectivename == objectivename )
            {
                objectiveindex = _id_AC0E594AC96AA3A8;
                break;
            }
        }
    }

    return objectiveindex;
}

_objective_getnextfreelocationindex( objectiveindex )
{
    objectivelocations = level.objective_array[objectiveindex].locations;

    for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < 8; _id_AC0E594AC96AA3A8++ )
    {
        if ( !isdefined( objectivelocations[_id_AC0E594AC96AA3A8] ) )
            return _id_AC0E594AC96AA3A8;
        else if ( objectivelocations[_id_AC0E594AC96AA3A8] == "" )
            return _id_AC0E594AC96AA3A8;
    }
}

_objective_getnextfreeobjectiveindex()
{
    for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < 32; _id_AC0E594AC96AA3A8++ )
    {
        if ( !isdefined( level.objective_array[_id_AC0E594AC96AA3A8] ) )
            return _id_AC0E594AC96AA3A8;
    }
}
