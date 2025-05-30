// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_7FA31368E342A4F6( origin, radius, color, alpha, _id_FFB74DFE2FDAD3BE, duration )
{
    _id_FFB74DFE2FDAD3BE = scripts\engine\utility::_id_53C4C53197386572( _id_FFB74DFE2FDAD3BE, 0 );
    duration = scripts\engine\utility::_id_53C4C53197386572( duration, 1 );
}

_id_1589F10B96600D0F( _id_6ED475291E71A8E2 )
{
    _id_C67E2413C92619A6 = 480 / _id_6ED475291E71A8E2;
    return _id_C67E2413C92619A6;
}

_id_D6886ACCE6238019( _id_B83B258FC6E7927C, _id_63EE1901002206FC )
{
    _id_63EE1901002206FC = scripts\engine\utility::_id_53C4C53197386572( _id_63EE1901002206FC, _id_6BF6C8E2E1FDCCAA::_id_D8BCDDE57D13F7FC() );
    _id_C67E2413C92619A6 = _id_1589F10B96600D0F( _id_63EE1901002206FC[1] );
    _id_D7658FB0CC1002D6 = _id_B83B258FC6E7927C[0] * _id_C67E2413C92619A6;
    _id_2C4F8AD1C5669E49 = _id_B83B258FC6E7927C[1] * _id_C67E2413C92619A6;
    return [ int( _id_D7658FB0CC1002D6 ), int( _id_2C4F8AD1C5669E49 ) ];
}

_id_A540F05EECFE7E96( _id_B83B258FC6E7927C, _id_63EE1901002206FC )
{
    _id_63EE1901002206FC = scripts\engine\utility::_id_53C4C53197386572( _id_63EE1901002206FC, _id_6BF6C8E2E1FDCCAA::_id_D8BCDDE57D13F7FC() );
    _id_C67E2413C92619A6 = _id_1589F10B96600D0F( _id_63EE1901002206FC[1] );
    _id_FB11C2CA74CC1EB6 = _id_B83B258FC6E7927C[0] * _id_C67E2413C92619A6;
    _id_FB11C3CA74CC20E9 = _id_B83B258FC6E7927C[1] * _id_C67E2413C92619A6;
    _id_96004C2E1FBD34B1 = _id_63EE1901002206FC[0] / _id_63EE1901002206FC[1];
    _id_766FC6B1F18EEEAB = _id_96004C2E1FBD34B1 * 480;
    _id_EDE6DDAE6DAAA631 = -0.5 * ( _id_766FC6B1F18EEEAB - 640 );
    _id_FB11C2CA74CC1EB6 = _id_FB11C2CA74CC1EB6 + _id_EDE6DDAE6DAAA631;
    return [ _id_FB11C2CA74CC1EB6, _id_FB11C3CA74CC20E9 ];
}

_id_55792E20398965BF()
{
    if ( isdefined( level._id_BE3605030AEF1714._id_4893B4259503B919 ) )
        return;

    level._id_BE3605030AEF1714._id_4893B4259503B919 = thisthread;

    while ( isdefined( level._id_BE3605030AEF1714._id_7C6225B8FB5193AA ) )
    {
        _id_64F88D0441939203 = gettime();
        _id_D09FE962DD2B94C6 = [];

        foreach ( hud in level._id_BE3605030AEF1714._id_7C6225B8FB5193AA )
        {
            if ( hud.duration > 0 )
            {
                _id_D09FE962DD2B94C6[_id_D09FE962DD2B94C6.size] = hud;

                if ( hud.time == _id_64F88D0441939203 )
                    continue;

                hud.duration = hud.duration - 1;

                if ( hud._id_BB63BA5E47E69DF1 <= _id_64F88D0441939203 )
                {
                    hud.alpha = 0.0;
                    hud settext( "" );
                }

                continue;
            }

            hud destroy();
        }

        level._id_BE3605030AEF1714._id_7C6225B8FB5193AA = _id_D09FE962DD2B94C6;
        waitframe();
    }
}

_id_BC5B7015DF7542D1( duration )
{
    hud = undefined;
    _id_64F88D0441939203 = gettime();
    _id_BB63BA5E47E69DF1 = duration * 50;
    return hud;
}

_id_B712AC81C5CB013B( _id_5CAABC9F456B8007, _id_5CAABB9F456B7DD4, text, color, alpha, scale, duration )
{
    _id_9DC0190A0B3DB5E1 = 640;
    _id_2F78B902F77D8A30 = 480;
    _id_4445D2B30AFAABDB = _id_9DC0190A0B3DB5E1 / _id_2F78B902F77D8A30;
    _id_4ABD463C3A5D6022 = _id_6BF6C8E2E1FDCCAA::_id_D8BCDDE57D13F7FC();
    _id_B835AE2157A354AC = _id_4ABD463C3A5D6022[0];
    _id_67A206C222C5563B = _id_4ABD463C3A5D6022[1];
    _id_2D6E500898A10090 = _id_B835AE2157A354AC / _id_67A206C222C5563B;
    _id_210F94A8FD146F18 = -0.5 * ( _id_2F78B902F77D8A30 * _id_2D6E500898A10090 - _id_9DC0190A0B3DB5E1 );
    _id_FB11C2CA74CC1EB6 = _id_5CAABC9F456B8007 / _id_B835AE2157A354AC * _id_9DC0190A0B3DB5E1 + ( 1.0 - _id_5CAABC9F456B8007 / ( _id_B835AE2157A354AC * 0.5 ) ) * _id_210F94A8FD146F18;
    _id_FB11C3CA74CC20E9 = _id_5CAABB9F456B7DD4 / _id_67A206C222C5563B * _id_2F78B902F77D8A30;

    if ( isdefined( level._id_BE3605030AEF1714._id_7C6225B8FB5193AA ) == 0 )
        level._id_BE3605030AEF1714._id_7C6225B8FB5193AA = [];

    level thread _id_55792E20398965BF();
    hud = _id_BC5B7015DF7542D1( duration );
    hud.x = _id_FB11C2CA74CC1EB6;
    hud.y = _id_FB11C3CA74CC20E9;
    hud settext( text );
    hud.color = color;
    hud.alpha = alpha;
    hud.fontscale = scale * 0.5;
    hud.font = "smallfixed";
    hud.alignx = "left";
    hud.aligny = "bottom";
    hud._id_406FD34934F7E3D2 = "fullscreen";
    hud.vertalign = "fullscreen";
    hud.xoffset = 0;
    hud.yoffset = 0;
    hud.xpadding = 0;
    hud.ypadding = 0;
}
