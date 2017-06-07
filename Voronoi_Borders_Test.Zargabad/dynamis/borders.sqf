private ["_x0","_y0","_xL","_yL","_xR","_yR","_alpha"];
_x0 = _this select 0;
_y0 = _this select 1;

{
	if (((_x find "mrkOut") >=0) && {((markerPos _x) distance [_x0,_y0]) > 500}) then {
		deleteMarker _x;
	};
} forEach allMapMarkers;