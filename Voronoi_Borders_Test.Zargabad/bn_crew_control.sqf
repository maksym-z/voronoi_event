private ["_veh","_varname"];
_veh = _this select 0;
_varname = _this select 1;
if (isDedicated) exitWith {};
if ((_veh getVariable ["requiredCrew","default"]) == _varname) exitWith {};
_veh setVariable ["requiredCrew",_varname];
_veh addEventHandler ["getIn",{_this spawn {
	private ["_veh","_varname"];
	_veh = _this select 0;
	_varname = _veh getVariable ["requiredCrew","default"];
	while {player in _veh} do {
		if ((player == driver _veh || player == _veh turretUnit [0]) && {!(player getVariable [_varname, false])}) exitWith {
			hint "Вы не умеете управлять такой техникой.";
			moveOut player;
		};
		sleep 1;
	};
}}];