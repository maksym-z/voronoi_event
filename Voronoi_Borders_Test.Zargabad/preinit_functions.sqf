
bn_random_pick = {
	private ["_hay"];
	_hay = _this select 0;
	_condition = _this select 0;
	_hay select (floor (random(count _hay)))
};

bn_fnc_marker_icon = { //[name, x, y, size, icon, color]
	_newmarker = createMarker [_this select 0, [_this select 1, _this select 2]];
	_newmarker setMarkerSize [_this select 3, _this select 3];
	_newmarker setMarkerShape 'icon';
	_newmarker setMarkerType (_this select 4);
	_newmarker setMarkerColor (_this select 5);
	_newmarker;
};

bn_fnc_find_nearest = {
	params ["_array","_position"];
	private _nearest = _array select 0;
	{
		if (_x distance _position < _nearest distance _position) then {
			_nearest = _x;
		};
	} forEach _array;
	_nearest
};

bn_extended_spawn_range = 2000;

bn_serp_draw_zone_condition = {
	params ["_zoneSide", "_zonePos"];
	_zoneSide != east
};

bn_fnc_draw_borders = {
	params ["_trigger_pos"];
	if (side player == east) then {
		_newmarker = createMarkerLocal ["mrk_extended_spawn", _trigger_pos];
		_newmarker setMarkerSizeLocal [bn_extended_spawn_range, bn_extended_spawn_range];
		_newmarker setMarkerShapeLocal "ELLIPSE";
		_newmarker setMarkerColorLocal "ColorGreen";
		_newmarker setMarkerBrushLocal "Border";
	};
	_newmarker = createMarkerLocal ["mrk_blue_border", _trigger_pos];
	_newmarker setMarkerSizeLocal [750, 750];
	_newmarker setMarkerShapeLocal "ELLIPSE";
	_newmarker setMarkerColorLocal "ColorRed";
	_newmarker setMarkerBrushLocal "Border";
};

bn_mp_setPos = {
	diag_log ["bn_mp_setPos",_this];
	(_this select 0) setPos [_this select 1, _this select 2, _this select 3];
	(_this select 0) setVariable ["SerP_startPos", [_this select 1, _this select 2, _this select 3],true];
};