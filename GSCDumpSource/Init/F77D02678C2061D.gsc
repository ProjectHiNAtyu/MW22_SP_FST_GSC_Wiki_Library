// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    if ( !getdvarint( "dvar_022EDDF44003BAF9", 0 ) )
        return;

    level._id_156E078B5445FFAA = _func_4F9373A1227DB35C();
    level._id_73E946A3EADC84BE = _func_08345F2AC499E5AB();
    level._id_0F60AB21FBEB423C = undefined;
    level._id_86613EC175AF9903 = undefined;

    if ( !isdefined( game["rejoinedPlayers"] ) )
        game["rejoinedPlayers"] = [];
}

_id_8CE5B106FBBA9E9F( _id_ABE916E564C32276 )
{
    if ( !getdvarint( "dvar_022EDDF44003BAF9", 0 ) )
        return;

    level._id_0F60AB21FBEB423C = _id_ABE916E564C32276;
}

_id_8FE6D6539ED31A88( _id_ABE916E564C32276 )
{
    if ( !getdvarint( "dvar_022EDDF44003BAF9", 0 ) )
        return;

    level._id_86613EC175AF9903 = _id_ABE916E564C32276;
}

_id_884994E73914EE32()
{
    if ( isdefined( level._id_0F60AB21FBEB423C ) )
        return [[ level._id_0F60AB21FBEB423C ]]( self );

    return [];
}

_id_87FC9992C0B60276( _id_C4F3E9732AA81389 )
{
    switch ( _id_C4F3E9732AA81389 )
    {
        case 0:
            return 0;
        case 2:
        case 1:
            return getdvarint( "dvar_1839B10B70A97D91", 0 );
        case 3:
            return getdvarint( "dvar_F690F29F47F7A379", 0 );
        case 5:
            return getdvarint( "dvar_42D413A1A32E906F", 0 );
        case 6:
            return getdvarint( "dvar_B37DBAA903C45CCD", 1 );
        case 7:
            return getdvarint( "dvar_BEA9CF0DCCF411EC", 0 );
        default:
            return 0;
    }

    return 0;
}

_id_2E8537357F01A56B( _id_1E904D14A41D4385, key )
{
    for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < _id_1E904D14A41D4385.size - 1; _id_AC0E594AC96AA3A8 = _id_AC0E594AC96AA3A8 + 2 )
    {
        if ( _id_1E904D14A41D4385[_id_AC0E594AC96AA3A8] == key )
            return _id_AC0E594AC96AA3A8;
    }

    return undefined;
}

_id_2FCDC8C12F068ABB( _id_4F6FF34F222B0271, _id_4F6FF04F222AFBD8, _id_E1E0E4A54C3D275C )
{
    _id_820A92B1182AE83E = [];

    if ( !isarray( _id_4F6FF34F222B0271 ) || _id_4F6FF34F222B0271.size % 2 != 0 || !isarray( _id_4F6FF04F222AFBD8 ) || _id_4F6FF04F222AFBD8.size % 2 != 0 )
    {
        scripts\engine\utility::error( "called rejoin_utility::combineKVPArrays with invalid array" );
        return _id_820A92B1182AE83E;
    }

    keys = [];
    values = [];
    _id_AC0E594AC96AA3A8 = 0;

    for ( _id_AC0E5C4AC96AAA41 = 0; _id_AC0E594AC96AA3A8 < _id_4F6FF34F222B0271.size - 1 || _id_AC0E5C4AC96AAA41 < _id_4F6FF04F222AFBD8.size - 1; _id_AC0E5C4AC96AAA41 = _id_AC0E5C4AC96AAA41 + 2 )
    {
        if ( _id_AC0E594AC96AA3A8 < _id_4F6FF34F222B0271.size - 1 && !scripts\engine\utility::array_contains( keys, _id_4F6FF34F222B0271[_id_AC0E594AC96AA3A8] ) )
        {
            keys[keys.size] = _id_4F6FF34F222B0271[_id_AC0E594AC96AA3A8];
            values[values.size] = _id_4F6FF34F222B0271[_id_AC0E594AC96AA3A8 + 1];
        }

        if ( _id_AC0E5C4AC96AAA41 < _id_4F6FF04F222AFBD8.size - 1 && !scripts\engine\utility::array_contains( keys, _id_4F6FF04F222AFBD8[_id_AC0E5C4AC96AAA41] ) )
        {
            keys[keys.size] = _id_4F6FF04F222AFBD8[_id_AC0E5C4AC96AAA41];
            values[values.size] = _id_4F6FF04F222AFBD8[_id_AC0E5C4AC96AAA41 + 1];
        }

        _id_AC0E594AC96AA3A8 = _id_AC0E594AC96AA3A8 + 2;
    }

    _id_71EB150F91B3456B = scripts\engine\utility::ter_op( istrue( _id_E1E0E4A54C3D275C ), _id_4F6FF04F222AFBD8, _id_4F6FF34F222B0271 );

    for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < _id_71EB150F91B3456B.size - 1; _id_AC0E594AC96AA3A8 = _id_AC0E594AC96AA3A8 + 2 )
    {
        key = _id_71EB150F91B3456B[_id_AC0E594AC96AA3A8];
        _id_2172DB62590952AE = scripts\engine\utility::array_find( keys, key );

        if ( isdefined( _id_2172DB62590952AE ) )
            values[_id_2172DB62590952AE] = _id_71EB150F91B3456B[_id_AC0E594AC96AA3A8 + 1];
    }

    for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < keys.size; _id_AC0E594AC96AA3A8++ )
    {
        _id_820A92B1182AE83E[_id_820A92B1182AE83E.size] = keys[_id_AC0E594AC96AA3A8];
        _id_820A92B1182AE83E[_id_820A92B1182AE83E.size] = values[_id_AC0E594AC96AA3A8];
    }

    return _id_820A92B1182AE83E;
}

