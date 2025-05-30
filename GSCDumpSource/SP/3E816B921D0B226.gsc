// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

try_announce_sound( _id_BE3605030AEF1714, _id_74B5B12BB6514385, _id_5125C340EACE0872 )
{
    if ( isalive( self ) && !should_sound_take_priority( _id_BE3605030AEF1714 ) )
        return 0;

    self notify( "try_announce_sound_" + _id_BE3605030AEF1714 );
    self endon( "try_announce_sound_" + _id_BE3605030AEF1714 );
    self endon( "death" );
    self endon( "long_death" );

    if ( isdefined( _id_74B5B12BB6514385 ) && _id_74B5B12BB6514385 > 0 )
        wait( _id_74B5B12BB6514385 );

    if ( !can_announce_sound( _id_BE3605030AEF1714 ) )
    {
        self.stealth.current_requested_snd = undefined;
        return 0;
    }

    return play_stealth_vo( _id_BE3605030AEF1714, undefined, _id_5125C340EACE0872 );
}

should_sound_take_priority( _id_BE3605030AEF1714 )
{
    if ( !isdefined( self.stealth.current_requested_snd ) )
    {
        self.stealth.current_requested_snd = _id_BE3605030AEF1714;
        return 1;
    }

    if ( get_snd_priority( _id_BE3605030AEF1714 ) < get_snd_priority( self.stealth.current_requested_snd ) )
    {
        self.stealth.current_requested_snd = _id_BE3605030AEF1714;
        return 1;
    }

    return 0;
}

get_snd_priority( _id_BE3605030AEF1714 )
{
    switch ( _id_BE3605030AEF1714 )
    {
        case "ally_killed":
        case "gunshot_teammate":
        case "ally_damaged":
        case "gunshot":
        case "explosion":
            return 1;
        case "hunting":
        case "backup_call":
        case "drone_spotted":
        case "spotted":
        case "moving_up":
            return 2;
        case "enemysweep":
        case "start_seek":
        case "keep_searching":
        case "lost_sight":
        case "order_team_seek":
            return 3;
        case "inquiry":
        case "found_corpse":
        case "saw_corpse":
            return 4;
        case "patrol_update_low":
        case "patrol_update_high":
        case "hmph":
        case "acknowledgement":
        case "warning1":
        case "warning2":
            return 5;
        default:
            iprintln( "Can't get priority for snd " + _id_BE3605030AEF1714 );
            return undefined;
    }
}

can_announce_sound( _id_BE3605030AEF1714 )
{
    if ( !isalive( self ) )
        return 0;

    if ( istrue( self.in_melee_death ) )
        return 0;

    if ( !isdefined( level.stealth.next_sound_time ) || !isdefined( level.stealth.next_sound_time[_id_BE3605030AEF1714] ) )
        level.stealth.next_sound_time[_id_BE3605030AEF1714] = -10;

    time = gettime();

    if ( time < level.stealth.next_sound_time[_id_BE3605030AEF1714] )
        return 0;

    add_announce_debounce( _id_BE3605030AEF1714 );
    return 1;
}

add_announce_debounce( _id_BE3605030AEF1714, _id_74B5B12BB6514385 )
{
    self endon( "death" );

    if ( isdefined( _id_74B5B12BB6514385 ) && _id_74B5B12BB6514385 > 0 )
        wait( _id_74B5B12BB6514385 );

    if ( isarray( _id_BE3605030AEF1714 ) )
    {
        foreach ( _id_AD31D3F4297A5BAB in _id_BE3605030AEF1714 )
            level.stealth.next_sound_time[_id_AD31D3F4297A5BAB] = gettime() + level.stealth.next_sound_wait;
    }
    else
        level.stealth.next_sound_time[_id_BE3605030AEF1714] = gettime() + level.stealth.next_sound_wait;
}

