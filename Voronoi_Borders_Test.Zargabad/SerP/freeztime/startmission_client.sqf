SerP_trashArray = [];
SerP_planeList = [];
waitUntil{player==player};
setViewDistance SerP_viewDistance;
if (count(playableUnits)==0||!alive(player)) exitWith {};//костыль для запуска в синглплеерном редакторе

apply_extended_spawn = false;
if (side player == east) then {
	apply_extended_spawn = true;
};

if (isNil "bn_serp_too_far_condition") then {
	bn_serp_too_far_condition = {
		params ["_zone_pos", "_size"];
		private ["_ppos","_dist"];
		if (apply_extended_spawn) then {
			_ppos = getPos vehicle player;
			if (!isNil "BN_TRIGGER") then {
				_dist = _ppos distance BN_TRIGGER;
			} else {
				_dist = bn_extended_spawn_range+200;
			};
			_dist<(bn_extended_spawn_range)
		} else {
			_ppos = getPos vehicle player;
			_dist = [_ppos select 0,_ppos select 1,0] distance [_zone_pos select 0,_zone_pos select 1,0];
			_dist>(_size+SerP_hintzonesize)
		};
	};
};
if (isNil "bn_serp_alarm_condition") then {
	bn_serp_alarm_condition = {
		params ["_zone_pos", "_size"];
		private ["_ppos","_dist"];
		if (apply_extended_spawn) then {
			_ppos = getPos vehicle player;
			if (!isNil "BN_TRIGGER") then {
				_dist = _ppos distance BN_TRIGGER;
			} else {
				_dist = bn_extended_spawn_range+200;
			};
			_dist<(bn_extended_spawn_range+SerP_hintzonesize)
		} else {
			_ppos = getPos vehicle player;
			_dist = [_ppos select 0,_ppos select 1,0] distance [_zone_pos select 0,_zone_pos select 1,0];
			_dist>_size
		};
	};
};


sleep .1;
waitUntil{!isNil {findDisplay 46}};
_veh = (vehicle player);
_veh enableSimulation false;
player setVariable ["SerP_isPlayer",true,true];
openMap [true,true];
sleep 1;

try {
	_waitTime = time + 90;
	waitUntil{sleep 1;
		!isNil{SerP_warbegins}||(time>_waitTime)
	};
	if isNil{SerP_warbegins} then {SerP_warbegins = 1};
	if (SerP_warbegins==1) then {throw "SerP_warbegins"};
	{SerP_warbegins!=1} spawn SerP_blocker;
	_sideIndex = 2;
	_side = side player;
	switch (side player) do {
		case (SerP_sideREDFOR): {_sideIndex = 1;_side = "REDFOR";};
		case (SerP_sideBLUEFOR): {_sideIndex = 0;_side = "BLUEFOR";};
	};
	if (_sideIndex<2) then {
		_radio=createTrigger["EmptyDetector",[0,0]];
		_radio setTriggerActivation["INDIA","PRESENT",true];
		_radio setTriggerStatements["this","call SerP_toggleReady",""];
		SerP_trashArray set [count SerP_trashArray, _radio];

		_endTrigger = createTrigger["EmptyDetector",[0,0]];
		_endTrigger setTriggerActivation ["ANY", "PRESENT", true];
		_endTrigger setTriggerStatements[
			format["(SerP_readyArray select %1)",_sideIndex],
			"9 setRadioMsg localize ""STR_SerP_continueBriefing"";",
			"9 setRadioMsg localize ""STR_SerP_endBriefing"";"
			];
		SerP_trashArray set [count SerP_trashArray, _endTrigger];

		9 setRadioMsg localize "STR_SerP_endBriefing";
	};
	_waitTime = time + 90;
	waitUntil{sleep 1;
		!isNil{SerP_startZones}||(time>_waitTime)
	};

	if isNil{SerP_startZones} then {
		SerP_startZones = [[getPos(vehicle player),SerP_defZoneSize,1,objNull,objNull]];
	};
	_inZone = false;
	{
		_x params ["_zone_pos","_size","_dont_care","_helper"];
		_ppos = player getVariable ["SerP_startPos",getPos vehicle player];
		_dist = [_ppos select 0,_ppos select 1,0] distance [_zone_pos select 0,_zone_pos select 1,0];
		if (_dist<(_size+SerP_hintzonesize)) exitWith {
			_inZone = true;
			_waitTime = time + 90;
			waitUntil {sleep .5;(time>_waitTime)||((getDir _helper != 0)&&!(isNull _helper))||(isNull _helper)};
			openMap [false,false];
			_veh enableSimulation true;
			while {(SerP_warbegins!=1)} do {
				sleep 1;
				private _too_far_condition = [_zone_pos, _size] call bn_serp_too_far_condition;
				private _alarm_condition = [_zone_pos, _size] call bn_serp_alarm_condition;
				if (_too_far_condition) then {
					["SerP_alarm",["", localize "STR_SerP_sorry"]] call BIS_fnc_showNotification;
					sleep 4;
					playSound "SmallExplosion";
					player setPos (player getVariable ["SerP_startPos",[_zone_pos select 0,_zone_pos select 1,0]]);
					sleep 3;
				};
				if (_alarm_condition) then {
					["SerP_alarm",["", localize "STR_SerP_outOfZone"]] call BIS_fnc_showNotification;
					(vehicle player) setVelocity [0,0,0];
					sleep 3;
				};
			};
			throw "";
		};
	} forEach SerP_startZones;
	throw "outOfZone";
}
catch {
	if (_exception == "outOfZone") then {
		"startmission_client.sqf - player is out of zones" call SerP_debug;
		_veh enableSimulation true;
		openMap [false,false];
	};
	if (_exception == "SerP_warbegins") then {
		_veh enableSimulation true;
		openMap [false,false];
	};
};
