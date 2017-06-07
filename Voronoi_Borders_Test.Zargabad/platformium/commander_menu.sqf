bn_adjust_markers = {
	private _position = _this;
	if (isDedicated || {side player == east}) then {
		_mrk = ["bn_extraction_point_marker",_position select 0, _position select 1, 1, 'mil_end', 'ColorGreen','Точка эвакуации'] call bn_fnc_local_marker_icon;
		_mrk2 = ["bn_extraction_area_marker",_position select 0, _position select 1, 100, '', 'ColorGreen','','ELLIPSE'] call bn_fnc_local_marker_icon;
		if (isServer) then {
			tu_log_update_markers pushBack _mrk;
			tu_log_update_markers pushBack _mrk2;
			trgExtraction setPos _position;
		};
	};
};

waitUntil {player == player};

if (player == commander_blue) exitWith {

	[] call compile preprocessFileLineNumbers "platformium\fnc\bn_selector.sqf";
	bn_force_multipliers = [];
	
	["Средство усиления (доп. персонал не предусмотрен):"] call bn_selector_create_group;
		["Дополнительный БТР-60","btr = 'LOP_AFR_BTR60' createVehicle [2331,13160]; [btr] call compile preprocessFileLineNumbers 'equip_patterns\veh\HMW.sqf'; bn_force_multipliers = [btr]; "] call bn_selector_add_item;
		["60-мм миномёт (БК: 24 мины) и буссоль","{_veh = _x createVehicle [2331,13160]; bn_force_multipliers pushBack _veh} forEach ['BN_m224_box','BN_60mm_shells_box','BN_60mm_smoke_box','BN_60mm_shells_box','BN_60mm_shells_box'];"] call bn_selector_add_item;
		["3х ДШКМ в ящиках","{_veh = _x createVehicle [2331,13160]; bn_force_multipliers pushBack _veh} forEach ['BN_DSHKMH_box','BN_127_108_ammo_box','BN_DSHKMH_box','BN_127_108_ammo_box','BN_DSHKMH_box','BN_127_108_ammo_box'];"] call bn_selector_add_item;

	["Выбери расположение средства усиления на карте."] call bn_selector_create_group;
		["Вариант 1","bn_force_multiplier_pos = [2331,13160,0]",[2331,13160]] call bn_selector_add_item;
		["Вариант 2","bn_force_multiplier_pos = [3398,12818,0]",[3398,12818]] call bn_selector_add_item;
		["Вариант 3","bn_force_multiplier_pos = [2632,11696,0]",[2632,11696]] call bn_selector_add_item;
		["Вариант 4 (не рекомендуется для миномёта)","bn_force_multiplier_pos = [2710,12342,0]",[2710,12342]] call bn_selector_add_item;
			
	[[4998,14006],-50] call bn_selector_paint;
	
	[] spawn {
		sleep 1;
		{
			_x setPos (bn_force_multiplier_pos vectorAdd [_forEachIndex*4,0,0]);
		} forEach bn_force_multipliers;
	};
};

if (player == commander_red) exitWith {

	[] call compile preprocessFileLineNumbers "platformium\fnc\bn_selector.sqf";
	bn_possible_positions = [];
	{
		bn_possible_positions pushBack (getPos _x);
		deleteVehicle _x;
	} forEach allMissionObjects 'Flag_Red_F';
	bn_possible_positions = bn_possible_positions call BIS_fnc_arrayShuffle;
	bn_possible_positions = bn_possible_positions select [0, 4];
	bn_extraction_point = bn_possible_positions select 0; // default option
	
	["Выбери точку эвакуации на карте."] call bn_selector_create_group;
		{
			["Возможная точка эвакуации " + str (_forEachIndex+1), "bn_extraction_point = " + (str _x) + ";", _x] call bn_selector_add_item;
		} forEach bn_possible_positions;
			
	[[4998,14006],-50,"publicVariableServer 'bn_extraction_point'; bn_extraction_point remoteExec ['bn_adjust_markers']"] call bn_selector_paint;
}