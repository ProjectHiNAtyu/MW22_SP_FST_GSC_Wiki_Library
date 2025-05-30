// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    setup_callbacks();
}

setup_callbacks()
{
    level.agent_funcs["player"]["think"] = ::agent_player_dom_think;
}

agent_player_dom_think()
{
    thread _id_685D900E8C69168A::_id_A2AC3E4C0F66C599();
}

agent_squadmember_dom_think()
{
    _id_5A94482DD280F417 = undefined;

    foreach ( trigger in self.owner.touchtriggers )
    {
        if ( trigger.id == "domFlag" )
            _id_5A94482DD280F417 = trigger;
    }

    if ( isdefined( _id_5A94482DD280F417 ) )
    {
        _id_A2191D9C6BBA5BA1 = _id_5A94482DD280F417 _id_2061B77AD4A7BBA3::getflagteam();

        if ( _id_A2191D9C6BBA5BA1 != self.team )
        {
            if ( !_id_685D900E8C69168A::bot_is_capturing_flag( _id_5A94482DD280F417 ) )
                _id_685D900E8C69168A::capture_flag( _id_5A94482DD280F417, "critical", 1 );

            return 1;
        }
    }

    return 0;
}
