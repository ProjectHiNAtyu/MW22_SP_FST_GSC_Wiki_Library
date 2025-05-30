// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_12AF77EFCD32E158()
{
    dragonsbreathdamage = spawnstruct();
    dragonsbreathdamage.newhitlocs = [];
    dragonsbreathdamage.hitslocs = [];
    dragonsbreathdamage.burningstate = "";
    return dragonsbreathdamage;
}

_id_6DC8C5DE229E86FF( newhitlocs, attacker, objweapon )
{
    foreach ( part in newhitlocs )
    {
        if ( isshield( part ) )
            newhitlocs = scripts\engine\utility::array_remove( newhitlocs, part );
    }

    if ( newhitlocs.size == 0 )
        return;

    thread _id_A0888E06AA555932( newhitlocs, attacker, objweapon );
}

_id_56A694363DA738AC()
{
    _id_3741EA5B9FB53EC3 = self getcorpseentity();
    _id_3741EA5B9FB53EC3 setscriptablepartstate( "burning", "flareUp", 0 );
}

_id_2214216A8AEE7675()
{
    self notify( "stop_dragonsbreathDamage" );
    self.dragonsbreathdamage = undefined;
}

_id_A0888E06AA555932( _id_4763836BFD4D9D8A, attacker, objweapon )
{
    self notify( "newBurningParts" );
    self endon( "disconnect" );
    self endon( "newBurningParts" );
    self endon( "stop_dragonsbreathDamage" );
    _id_4763836BFD4D9D8A = scripts\engine\utility::array_remove_duplicates( _id_4763836BFD4D9D8A );

    foreach ( part in _id_4763836BFD4D9D8A )
    {
        if ( isdefined( self.dragonsbreathdamage.hitslocs[part] ) )
        {
            self.dragonsbreathdamage.hitslocs[part] = self.dragonsbreathdamage.hitslocs[part] + 0.5;
            self.dragonsbreathdamage.hitslocs[part] = min( self.dragonsbreathdamage.hitslocs[part], 4.0 );
            continue;
        }

        self.dragonsbreathdamage.hitslocs[part] = 0.5;
    }

    childthread _id_8B5AE6AB700339F8( attacker, objweapon );
    _id_617D3B19B49F9441();

    for (;;)
    {
        wait 0.2;

        if ( !isalive( self ) || self.dragonsbreathdamage.hitslocs.size == 0 )
            _id_2214216A8AEE7675();

        _id_B400931C07D29AD6 = 0;

        foreach ( key, _id_FABE55B122C8DF13 in self.dragonsbreathdamage.hitslocs )
        {
            self.dragonsbreathdamage.hitslocs[key] = self.dragonsbreathdamage.hitslocs[key] - 0.2;

            if ( self.dragonsbreathdamage.hitslocs[key] <= 0 )
            {
                self.dragonsbreathdamage.hitslocs = scripts\engine\utility::array_remove_key( self.dragonsbreathdamage.hitslocs, key );
                _id_B400931C07D29AD6 = 1;
            }
        }

        if ( _id_B400931C07D29AD6 )
            _id_617D3B19B49F9441();
    }
}

_id_8B5AE6AB700339F8( attacker, objweapon )
{
    for (;;)
    {
        wait 0.25;
        _id_36299ADE93D1DD06 = scripts\engine\math::normalize_value( 5, 1, self.dragonsbreathdamage.hitslocs.size );
        _id_C502A76896D14989 = scripts\engine\math::factor_value( 40, 54, _id_36299ADE93D1DD06 );
        _id_76E563DB5D11A0EA = int( _id_C502A76896D14989 * 0.25 );
        self dodamage( _id_76E563DB5D11A0EA, self.origin, attacker, attacker, "MOD_FIRE", objweapon );
    }
}

_id_617D3B19B49F9441()
{
    burningstate = "";
    points = [];
    points["torso"] = 0;
    points["legs"] = 0;

    foreach ( _id_6BC1CACFCA73BCC3, _id_1FD61B140D0A59F1 in self.dragonsbreathdamage.hitslocs )
    {
        _id_B8C1BD5E260F7F81 = _id_4AECAD45C365764E( _id_6BC1CACFCA73BCC3 );

        if ( isdefined( _id_B8C1BD5E260F7F81 ) )
        {
            points[_id_B8C1BD5E260F7F81] = points[_id_B8C1BD5E260F7F81] + 1;
            continue;
        }
    }

    if ( points["torso"] > 2 )
        burningstate = "torso_l_";
    else if ( points["torso"] > 0 )
        burningstate = "torso_s_";

    if ( points["legs"] > 2 )
        burningstate = burningstate + "legs_l";
    else if ( points["legs"] > 0 )
        burningstate = burningstate + "legs_s";

    if ( burningstate == "" )
        burningstate = "neutral";

    if ( burningstate != self.dragonsbreathdamage.burningstate )
    {
        if ( burningstate == "neutral" )
            scripts\mp\weapons::disableburnfx( 1, self.dragonsbreathdamage.burningstate );
        else
            scripts\mp\weapons::enableburnfx( 1, burningstate );

        self.dragonsbreathdamage.burningstate = burningstate;
    }
}

