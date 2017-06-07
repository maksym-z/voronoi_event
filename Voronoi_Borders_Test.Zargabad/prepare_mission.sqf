if (!isServer) exitWith {};

#include "dynamis\const.hpp"

[] call compile preprocessFileLineNumbers "geography.sqf";
[] call compile preprocessFileLineNumbers "progress.sqf";

BN_REGION_UNDER_ATTACK = selectRandom ([] call bn_fnc_get_attackable_regions);
private _eligible_attack_start_regions = [BN_REGION_UNDER_ATTACK, [0]] call bn_fnc_get_neighbors;
if ({(voronoi_points select _x) distance (voronoi_points select BN_REGION_UNDER_ATTACK) > 1500} count _eligible_attack_start_regions > 0) then {
	_eligible_attack_start_regions = _eligible_attack_start_regions select {(voronoi_points select _x) distance (voronoi_points select BN_REGION_UNDER_ATTACK) > 1500};
};
BN_ATTACK_START_REGION = selectRandom (_eligible_attack_start_regions);

// set random time
setDate [2012, 8, 2, floor(random(DAY_DURATION))+DAY_START, floor(random(60))]; 

// select a random target
_all_triggers = (allMissionObjects "EmptyDetector") select {((getPos _x) select 0) > 10};
_all_markers = allMapMarkers;

BN_TRIGGER = [_all_triggers, voronoi_points select BN_REGION_UNDER_ATTACK] call bn_fnc_find_nearest;
publicVariable "BN_TRIGGER";

ATTACK_START = [allMissionObjects "Sign_Arrow_Large_Blue_F", voronoi_points select BN_ATTACK_START_REGION] call bn_fnc_find_nearest;
ATTACK_START_POS = getPos ATTACK_START;
ATTACK_DIR = ((getDir ATTACK_START) +90) mod 360;
// select a spawn zone for defenders near the target

DEFENSE_START = [allMissionObjects "Sign_Arrow_Large_Blue_F", voronoi_points select BN_REGION_UNDER_ATTACK] call bn_fnc_find_nearest;
DEFENSE_START_POS = getPos DEFENSE_START;

DEFENSE_DIR= ((getDir DEFENSE_START)+90) mod 360;

// move the formations to the spawn points, centered around the first vehicle
dx=0;
dy=0;
corePosAttack = getPos core_attack_pos;
corePosDefense = getPos core_defense_pos;

{
	if (!(isNil "corePosAttack" && isNil "corePosAttack") && {(_x distance corePosAttack) min (_x distance corePosDefense) < 500}) then {
		if ((side _x == ATTACK_SIDE) || {(side ((nearestObjects [_x, ["CAManBase"], 100]) select 0))== ATTACK_SIDE}) then {
			_x setVariable ["bn_attack_side",true];
			if (isNil "corePosAttack") then {
				corePosAttack = getPos _x;
				diag_log "no corePosAttack";
				dx=0;
				dy=0;
			} else {
				dx = (getPos _x select 0) - (corePosAttack select 0);
				dy = (getPos _x select 1) - (corePosAttack select 1);
			};
		} else {
			if (isNil "corePosDefense") then {
				corePosDefense = getPos _x;
				diag_log "no corePosDefense";
				dx=0;
				dy=0;
			} else {
				dx = (getPos _x select 0) - (corePosDefense select 0);
				dy = (getPos _x select 1) - (corePosDefense select 1);
			};
		};
		d = sqrt (dx*dx + dy*dy);
		if ((side _x == ATTACK_SIDE) || (_x getVariable ["bn_attack_side",false])) then {
	//		diag_log [typeof _x, ATTACK_DIR, dx, dy, dx*(sin ATTACK_DIR), dy*(cos ATTACK_DIR)];
			//поворот фигуры на угол
			xdash = dx * (cos ATTACK_DIR) - dy * (sin ATTACK_DIR);
			ydash = dx * (sin ATTACK_DIR) + dy * (cos ATTACK_DIR);
			_newpos = ((ATTACK_START_POS vectorAdd [xdash, 0-ydash,0]) findEmptyPosition [0,10,typeOf _x]);
			_x setPos _newpos;
	//		[[_x] + _newpos,"bn_mp_setPos",_x,false,true] call BIS_fnc_MP;
			([_x] + _newpos) remoteExecCall ["bn_mp_setPos", _x, false];
			if ((_x isKindOf "CAManBase")) then {_x setDir (ATTACK_DIR+180)} else {_x setDir (ATTACK_DIR-90)};
		} else {
			diag_log ("Setting pos of " + (str _x));
			xdash = dx * (cos DEFENSE_DIR) - dy * (sin DEFENSE_DIR);
			ydash = dx * (sin DEFENSE_DIR) + dy * (cos DEFENSE_DIR);
			_newpos = ((DEFENSE_START_POS vectorAdd [xdash, 0-ydash,0]) findEmptyPosition [0,10,typeOf _x]);
			_x setPos _newpos;
	//		[[_x] + _newpos,"bn_mp_setPos",_x,false,true] call BIS_fnc_MP;
			([_x] + _newpos) remoteExecCall ["bn_mp_setPos", _x, false];
			if ((_x isKindOf "CAManBase")) then {_x setDir (DEFENSE_DIR)} else {_x setDir (DEFENSE_DIR-90)};
		};
		_x setVariable ["SerP_startPos",getPos _x,true];
	};
//	diag_log [_x, getPos _x];
} forEach (vehicles + playableUnits);

