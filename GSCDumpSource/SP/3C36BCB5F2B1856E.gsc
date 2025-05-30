// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

initcombatfunctions( taskid )
{
    self.fngetturretaimangles = ::getturretaimanglessp;
    self.fngetusedturret = ::getusedturret;
    self.fnlaseron = ::turnonlaser;
    self.fnlaseroff = ::turnofflaser;
    self.fnsetlaserflag = ::callsetlaserflag;
    self.fnsaygenericdialogue = ::saygenericdialogue;
    self.fnupdatefrantic = ::updatefrantic;
    scripts\asm\soldier\patrol::_id_3ABA5F22B60D37F5();
    initstealthfunctionssp();
    level thread scripts\aitypes\combat::low_cover_combat_areas();
    return anim.success;
}

initstealthfunctionssp()
{
    self.fnstealthflashlighton = scripts\sp\nvg\nvg_ai::flashlight_on;
    self.fnstealthflashlightoff = scripts\sp\nvg\nvg_ai::flashlight_off;
    self.fnstealthmusictransition = scripts\sp\stealth\utility::stealth_music_transition_sp;
    self.fnupdatelightmeter = scripts\sp\nvg\nvg_ai::updatelightmeter;
    self.fnstealthgotonode = scripts\sp\spawner::go_to_node;
}

soldier_init( taskid )
{
    scripts\aitypes\combat::soldier_init_common();
    self._id_689BF433CB5C5322 = "melee_sp";
    self _meth_55B6AA24F750BA4A( 1 );
    self _meth_33C6BAADEDC4DCDE( 0 );
    return anim.success;
}

turnonlaser()
{
    self _meth_6F7BE4CB996E4D3E();
}

turnofflaser()
{
    self _meth_9BA253C26D6D6740();
}

callsetlaserflag( flag )
{
    self _meth_45ABCC873B3874DC( flag );
}

saygenericdialogue( _id_830A1FCFBE58BAF4 )
{
    _id_4ADE3AE5C138C8B3::saygenericdialogue( _id_830A1FCFBE58BAF4 );
}

getturretaimanglessp( turret )
{
    return turret _meth_DA8B640E4593582E();
}

getusedturret()
{
    return self getturret();
}

updatefrantic()
{
    if ( self.unittype == "c6i" || scripts\engine\utility::actor_is3d() || self.team == "neutral" )
        return anim.success;

    _id_6B7BEE46F2C6DA28 = gettime();

    if ( !isdefined( self._blackboard.franticcooldowntime ) || self._blackboard.franticcooldowntime > _id_6B7BEE46F2C6DA28 )
    {
        _id_A4A7CBAACB7CC0CD = getaiarray( scripts\engine\utility::get_enemy_team( self.team ) );
        _id_0775B9DD7CEE9529 = 0;
        timeout = 10000;
        _id_8BBC3C1A2867361F = 4194304;
        _id_AE15E053B9483E7C = 5;
        self._blackboard.franticcooldowntime = _id_6B7BEE46F2C6DA28 + 10000;
        self._blackboard.franticstate = "combat";

        foreach ( enemy in _id_A4A7CBAACB7CC0CD )
        {
            _id_A9B6B677F6D0A010 = distancesquared( self lastknownpos( enemy ), self.origin );

            if ( _id_A9B6B677F6D0A010 > _id_8BBC3C1A2867361F )
                continue;

            _id_6747992B3D918F29 = gettime() - self lastknowntime( enemy );

            if ( _id_6747992B3D918F29 > timeout )
                continue;

            _id_0775B9DD7CEE9529++;

            if ( enemy.unittype == "c8" || enemy.unittype == "c12" )
            {
                self._blackboard.franticstate = "frantic";
                break;
            }

            if ( _id_0775B9DD7CEE9529 >= 3 )
            {
                self._blackboard.franticstate = "frantic";
                break;
            }
        }
    }

    return anim.success;
}

soldier_damagesubparthandler( _id_99137F3B2D0EC5F0 )
{
    switch ( _id_99137F3B2D0EC5F0.partname )
    {
        case "helmet":
            if ( isdefined( self.nohelmetpop ) && self.nohelmetpop )
            {

            }

            if ( isdefined( self.onlyhelmetpopondeath ) && self.onlyhelmetpopondeath )
            {

            }

            scripts\asm\soldier\death::helmetpop();
            break;
    }
}
