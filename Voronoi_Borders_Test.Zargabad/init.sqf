/*
[] call compile preprocessFileLineNumbers "geography.sqf";
[] call compile preprocessFileLineNumbers "progress.sqf";

BN_REGION_UNDER_ATTACK = selectRandom ([] call bn_fnc_get_attackable_regions);
BN_ATTACK_START_REGION = selectRandom ([BN_REGION_UNDER_ATTACK] call bn_fnc_get_neighbors);
[] call bn_fnc_draw_borders;
*/