bn_SerP_zones = [[DEFENSE_START_POS,50, DEFENSE_SIDE countSide playableUnits, DEFENSE_SIDE, playableUnits select {(side _x) == DEFENSE_SIDE},[]],[ATTACK_START_POS,50, ATTACK_SIDE countSide playableUnits, ATTACK_SIDE, playableUnits select {(side _x) == ATTACK_SIDE},[]]];
//	_zones = [];
//[_pos,_size,_unitsInZone,_side]

// water spawns
// Sign_Arrow_Direction_Blue_F

WATER_SPAWNS = (nearestObjects [ATTACK_START_POS, ["Sign_Arrow_Direction_Blue_F"], 1000]);
if ((count WATER_SPAWNS) > 0) then {
/*
	_markerstr = createMarker ["waterspawn", getPos (WATER_SPAWNS select 0)];
	_markerstr setMarkerShape "ICON";
	_markerstr setMarkerSize [0.5,0.5];
	_markerstr setMarkerColor "ColorRed";
	_markerstr setMarkerType "c_ship";
*/	
	_heli = "B_Heli_Light_01_F" createVehicle (getPos (WATER_SPAWNS select 0));
};

// delete helper objects
_markerstr = createMarker ["markername", BN_TRIGGER];
if (triggerArea BN_TRIGGER select 3) then {
	_markerstr setMarkerShape "RECTANGLE";
} else {
	_markerstr setMarkerShape "ELLIPSE";
};
_markerstr setMarkerSize [triggerArea BN_TRIGGER select 0, triggerArea BN_TRIGGER select 1];
_markerstr setMarkerDir (triggerArea BN_TRIGGER select 2);
_markerstr setMarkerColor "ColorRed";

BN_TRIGGER setTriggerActivation ["ANY", "PRESENT", true];
if (DEFENSE_SIDE==resistance) then {DEFENSE_SIDE_NAME="resistance"};
if (DEFENSE_SIDE==west) then {DEFENSE_SIDE_NAME="west"};

BN_TRIGGER setTriggerStatements [format ["(%1 countSide thislist > 0) && ((%2 countSide thislist) * 4 < (%3 countSide thislist))", str(ATTACK_SIDE), DEFENSE_SIDE_NAME, str(ATTACK_SIDE)], "", ""];
diag_log (triggerStatements BN_TRIGGER);
[getPos BN_TRIGGER select 0, getPos BN_TRIGGER select 1, BN_TRIGGER getDir ATTACK_START_POS] call compile preprocessFileLineNumbers "dynamis\borders.sqf";

{deleteVehicle _x} forEach (_all_triggers - [BN_TRIGGER]);

[getPos BN_TRIGGER] remoteExec ["bn_fnc_draw_borders",0,true];

[] call bn_fnc_draw_borders;

bn_mission_prepared = 1;
publicVariable "bn_mission_prepared";