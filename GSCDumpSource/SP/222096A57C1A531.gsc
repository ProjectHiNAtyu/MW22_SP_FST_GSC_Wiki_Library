// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    self.team = "allies";
    self.type = "human";
    self.unittype = "soldier";
    self.subclass = "regular";
    self.baseaccuracy = 0.2;
    self.accuracy = self.baseaccuracy;
    self.health = 150;
    self.grenadeweapon = makeweapon( "frag" );
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script( "" );
    self.sidearm = scripts\code\ai::create_weapon_in_script( "iw9_pi_papa220_sp", "sidearm" );
    self.behaviortreeasset = "enemy_combatant";
    self.asmasset = "soldier";
    self.defaultcoverselector = "cover_default";
    self.enemyselector = "enemyselector_default";

    if ( isai( self ) )
    {
        self _meth_E99626ADD202FE1A( 0, "entity" );
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
        self _meth_9215CE6FC83759B9( 0.0 );
        self _meth_B59F57D948B9C744( -1, -1 );
    }

    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "ar";
    self.weapon = scripts\code\ai::create_weapon_in_script( [ "iw9_ar_mcbravo_sp" ] );
    _id_0D9E63CB98CE8CBB::_id_951CCE2992B1B0E2();
}

spawner()
{
    self _meth_B835644FA7207B8C( "allies" );
}

precache( classname )
{
    _id_0D9E63CB98CE8CBB::_id_430419022A9C3FFE();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    behaviortree\enemy_combatant::registerbehaviortree();
    _func_A39466ADC48F650F( "iw9_ar_mcbravo_sp" );
    _func_A39466ADC48F650F( "iw9_pi_papa220_sp" );
    _func_A39466ADC48F650F( "frag" );
}