_id_DC60E20E9216B5B2()
{
    if ( !getdvarint( "dvar_022EDDF44003BAF9", 0 ) )
        return;

    _id_BA664F53DEA8A25C = getdvarint( "dvar_925F7DCEB8E6205E", 0 );
    _id_C5728699E6B79552( _id_BA664F53DEA8A25C );
}

_id_4064A2271DE12B97()
{
    if ( !getdvarint( "dvar_022EDDF44003BAF9", 0 ) )
        return;

    _id_C5728699E6B79552( 0 );
    setdvar( "dvar_925F7DCEB8E6205E", 0 );
}

_id_342AF7EA8A120B16()
{
    if ( !getdvarint( "dvar_022EDDF44003BAF9", 0 ) )
        return;

    _id_BA664F53DEA8A25C = getdvarint( "dvar_925F7DCEB8E6205E", 0 );

    if ( _id_BA664F53DEA8A25C )
        _id_74B707898164ED78( 0, [] );
    else
        _id_E90D7800FB5EEC03( 0, [] );
}

_id_59121677F31F75A5()
{
    if ( !getdvarint( "dvar_022EDDF44003BAF9", 0 ) )
        return;

    xuid = self getxuid();

    if ( !scripts\engine\utility::array_contains( game["rejoinedPlayers"], xuid ) )
        game["rejoinedPlayers"] = scripts\engine\utility::array_add_safe( game["rejoinedPlayers"], xuid );
    else
    {

    }

    if ( isdefined( level._id_86613EC175AF9903 ) )
        [[ level._id_86613EC175AF9903 ]]( self );
}

_id_8CF8FF669AC52156( _id_934DC135AAF6F953, _id_CF51D5A9282DF88B )
{
    if ( !getdvarint( "dvar_022EDDF44003BAF9", 0 ) )
        return;

    _id_400CD07EC60D425C = _id_884994E73914EE32();
    _id_BA664F53DEA8A25C = getdvarint( "dvar_925F7DCEB8E6205E", 0 );

    if ( _id_BA664F53DEA8A25C )
    {
        _id_C4F3E9732AA81389 = _id_4F6DF967144E2CB4( _id_934DC135AAF6F953 );

        if ( _id_C4F3E9732AA81389 != 3 )
        {
            xuid = self getxuid();

            if ( scripts\engine\utility::array_contains( game["rejoinedPlayers"], xuid ) )
                _id_C4F3E9732AA81389 = 5;
        }

        if ( isdefined( _id_CF51D5A9282DF88B ) && _id_CF51D5A9282DF88B || _id_87FC9992C0B60276( _id_C4F3E9732AA81389 ) )
        {
            _id_74B707898164ED78( _id_C4F3E9732AA81389, _id_400CD07EC60D425C );
            return;
        }

        _id_E90D7800FB5EEC03( _id_C4F3E9732AA81389, _id_400CD07EC60D425C );
        return;
    }
    else
        _id_13399AA20634EDCE( _id_400CD07EC60D425C );
}

