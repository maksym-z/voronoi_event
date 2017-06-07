if (isServer) then {
	0 = call compile preprocessFileLineNumbers "prepare_mission.sqf";
	[] call compile preprocessFileLineNumbers "SerP\freeztime\startmission_server.sqf";
};

if (!isDedicated) then {
	[] spawn compile preprocessFileLineNumbers "SerP\freeztime\startmission_client.sqf";
};