_id_4AECAD45C365764E( hitloc )
{
    switch ( hitloc )
    {
        case "helmet":
            return "torso";
        case "head":
            return "torso";
        case "neck":
            return "torso";
        case "torso_upper":
            return "torso";
        case "torso_lower":
            return "torso";
        case "right_arm_upper":
            return "torso";
        case "left_arm_upper":
            return "torso";
        case "right_arm_lower":
            return "torso";
        case "left_arm_lower":
            return "torso";
        case "right_hand":
            return "torso";
        case "left_hand":
            return "torso";
        case "right_leg_upper":
            return "legs";
        case "left_leg_upper":
            return "legs";
        case "right_leg_lower":
            return "legs";
        case "left_leg_lower":
            return "legs";
        case "right_foot":
            return "legs";
        case "left_foot":
            return "legs";
    }
}

isdragonsbreathweapon( objweapon )
{
    if ( isdefined( objweapon.modifier ) )
    {
        _id_384D17810FA06509 = _func_4F344EC5B7C45A3F( objweapon, objweapon.modifier );

        if ( scripts\engine\utility::array_contains( _id_384D17810FA06509, "specialty_incendiary" ) )
            return 1;
    }

    return 0;
}

isshield( hitloc )
{
    if ( hitloc == "shield" )
        return 1;
    else
        return 0;
}

_id_0C206C109A26F598( idamage, victim, attacker, objweapon, hitloc )
{
    if ( !isdefined( victim._id_7E2ABE421347DD30 ) )
        victim._id_7E2ABE421347DD30 = [];

    _id_F25B10D0D2D8664C = getdvarint( "dvar_632C2D7B6B4C3771", 5 );
    _id_C42F14360A123E9D = getdvarfloat( "dvar_A55CC107911A0CE0", 1.0 );
    _id_60D435C6357875EA = _id_C42F14360A123E9D / _id_F25B10D0D2D8664C;
    _id_419E24DBC44963ED = spawnstruct();
    _id_419E24DBC44963ED._id_F25B10D0D2D8664C = _id_F25B10D0D2D8664C;
    _id_419E24DBC44963ED._id_76E563DB5D11A0EA = _func_C5CF558181E12D1F( idamage / _id_419E24DBC44963ED._id_F25B10D0D2D8664C );
    _id_419E24DBC44963ED.attacker = attacker;
    _id_419E24DBC44963ED.objweapon = objweapon;
    _id_419E24DBC44963ED.hitloc = hitloc;
    victim._id_7E2ABE421347DD30[victim._id_7E2ABE421347DD30.size] = _id_419E24DBC44963ED;
    victim thread _id_1A50056B16521C9E( victim, attacker, _id_60D435C6357875EA );
}

_id_1A50056B16521C9E( victim, attacker, _id_60D435C6357875EA )
{
    self notify( "db_damage" );
    self endon( "db_damage" );

    while ( isdefined( victim._id_7E2ABE421347DD30 ) && victim._id_7E2ABE421347DD30.size > 0 )
    {
        if ( !isdefined( victim ) || !scripts\cp_mp\utility\player_utility::isreallyalive( victim ) )
            break;

        _id_5AE1CEEB2401DBD5 = victim._id_7E2ABE421347DD30[0];

        while ( _id_5AE1CEEB2401DBD5._id_F25B10D0D2D8664C > 0 )
        {
            damage = 0;

            for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < victim._id_7E2ABE421347DD30.size; _id_AC0E594AC96AA3A8++ )
            {
                attacker = victim._id_7E2ABE421347DD30[_id_AC0E594AC96AA3A8].attacker;
                objweapon = victim._id_7E2ABE421347DD30[_id_AC0E594AC96AA3A8].objweapon;
                hitloc = victim._id_7E2ABE421347DD30[_id_AC0E594AC96AA3A8].hitloc;
                damage = victim._id_7E2ABE421347DD30[_id_AC0E594AC96AA3A8]._id_76E563DB5D11A0EA;
                victim dodamage( damage, victim.origin, attacker, attacker, "MOD_FIRE", objweapon, hitloc );
                victim._id_7E2ABE421347DD30[_id_AC0E594AC96AA3A8]._id_F25B10D0D2D8664C--;
            }

            wait( _id_60D435C6357875EA );
        }

        victim._id_7E2ABE421347DD30 = scripts\engine\utility::array_remove( victim._id_7E2ABE421347DD30, _id_5AE1CEEB2401DBD5 );
        waitframe();
    }

    victim._id_4AF5AE3FE5DC1D95 = undefined;
}
