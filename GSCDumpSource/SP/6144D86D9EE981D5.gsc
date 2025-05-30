// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

#using_animtree("generic_human");

_id_88FDDB3F49798CF8()
{
    level.scr_anim["generic"]["secured_stand"][0] = %estate_prisoner_tied_idle04;
    level.scr_anim["generic"]["secured_crouch"][0] = %hostage_knees_idle;
    level.scr_anim["generic"]["secured_prone"][0] = %zip_tie_floor_idle_civ01;
}

_id_EC647F66FD4EAEBE( _id_9016FE4D53EDF29D, _id_2445E1148769275B, _id_1DF99C5DE05DE391, _id_D1CD6C3D70240A2F, _id_E17B3A55625272EB )
{
    self endon( "death" );
    scripts\engine\utility::ent_flag_init( "secured" );

    if ( isdefined( self._id_50E27BAF1CB17E06 ) )
        self [[ self._id_50E27BAF1CB17E06 ]]();
    else
    {
        temp = scripts\engine\utility::spawn_tag_origin();
        temp.origin = self gettagorigin( "J_Wrist_RI" ) + ( 0, 0, 6 );
        temp scripts\sp\player\cursor_hint::create_cursor_hint( "tag_origin", ( 0, 0, 0 ), &"SCRIPT/HINT_SECURE", 45, 80, 70, 1 );
        thread scripts\engine\utility::delete_on_death( temp );
        temp waittill( "trigger" );
    }

    scripts\engine\utility::ent_flag_set( "secured" );

    if ( isai( self ) && isdefined( self.weapon ) )
        scripts\common\ai::gun_remove();

    _id_853109C1D1596D59 = isdefined( _id_2445E1148769275B );

    if ( _id_853109C1D1596D59 )
        _id_869E4EEFB559F49D = isdefined( level.scr_anim[self.animname][_id_2445E1148769275B] );

    scripts\sp\utility::context_melee_allow( 0 );
    scripts\common\ai::_id_82A45E8AEF44CE3F( ::_id_115C540730651118 );
    self.allowdeath = 1;
    self.skipdeathanim = 1;

    if ( istrue( self._animactive ) )
    {
        if ( isdefined( _id_D1CD6C3D70240A2F ) )
        {
            ender = scripts\engine\utility::ter_op( isdefined( _id_E17B3A55625272EB ), _id_E17B3A55625272EB, "stop_loop" );
            _id_D1CD6C3D70240A2F notify( ender );
        }
        else if ( isdefined( anim.callbacks["StopAnimscripted"] ) )
            self [[ anim.callbacks["StopAnimscripted"] ]]();
        else
            scripts\engine\sp\utility::anim_stopanimscripted();
    }

    _id_DCA6BD8CD35F9E77 = undefined;

    if ( isdefined( _id_1DF99C5DE05DE391 ) )
        _id_DCA6BD8CD35F9E77 = _id_1DF99C5DE05DE391;
    else
    {
        _id_88FDDB3F49798CF8();

        if ( !isdefined( _id_9016FE4D53EDF29D ) )
            _id_9016FE4D53EDF29D = "crouch";
        else
        {

        }

        _id_DCA6BD8CD35F9E77 = "secured_" + _id_9016FE4D53EDF29D;
    }

    if ( _id_853109C1D1596D59 )
        scripts\common\anim::anim_single_solo( self, _id_2445E1148769275B );

    level.player thread _id_CCC820D1294511AD();
    thread scripts\common\anim::anim_generic_loop( self, _id_DCA6BD8CD35F9E77 );
}

_id_CCC820D1294511AD()
{
    if ( isdefined( self._id_FAC32C9303B72F30 ) )
        return;

    self._id_FAC32C9303B72F30 = 1;
    self endon( "death" );
    wait 0.25;
    self playrumbleonentity( "damage_light" );
    self enablequickweaponswitch( 1 );
    self disableweapons();
    wait 0.2;

    if ( soundexists( "loot_pickup_armor" ) )
        self playsound( "loot_pickup_armor" );

    self viewkick( 1, self.origin, 0 );
    wait 0.2;
    self enableweapons();
    self enablequickweaponswitch( 0 );
    self._id_FAC32C9303B72F30 = undefined;
}

_id_115C540730651118()
{
    if ( scripts\engine\utility::is_equal( self.lastattacker, level.player ) )
    {
        level thread scripts\sp\hud_util::fade_out( 0 );
        scripts\sp\player_death::set_custom_death_quote( 50 );
        scripts\sp\utility::missionfailedwrapper();
    }

    return 0;
}
