// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_36AE2D2C117CDB23( _id_CC4F2E0388379546 )
{
    switch ( _id_CC4F2E0388379546 )
    {
        case "hold_fire":
            return ::_id_EA2A4A330D127793;
        case "hold_fire_cleanup":
            return ::_id_336DB229EB81D51E;
        case "force_lookaround":
            return ::_id_280AEE8C8AB42EF7;
        case "force_lookaround_cleanup":
            return ::_id_1F0637E40C2A0DDA;
        case "on_user_added":
            return ::_id_72D72588305107B4;
        case "on_user_removed":
            return ::_id_8ADD99CB1B82B964;
        case "dialog":
            return ::_id_8A61C99BBF018323;
        case "gesture":
            return _id_26F456DBDF9AA216::_id_5AD32AB5F21DDF93;
    }
}

_id_72D72588305107B4( _id_F8D4ED108521E632 )
{
    self.battlechatterallowed = 0;
    self._id_A4709D00B598B7BF = 1;
}

_id_8ADD99CB1B82B964( _id_F8D4ED108521E632 )
{
    self.battlechatterallowed = 1;
    self.balwayscoverexposed = 1;
    self._id_A4709D00B598B7BF = 0;
    self.lastenemysightpos = undefined;
}

_id_EA2A4A330D127793( statename )
{
    thread _id_414B3C5423728952( statename, randomfloat( 2 ) );
}

_id_336DB229EB81D51E( statename )
{
    self.balwayscoverexposed = 0;
}

_id_280AEE8C8AB42EF7( statename )
{
    self._id_11F37C3FC868DADC = 1;
}

_id_1F0637E40C2A0DDA( statename )
{
    self._id_11F37C3FC868DADC = 0;
}

_id_414B3C5423728952( statename, t )
{
    self endon( "death" );
    self endon( "lkp_user_removed" );
    self endon( statename + "_bseq_finished" );
    wait( t );
    self.balwayscoverexposed = 1;
}

_id_8A61C99BBF018323( statename, params )
{
    dialog = params[0];

    if ( dialog == "he_was_just_here_dialog" )
        _id_5D265B4FCA61F070::say( "dx_cbc_usm1_target_lost_generic" );
    else if ( dialog == "checkin_it_out_dialog" )
        _id_5D265B4FCA61F070::say( "dx_cbc_usm1_checking_last_known_reply" );
    else if ( dialog == "he_is_gone_dialog" )
        _id_5D265B4FCA61F070::say( "dx_cbc_usm1_enemy_gone_inform" );
}
