// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    self.team = "axis";
    self.type = "human";
    self.unittype = "soldier";
    self.subclass = "regular";
    self.baseaccuracy = 1;
    self.accuracy = self.baseaccuracy;
    self.health = 150;
    self.grenadeweapon = makeweapon( "frag" );
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script( "" );
    self.sidearm = scripts\code\ai::create_weapon_in_script( "iw9_pi_papa220_sp", "sidearm" );
    self.behaviortreeasset = "enemy_combatant";
    self.asmasset = "soldier";
    self.defaultcoverselector = "cover_dmr";
    self.enemyselector = "enemyselector_default";

    if ( isai( self ) )
    {
        self _meth_E99626ADD202FE1A( 0, "entity" );
        self setengagementmindist( 1250.0, 1024.0 );
        self setengagementmaxdist( 1600.0, 2400.0 );
        self _meth_9215CE6FC83759B9( 0.0 );
        self _meth_B59F57D948B9C744( -1, -1 );
    }

    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "dmr";
    self.weapon = scripts\code\ai::create_weapon_in_script( [ "iw9_dm_scromeo_sp" ] );
    _id_687325E5C597E4FB = undefined;
    characters = [ "character_iw9_enemy_pmc_1_1", "character_iw9_enemy_pmc_1_2", "character_iw9_enemy_pmc_1_3", "character_iw9_enemy_pmc_2_1", "character_iw9_enemy_pmc_2_2", "character_iw9_enemy_pmc_2_3", "character_iw9_enemy_pmc_3_1", "character_iw9_enemy_pmc_3_2", "character_iw9_enemy_pmc_3_3" ];

    switch ( scripts\code\character::get_random_character( 9, _id_687325E5C597E4FB, characters ) )
    {
        case 0:
            _id_7133A3CF004F0F68::_id_951CCE2992B1B0E2();
            break;
        case 1:
            _id_47ACE6D37ED7FFE1::_id_951CCE2992B1B0E2();
            break;
        case 2:
            _id_61285BC5FAD5CB52::_id_951CCE2992B1B0E2();
            break;
        case 3:
            _id_662F123F264F55A5::_id_951CCE2992B1B0E2();
            break;
        case 4:
            _id_01D7A25AAC56BB3C::_id_951CCE2992B1B0E2();
            break;
        case 5:
            _id_75198A447C12B923::_id_951CCE2992B1B0E2();
            break;
        case 6:
            _id_1FA03487563B531E::_id_951CCE2992B1B0E2();
            break;
        case 7:
            _id_24DDA36F65CD58DB::_id_951CCE2992B1B0E2();
            break;
        case 8:
            _id_2EDBBC8CAC4328F4::_id_951CCE2992B1B0E2();
            break;
    }
}

spawner()
{
    self _meth_B835644FA7207B8C( "axis" );
}

precache( classname )
{
    _id_7133A3CF004F0F68::_id_430419022A9C3FFE();
    _id_47ACE6D37ED7FFE1::_id_430419022A9C3FFE();
    _id_61285BC5FAD5CB52::_id_430419022A9C3FFE();
    _id_662F123F264F55A5::_id_430419022A9C3FFE();
    _id_01D7A25AAC56BB3C::_id_430419022A9C3FFE();
    _id_75198A447C12B923::_id_430419022A9C3FFE();
    _id_1FA03487563B531E::_id_430419022A9C3FFE();
    _id_24DDA36F65CD58DB::_id_430419022A9C3FFE();
    _id_2EDBBC8CAC4328F4::_id_430419022A9C3FFE();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    behaviortree\enemy_combatant::registerbehaviortree();
    _func_A39466ADC48F650F( "iw9_dm_scromeo_sp" );
    _func_A39466ADC48F650F( "iw9_pi_papa220_sp" );
    _func_A39466ADC48F650F( "frag" );
}
