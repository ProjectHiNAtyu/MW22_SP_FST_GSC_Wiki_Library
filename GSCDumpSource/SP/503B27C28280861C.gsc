// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

main()
{
    self endon( "death" );
    self notify( "killanimscript" );
    self notify( "clearSuppressionAttack" );

    if ( getdvarint( "dvar_44D5699D19BFAFC2" ) == 1 )
    {
        scripts\asm\asm::asm_clearfacialanim();
        scripts\asm\asm_bb::bb_clearanimscripted();
        scripts\asm\asm_sp::asm_animscripted();
    }

    _id_35D214A16728F33E = 1;

    if ( istrue( self._id_61EB9D2BD6F5F40A ) )
        _id_35D214A16728F33E = 0;

    if ( _id_35D214A16728F33E && ( isdefined( self._id_AE3EA15396B65C1F ) || isdefined( self.animationarchetype ) ) )
    {
        if ( isdefined( self.codescripted["pitch_min"] ) )
        {
            _id_AE4BD9DB62367D96 = scripts\asm\asm::asm_getheadlookknobifexists();

            if ( isdefined( _id_AE4BD9DB62367D96 ) )
            {
                self.lookatatrnode = self.codescripted["lookat_atr_node"];
                self _meth_9AAA1F734275234A( self.codescripted["pitch_min"], self.codescripted["pitch_max"], self.codescripted["yaw_min"], self.codescripted["yaw_max"] );
                self setanim( _id_AE4BD9DB62367D96, 1.0, 0.2, 1.0, self.lookatatrnode );
            }
        }
    }

    self endon( "end_sequence" );
    _id_539C2DCC0A467746 = self.codescripted["parent"];

    if ( isdefined( _id_539C2DCC0A467746 ) )
    {
        self.codescripted["origin"] = _id_539C2DCC0A467746.origin + rotatevector( self.codescripted["origin"], _id_539C2DCC0A467746.angles );
        self.codescripted["angles"] = combineangles( _id_539C2DCC0A467746.angles, self.codescripted["angles"] );
    }

    if ( isdefined( self.scriptedthread ) )
        self thread [[ self.scriptedthread ]]();

    self _meth_1A31445623292FC0( self.codescripted["notifyName"], self.codescripted["origin"], self.codescripted["angles"], self.codescripted["anim"], self.codescripted["animMode"], self.codescripted["root"], self.codescripted["goalTime"], self.codescripted["animRate"], undefined, undefined, undefined, undefined, undefined, self.codescripted["scripted_node_ent"] );
    self.codescripted = undefined;

    if ( isdefined( self.scripted_dialogue ) )
    {
        _id_4ADE3AE5C138C8B3::sayspecificdialogue( self.scripted_dialogue, "scripted_anim_facedone" );
        self.scripted_dialogue = undefined;
    }

    if ( isdefined( self.deathstring_passed ) )
        self.deathstring = self.deathstring_passed;

    self waittill( "killanimscript" );
}

init( notifyname, origin, angles, _id_64885102A4A4C1F5, _id_D060059807A71FA6, root, goaltime, _id_07B60BC0EAB3FD1E, _id_4E8B81ACE0138702, _id_4E686BACDFED0EE8, _id_B157F968024E98FB, _id_B134EF6802283B45, _id_8C0A07E2C59563BA, _id_43E50904D011917E )
{
    self.codescripted = undefined;
    self.codescripted["notifyName"] = notifyname;
    self.codescripted["origin"] = origin;
    self.codescripted["angles"] = angles;
    self.codescripted["anim"] = _id_64885102A4A4C1F5;

    if ( isdefined( _id_D060059807A71FA6 ) )
        self.codescripted["animMode"] = _id_D060059807A71FA6;
    else
        self.codescripted["animMode"] = "normal";

    self.codescripted["goalTime"] = goaltime;
    self.codescripted["animRate"] = _id_07B60BC0EAB3FD1E;
    self.codescripted["root"] = root;
    self.codescripted["pitch_min"] = _id_4E8B81ACE0138702;
    self.codescripted["pitch_max"] = _id_4E686BACDFED0EE8;
    self.codescripted["yaw_min"] = _id_B157F968024E98FB;
    self.codescripted["yaw_max"] = _id_B134EF6802283B45;
    self.codescripted["lookat_atr_node"] = _id_8C0A07E2C59563BA;
    self.codescripted["scripted_node_ent"] = _id_43E50904D011917E;
    _id_539C2DCC0A467746 = self getlinkedparent();

    if ( isdefined( _id_539C2DCC0A467746 ) )
    {
        self.codescripted["parent"] = _id_539C2DCC0A467746;
        self.codescripted["origin"] = rotatevectorinverted( origin - _id_539C2DCC0A467746.origin, _id_539C2DCC0A467746.angles );
        self.codescripted["angles"] = combineangles( invertangles( _id_539C2DCC0A467746.angles ), angles );
    }

    switch ( self.unittype )
    {
        case "dog":
            init_dog();
            break;
        default:
            if ( self._id_AE3EA15396B65C1F == "c6" )
                init_c6();
            else
                init_human();

            break;
    }
}

#using_animtree("generic_human");

init_human()
{
    if ( !isdefined( self.codescripted["root"] ) )
        self.codescripted["root"] = %body;
}

#using_animtree("dog");

init_dog()
{
    if ( !isdefined( self.codescripted["root"] ) )
        self.codescripted["root"] = %body;
}

#using_animtree("c6");

init_c6()
{
    if ( !isdefined( self.codescripted["root"] ) )
        self.codescripted["root"] = %body;
}