play_stealth_vo( _id_BE3605030AEF1714, _id_063EAB21A30B0ACE, _id_5125C340EACE0872 )
{
    result = 0;
    _id_2FBD15F53BEEBA71 = undefined;

    if ( !isdefined( self.stealth.voiceid ) )
        return 0;

    _id_DEC9BCCE93873125 = "dx_bcs_";

    if ( istrue( _id_063EAB21A30B0ACE ) )
        _id_DEC9BCCE93873125 = get_country_prefix();

    switch ( _id_BE3605030AEF1714 )
    {
        case "moving_up":
            _id_BE3605030AEF1714 = "_movein_" + randomintrange( 1, 4 );
            break;
        case "keep_searching":
            _id_BE3605030AEF1714 = "_searchcont_" + randomintrange( 1, 5 );
            break;
        case "lost_sight":
            if ( distance( self.origin, level.player.origin ) < 450 )
                vol = "low";
            else
                vol = "high";

            if ( scripts\engine\utility::cointoss() )
                _id_BE3605030AEF1714 = "_losloss_" + vol + "_" + randomintrange( 1, 4 );
            else
                _id_BE3605030AEF1714 = "_enemylost_" + randomintrange( 1, 7 ) + "_" + vol;

            break;
        case "drone_spotted":
            _id_BE3605030AEF1714 = "_dronefound_" + randomintrange( 1, 4 );
            break;
        case "warning1":
            _id_BE3605030AEF1714 = "_enemyalerted";
            break;
        case "hmph":
            _id_BE3605030AEF1714 = "_backtopatrol";
            break;
        case "warning2":
            _id_BE3605030AEF1714 = "_enemysearch";
            break;
        case "backup_call":
            _id_BE3605030AEF1714 = "_enemybackup";
            break;
        case "hunting":
            _id_BE3605030AEF1714 = "_hunting_" + randomintrange( 1, 5 );
            break;
        case "acknowledgement":
            if ( self.stealth.voiceid == "sf1" )
            {
                _id_BE3605030AEF1714 = "_reinforcements_" + randomintrange( 1, 7 );

                if ( isdefined( _id_5125C340EACE0872 ) && isdefined( _id_5125C340EACE0872.entity ) && isai( _id_5125C340EACE0872.entity ) && isalive( _id_5125C340EACE0872.entity ) && distance2d( self.origin, _id_5125C340EACE0872.entity.origin ) >= 350 )
                    _id_2FBD15F53BEEBA71 = _id_5125C340EACE0872.entity;
            }
            else
                _id_BE3605030AEF1714 = "_reinforcements";

            break;
        case "spotted":
            if ( scripts\engine\utility::cointoss() )
                _id_BE3605030AEF1714 = "_targetfound";
            else
                _id_BE3605030AEF1714 = "_contact";

            break;
        case "start_seek":
        case "order_team_seek":
            if ( self.alertlevelint > 2 )
            {
                self.stealth.current_requested_snd = undefined;
                return 0;
            }

            _id_BE3605030AEF1714 = "_enemyfindplayer";

            if ( isdefined( level.stealth.candidatesvoice ) && level.stealth.candidatesvoice.size > 1 )
            {
                foreach ( guy in level.stealth.candidatesvoice )
                {
                    if ( isalive( guy ) && distance( self.origin, guy.origin ) > 550 )
                    {
                        _id_2FBD15F53BEEBA71 = guy;
                        break;
                    }
                }
            }

            break;
        case "saw_corpse":
            _id_BE3605030AEF1714 = "_enemyalerted";
            break;
        case "found_corpse":
            _id_BE3605030AEF1714 = "_corpsefound";
            break;
        case "explosion":
            if ( scripts\engine\utility::cointoss() )
                _id_BE3605030AEF1714 = "_noisealert";
            else
                _id_BE3605030AEF1714 = "_suprised";

            break;
        case "enemysweep":
            _id_BE3605030AEF1714 = "_enemysweep";
            break;
        case "ally_damaged":
        case "gunshot":
            if ( scripts\engine\utility::cointoss() && isdefined( _id_5125C340EACE0872.origin ) )
                _id_BE3605030AEF1714 = try_cardinal_gunshot( _id_5125C340EACE0872 );
            else
                _id_BE3605030AEF1714 = scripts\engine\utility::random( [ "_gunshot_4", "_gunshot_7", "_gunshot_9", "_gunshot_10" ] );

            break;
        case "gunshot_teammate":
            if ( scripts\engine\utility::cointoss() && isdefined( _id_5125C340EACE0872.origin ) )
                _id_BE3605030AEF1714 = try_cardinal_gunshot( _id_5125C340EACE0872 );
            else
                _id_BE3605030AEF1714 = scripts\engine\utility::random( [ "_gunshot_1", "_gunshot_2", "_gunshot_3", "_gunshot_5", "_gunshot_6", "_gunshot_8" ] );

            break;
        case "patrol_update_low":
            _id_BE3605030AEF1714 = try_cardinal_patrol_update( "low" );

            if ( !isdefined( _id_BE3605030AEF1714 ) )
                _id_BE3605030AEF1714 = scripts\engine\utility::random( [ "_areasecure_n_1_low", "_areasecure_s_1_low", "_areasecure_e_1_low", "_areasecure_w_1_low" ] );

            if ( isdefined( level.stealth.candidatesvoice ) && level.stealth.candidatesvoice.size > 1 )
            {
                foreach ( guy in level.stealth.candidatesvoice )
                {
                    if ( isalive( guy ) && distance( self.origin, guy.origin ) > 550 )
                    {
                        _id_2FBD15F53BEEBA71 = guy;
                        break;
                    }
                }
            }

            break;
        case "patrol_update_high":
            _id_BE3605030AEF1714 = try_cardinal_patrol_update( "high" );

            if ( !isdefined( _id_BE3605030AEF1714 ) )
                _id_BE3605030AEF1714 = scripts\engine\utility::random( [ "_areasecure_n_1_high", "_areasecure_s_1_high", "_areasecure_e_1_high", "_areasecure_w_1_high" ] );

            break;
        case "inquiry":
            if ( isdefined( _id_5125C340EACE0872 ) && isdefined( _id_5125C340EACE0872.typeorig ) && _id_5125C340EACE0872.typeorig == "unresponsive_teammate" && isdefined( _id_5125C340EACE0872.origin ) )
            {
                _id_BE3605030AEF1714 = "_searchreport_" + randomintrange( 1, 7 );
                _id_2FBD15F53BEEBA71 = _id_5125C340EACE0872.origin;
            }
            else
                _id_BE3605030AEF1714 = "_searchreport";

            break;
        case "ally_killed":
            _id_BE3605030AEF1714 = "_mandown";
            break;
    }

    alias = _id_DEC9BCCE93873125 + self.stealth.voiceid + _id_BE3605030AEF1714;
    result = play_stealth_vo_alias( alias, _id_2FBD15F53BEEBA71 );
    return result;
}

