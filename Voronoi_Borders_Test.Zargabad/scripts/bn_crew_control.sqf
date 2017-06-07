private ["_veh","_varname"];
_veh = _this select 0;
_varname = _this select 1;
_veh setVariable ["requiredPilot","isPilot"];
_veh addEventHandler ["getIn",{_this spawn {
	diag_log _this;
	private ["_veh","_varname"];
	_veh = _this select 0;
	_varname = _veh getVariable ["requiredPilot","default"];
	while {player in _veh} do {
		if ((player == driver _veh || player == _veh turretUnit [0]) && {!(player getVariable [_varname, false])}) exitWith {
			hint "Вы не умеете управлять такой техникой.";
			moveOut player;
		};
		sleep 1;
	};
}}];