_id_C5728699E6B79552( _id_38968EF355B4D2EC )
{
    _id_BA664F53DEA8A25C = getdvarint( "dvar_925F7DCEB8E6205E", 0 );

    foreach ( player in level.players )
    {
        if ( _id_BA664F53DEA8A25C && _id_38968EF355B4D2EC )
        {
            player _id_74B707898164ED78( 0, [] );
            continue;
        }

        player _id_E90D7800FB5EEC03( 0, [] );
    }
}

_id_FB67B62BBD718B34()
{
    _id_64F88D0441939203 = getsystemtime() * 1000;
    _id_84C6DC2345234A61 = getdvarint( "dvar_F4417CC21744FB67", 0 ) * 1000;
    _id_1517A9CFB1F4DE62 = scripts\engine\utility::ter_op( _id_84C6DC2345234A61 == 0, 0, _id_64F88D0441939203 + _id_84C6DC2345234A61 );
    return _id_1517A9CFB1F4DE62;
}

_id_74B707898164ED78( _id_401C3A2E68AAB0FD, _id_400CD07EC60D425C )
{
    if ( !getdvarint( "dvar_925F7DCEB8E6205E", 0 ) )
        return;

    if ( !isdefined( _id_401C3A2E68AAB0FD ) )
        return;

    if ( !isint( _id_401C3A2E68AAB0FD ) )
        return;

    _id_1517A9CFB1F4DE62 = _id_FB67B62BBD718B34();
    _id_BD15D7D46DE8F2DE = [ 0, 1, 13, _id_401C3A2E68AAB0FD, 9, level._id_73E946A3EADC84BE, 2, level._id_156E078B5445FFAA, 4, _id_1517A9CFB1F4DE62 ];

    if ( isdefined( _id_400CD07EC60D425C ) && _id_400CD07EC60D425C.size > 0 )
        _id_BD15D7D46DE8F2DE = _id_2FCDC8C12F068ABB( _id_BD15D7D46DE8F2DE, _id_400CD07EC60D425C, 1 );

    _id_13399AA20634EDCE( _id_BD15D7D46DE8F2DE );
}

_id_E90D7800FB5EEC03( _id_401C3A2E68AAB0FD, _id_400CD07EC60D425C )
{
    if ( !isdefined( _id_401C3A2E68AAB0FD ) )
        return;

    if ( !isint( _id_401C3A2E68AAB0FD ) )
        return;

    _id_BD15D7D46DE8F2DE = [ 0, 0, 13, _id_401C3A2E68AAB0FD, 9, level._id_73E946A3EADC84BE, 2, level._id_156E078B5445FFAA ];

    if ( isdefined( _id_400CD07EC60D425C ) && _id_400CD07EC60D425C.size > 0 )
        _id_BD15D7D46DE8F2DE = _id_2FCDC8C12F068ABB( _id_BD15D7D46DE8F2DE, _id_400CD07EC60D425C, 1 );

    _id_13399AA20634EDCE( _id_BD15D7D46DE8F2DE );
}

_id_13399AA20634EDCE( _id_1E904D14A41D4385 )
{
    if ( !isdefined( _id_1E904D14A41D4385 ) || !isdefined( _id_1E904D14A41D4385.size ) || _id_1E904D14A41D4385.size < 2 )
        return;

    self _meth_DB073176839D77FB( "50", _id_1E904D14A41D4385 );
}

_id_4F6DF967144E2CB4( _id_934DC135AAF6F953 )
{
    if ( _id_934DC135AAF6F953 == "enum_3926064B6DC60064" )
        return 3;
    else if ( _id_934DC135AAF6F953 == "enum_05A08CB6DBD090C0" )
        return 2;
    else if ( _id_934DC135AAF6F953 == "enum_539E18C78905606E" )
        return 6;
    else if ( _id_934DC135AAF6F953 == "enum_11F20E9E67C5528B" )
        return 7;

    return 0;
}