get_country_prefix()
{
    if ( !isdefined( anim.countryids ) )
        return "";

    if ( !isdefined( self.voice ) || !isdefined( anim.countryids[self.voice] ) )
        return "";

    return anim.countryids[self.voice] + "_";
}

try_cardinal_patrol_update( volume )
{
    _id_5049EA3DCC6ED882 = _id_35DE402EFC5ACFB3::getdirectioncompass( self.origin, ( 0, 0, 0 ) );

    if ( isdefined( _id_5049EA3DCC6ED882 ) && _id_5049EA3DCC6ED882 == "impossible" )
        return undefined;

    volume = scripts\engine\utility::ter_op( isdefined( volume ), "_" + volume, "_low" );
    num = randomintrange( 1, 5 );

    switch ( _id_5049EA3DCC6ED882 )
    {
        case "north":
            alias = "_areasecure_n_" + num + volume;
            break;
        case "northwest":
            if ( scripts\engine\utility::cointoss() )
                alias = "_areasecure_n_" + num + volume;
            else
                alias = "_areasecure_w_" + num + volume;

            break;
        case "northeast":
            if ( scripts\engine\utility::cointoss() )
                alias = "_areasecure_n_" + num + volume;
            else
                alias = "_areasecure_e_" + num + volume;

            break;
        case "south":
            alias = "_areasecure_s_" + num + volume;
            break;
        case "southwest":
            if ( scripts\engine\utility::cointoss() )
                alias = "_areasecure_s_" + num + volume;
            else
                alias = "_areasecure_w_" + num + volume;

            break;
        case "southeast":
            if ( scripts\engine\utility::cointoss() )
                alias = "_areasecure_s_" + num + volume;
            else
                alias = "_areasecure_e_" + num + volume;

            break;
        case "east":
            alias = "_areasecure_e_" + num + volume;
            break;
        case "west":
            alias = "_areasecure_w_" + num + volume;
            break;
        default:
            iprintln( "No cardinal direction returned" );
            alias = undefined;
            break;
    }

    return alias;
}

play_stealth_vo_alias( alias, _id_2FBD15F53BEEBA71 )
{
    result = 0;
    self.stealth.current_requested_snd = undefined;

    if ( soundexists( alias ) )
    {
        if ( !isdefined( self.stealth_vo_ent ) )
            self.stealth_vo_ent = spawn( "script_origin", self.origin );

        if ( isdefined( self.stealth_vo_ent ) )
        {
            if ( isdefined( self.model ) && scripts\engine\utility::hastag( self.model, "j_head" ) )
                self.stealth_vo_ent linkto( self, "j_head", ( 0, 0, 0 ), ( 0, 0, 0 ) );

            self.stealth_vo_ent playsound( alias, "stealth_vo", 1 );

            if ( isdefined( _id_2FBD15F53BEEBA71 ) )
                scripts\engine\utility::delaythread( 0.3, ::playradiotransmission, alias, _id_2FBD15F53BEEBA71 );

            if ( should_try_generic_radio_confirmation( alias ) && !isdefined( _id_2FBD15F53BEEBA71 ) )
                thread generic_radio_confrimation();
        }

        if ( isdefined( self.stealth ) )
            self.stealth.last_sound_time = gettime();

        result = 1;
    }
    else
    {

    }

    return result;
}

