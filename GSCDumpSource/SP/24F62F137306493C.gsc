// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

bindactionscripts()
{
    if ( isdefined( level._btactions["enemy_combatant"] ) )
        return;

    bt = spawnstruct();
    bt.actionfn = [];
    bt.actionfn[0] = scripts\aitypes\combat::_id_F7D7F5A416BA048F;
    bt.actionfn[1] = scripts\aitypes\combat::_id_A38AD5564FCAFC54;
    bt.actionfn[2] = scripts\aitypes\stealth::stealth_initfriendly;
    bt.actionfn[3] = scripts\aitypes\stealth::stealth_initneutral;
    bt.actionfn[4] = scripts\aitypes\stealth::_id_E75FF8B7F46A7761;
    bt.actionfn[5] = scripts\aitypes\stealth::_id_2AE6E5FA8AD77612;
    bt.actionfn[6] = scripts\aitypes\stealth::_id_2EEA6ED25456E38D;
    bt.actionfn[7] = scripts\aitypes\stealth::_id_4C41840DA22ED656;
    bt.actionfn[8] = scripts\aitypes\combat::ifshoulddosmartobject;
    bt.actionfn[9] = scripts\aitypes\combat::dosmartobject;
    bt.actionfn[10] = scripts\aitypes\combat::dosmartobject_init;
    bt.actionfn[11] = scripts\aitypes\combat::dosmartobjectterminate;
    bt.actionfn[12] = scripts\aitypes\stealth::hunt_active_terminate;
    bt.actionfn[13] = scripts\aitypes\stealth::idle_init;
    bt.actionfn[14] = scripts\aitypes\stealth::idle_terminate;
    bt.actionfn[15] = scripts\aitypes\cover::initreload;
    bt.actionfn[16] = scripts\aitypes\combat_sp::soldier_init;
    bt.actionfn[17] = scripts\aitypes\melee::initmeleefunctions;
    bt.actionfn[18] = scripts\aitypes\combat_sp::initcombatfunctions;
    level._btactions["enemy_combatant"] = bt;
}

registerbehaviortree()
{
    bindactionscripts();
    _func_866EF0680E03FE86( "enemy_combatant" );
}