should_try_generic_radio_confirmation( alias )
{
    if ( randomint( 100 ) > 60 )
        return 0;

    _id_A37D38AB220A18E8 = strtok( alias, "_" );

    switch ( _id_A37D38AB220A18E8[2] )
    {
        case "targetfound":
        case "enemyfindplayer":
        case "start_seek":
        case "gunshot_teammate":
        case "moving_up":
            return 1;
        default:
            return 0;
    }
}

generic_radio_confrimation()
{
    self endon( "death" );
    self notify( "generic_radio_confrimation" );
    self endon( "generic_radio_confrimation" );
    self.stealth_vo_ent waittill( "stealth_vo" );
    wait( randomfloatrange( 0.2, 0.4 ) );
    alias = "dx_bcs_sf1_radioconf";
    scripts\engine\sp\utility::play_sound_on_entity( alias );
}

announce_spotted_acknowledge( guy )
{
    origin = guy.origin;
    _id_DEC9BCCE93873125 = guy get_country_prefix();
    wait 1.5;

    if ( isdefined( guy ) && isdefined( guy.stealth.voiceid ) )
    {
        num = guy.stealth.voiceid;
        origin = guy.origin + ( 0, 0, 45 );
    }
    else
        num = randomint( 3 );

    alias = _id_DEC9BCCE93873125 + num + "_stealth_alert_r";
}

try_cardinal_gunshot( _id_5125C340EACE0872 )
{
    _id_5049EA3DCC6ED882 = _id_35DE402EFC5ACFB3::getdirectioncompass( self.origin, _id_5125C340EACE0872.origin );

    if ( isdefined( _id_5049EA3DCC6ED882 ) && _id_5049EA3DCC6ED882 == "impossible" )
        return;

    num = randomintrange( 1, 4 );

    switch ( _id_5049EA3DCC6ED882 )
    {
        case "north":
            alias = "_gunshot_n_" + num;
            break;
        case "northwest":
            if ( scripts\engine\utility::cointoss() )
                alias = "_gunshot_n_" + num;
            else
                alias = "_gunshot_w_" + num;

            break;
        case "northeast":
            if ( scripts\engine\utility::cointoss() )
                alias = "_gunshot_n_" + num;
            else
                alias = "_gunshot_e_" + num;

            break;
        case "south":
            alias = "_gunshot_s_" + num;
            break;
        case "southwest":
            if ( scripts\engine\utility::cointoss() )
                alias = "_gunshot_s_" + num;
            else
                alias = "_gunshot_w_" + num;

            break;
        case "southeast":
            if ( scripts\engine\utility::cointoss() )
                alias = "_gunshot_s_" + num;
            else
                alias = "_gunshot_e_" + num;

            break;
        case "east":
            alias = "_gunshot_e_" + num;
            break;
        case "west":
            alias = "_gunshot_w_" + num;
            break;
        default:
            iprintln( "No cardinal direction returned" );
            alias = undefined;
            break;
    }

    return alias;
}

play_commander_response()
{
    self endon( "death" );
    self.stealth_vo_ent waittill( "stealth_vo" );
    _id_7E9CCC2D6DDB44DA = scripts\engine\utility::random( scripts\engine\utility::array_randomize( [ "dx_bcs_rul_contsweep_1", "dx_bcs_rul_contsweep_2", "dx_bcs_rul_contsweep_3", "dx_bcs_rul_contsweep_n_1", "dx_bcs_rul_contsweep_e_1", "dx_bcs_rul_contsweep_s_1", "dx_bcs_rul_contsweep_w_1" ] ) );
    wait( randomfloatrange( 0.15, 0.25 ) );
    thread scripts\engine\sp\utility::play_sound_on_entity( _id_7E9CCC2D6DDB44DA );
}

playradiotransmission( alias, _id_905C88A5A40FC724 )
{
    if ( isai( _id_905C88A5A40FC724 ) )
    {
        if ( !isalive( _id_905C88A5A40FC724 ) )
            return;

        temp = _id_905C88A5A40FC724 scripts\engine\utility::spawn_script_origin();
        _id_905C88A5A40FC724 thread scripts\engine\utility::delete_on_death( temp );
        _id_905C88A5A40FC724 endon( "death" );
        temp linkto( _id_905C88A5A40FC724, "tag_eye", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        temp setentitysoundcontext( "atmosphere", "helmet" );
        temp playsound( alias, "sound_done" );
        temp waittill( "sound_done" );
        temp delete();
    }
    else if ( isvector( _id_905C88A5A40FC724 ) )
    {
        temp = scripts\engine\utility::spawn_script_origin( _id_905C88A5A40FC724, ( 0, 0, 0 ) );
        temp setentitysoundcontext( "atmosphere", "helmet" );
        temp playsound( alias, "sound_done" );
        temp waittill( "sound_done" );
        temp delete();
    }
}

_id_C8EC064357E0C742( _id_A675F64A80383D1E )
{
    if ( !isdefined( self.stealth ) )
        thread scripts\stealth\player::main();

    if ( !isdefined( self._id_BD670C1E0F4290DA ) )
        self._id_BD670C1E0F4290DA = "init";

    if ( !isdefined( _id_A675F64A80383D1E ) )
    {
        setmusicstate( "" );
        self._id_BD670C1E0F4290DA = "";
    }
    else if ( _id_A675F64A80383D1E != self._id_BD670C1E0F4290DA )
    {
        self._id_BD670C1E0F4290DA = _id_A675F64A80383D1E;
        setmusicstate( _id_A675F64A80383D1E );
    }
}

_id_F905EFBBE81CCD7D()
{
    if ( !isdefined( level.player._id_BD670C1E0F4290DA ) )
        return 0;

    if ( level.player._id_BD670C1E0F4290DA == "init" )
        return 0;

    return 1;
}

stealth_music_transition_sp( _id_A675F64A80383D1E )
{
    self notify( "stealth_music_transition" );
    self endon( "stealth_music_transition" );
    self endon( "disconnect" );

    if ( !isdefined( self.stealth ) )
        thread scripts\stealth\player::main();

    _id_B18D3429CF88F29F = 1.0;
    _id_D51349C1F64450E3 = 0.05;

    if ( !isdefined( self.stealth.music_ent ) )
        self.stealth.music_ent = [];

    alias = _id_A675F64A80383D1E;

    if ( isdefined( alias ) && !isdefined( self.stealth.music_ent[alias] ) )
    {
        self.stealth.music_ent[alias] = spawn( "script_model", self.origin );
        self.stealth.music_ent[alias] linkto( self );
        self.stealth.music_ent[alias].cur_vol = 0.0;
        self.stealth.music_ent[alias] _meth_F4604329F388A96F( 0.0 );
        self.stealth.music_ent[alias] playloopsound( alias );
    }

    for (;;)
    {
        wait( _id_D51349C1F64450E3 );
        _id_5E8903D4BDB17D48 = 0;

        foreach ( alias, ent in self.stealth.music_ent )
        {
            target = undefined;

            if ( isdefined( _id_A675F64A80383D1E ) && alias == _id_A675F64A80383D1E )
            {
                ent.cur_vol = min( 1.0, ent.cur_vol + _id_D51349C1F64450E3 / _id_B18D3429CF88F29F );
                target = 1.0;
            }
            else
            {
                ent.cur_vol = max( 0.0, ent.cur_vol - _id_D51349C1F64450E3 / _id_B18D3429CF88F29F );
                target = 0.0;
            }

            ent _meth_F4604329F388A96F( ent.cur_vol );

            if ( ent.cur_vol == target )
                _id_5E8903D4BDB17D48++;
        }

        if ( _id_5E8903D4BDB17D48 == self.stealth.music_ent.size )
        {
            foreach ( alias, ent in self.stealth.music_ent )
            {
                if ( !isdefined( _id_A675F64A80383D1E ) || alias != _id_A675F64A80383D1E )
                {
                    self.stealth.music_ent[alias] delete();
                    self.stealth.music_ent[alias] = undefined;
                }
            }

            return;
        }
    }
}

_id_5D3533B9142557D7( _id_E3108E412AFB3811 )
{
    if ( !isdefined( _id_E3108E412AFB3811 ) )
        _id_E3108E412AFB3811 = 1;

    level.player._id_088606454E690C77.active = _id_E3108E412AFB3811;
}
