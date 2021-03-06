bn_sector_colors = ["ColorGreen", "ColorBlue", "ColorRed", "ColorOrange", "ColorYellow", "ColorCIV", "ColorBlack", "ColorWhite", "ColorBrown"];
sector_perimeters = [];
sector_open_perimeters = [];

bn_fnc_marker_icon = { //[name, x, y, size, icon, color]
	_newmarker = createMarker [_this select 0, [_this select 1, _this select 2]];
	_newmarker setMarkerSize [_this select 3, _this select 3];
	_newmarker setMarkerShape 'icon';
	_newmarker setMarkerType (_this select 4);
	_newmarker setMarkerColor (_this select 5);
	_newmarker;
};

bn_fnc_get_vertex_coords = {
	params ["_vertex_index"];
	
};

bn_fnc_draw_line = { // [start, end, color, size]
	params ["_start","_end","_color","_size",["_mname",""]];
	
	_dist = sqrt(((_end select 0)-(_start select 0))^2+((_end select 1)-(_start select 1))^2) * 0.5;
	_ang = ((_end select 0)-(_start select 0)) atan2 ((_end select 1)-(_start select 1));
	_center = [(_start select 0)+sin(_ang)*_dist,(_start select 1)+cos(_ang)*_dist];

	if (_mname == "") then {
		private _hash = "";
		{
			_hash = _hash + (str (round _x)) + "_";
		} forEach _start + _end;
		_mname = "mrkLine"+_hash+"_"+_color;
	};
	_mrk = createMarker [_mname, _center];

	// define marker
	_mrk setMarkerDir _ang;
	_mrk setMarkerPos _center;
	_mrk setMarkerShape "RECTANGLE";
	_mrk setMarkerBrush "SOLID";
	_mrk setMarkerColor _color;
	_mrk setMarkerSize [_size, _dist];

	// return marker
	_mrk
};

bn_fnc_draw_voronoi_ridge = {
	params ["_ridge_index",["_color","ColorBlack"]];
	deleteMarker (format ["mrk_ridge_%1",_ridge_index]);
	private _vertex_indices = voronoi_ridge_vertices select _ridge_index;
	if ((_vertex_indices select 0 >= 0) && (_vertex_indices select 1 >= 0)) then {
		[voronoi_vertices select (_vertex_indices select 0), voronoi_vertices select (_vertex_indices select 1), _color, 10, format ["mrk_ridge_%1",_ridge_index]] call bn_fnc_draw_line;
	};
};


bn_fnc_ridge_length = {
	params ["_ridge_index"];
	private _vertex_indices = voronoi_ridge_vertices select _ridge_index;
	if ((_vertex_indices select 0 >= 0) && (_vertex_indices select 1 >= 0)) then {
		(voronoi_vertices select (_vertex_indices select 0)) distance (voronoi_vertices select (_vertex_indices select 1))
	} else {
		0
	};
};

bn_fnc_draw_borders = {
	{
		_x params ["_region_one","_region_two"];
		if (_region_one == BN_REGION_UNDER_ATTACK || _region_two == BN_REGION_UNDER_ATTACK) then {
			if (_region_one == BN_REGION_UNDER_ATTACK) then {
				[_forEachIndex, bn_sector_colors select (sector_owners select _region_two)] call bn_fnc_draw_voronoi_ridge;
			} else {
				[_forEachIndex, bn_sector_colors select (sector_owners select _region_one)] call bn_fnc_draw_voronoi_ridge;
			};
		} else {
			if ((sector_owners select _region_one) != (sector_owners select _region_two)) then {
				[_forEachIndex] call bn_fnc_draw_voronoi_ridge;
			};
		};
	} forEach voronoi_ridge_points;
	{
		_point = _x;
		_mrk = ["vor" + (str _forEachIndex), _point select 0, _point select 1, 0.75, "hd_flag",bn_sector_colors select(sector_owners select _forEachIndex)] call bn_fnc_marker_icon;
		_mrk setMarkerText (str _forEachIndex);
	} forEach voronoi_points;
};

bn_fnc_get_neighbors = {
	params ["_region",["_exclude_owners",[]]];
	private _result = [];
	{
		_x params ["_region_one","_region_two"];
		if ((_region_one == _region || _region_two == _region) && !(-1 in [_region_one, _region_two])) then {
			if (_region_one == _region) then {
				if !((sector_owners select _region_two) in _exclude_owners) then {
					_result pushBackUnique _region_two;
				};
			} else {
				if !((sector_owners select _region_one) in _exclude_owners) then {
					_result pushBackUnique _region_one;
				};
			};
		};
	} forEach voronoi_ridge_points;
	_result
};

bn_fnc_calculate_perimeters = {
	sector_perimeters resize (count voronoi_ridge_points);
	sector_perimeters = sector_perimeters apply {0};
	sector_open_perimeters resize (count voronoi_ridge_points);
	sector_open_perimeters = sector_open_perimeters apply {0};
	{
		_x params ["_region_one","_region_two"];
		private _ridge_length = [_forEachIndex] call bn_fnc_ridge_length;
		if ((sector_owners select _region_one) != (sector_owners select _region_two)) then {
			diag_log [(sector_owners select _region_one), (sector_owners select _region_two)];
			sector_open_perimeters set [_region_one, (sector_open_perimeters select _region_one) + _ridge_length];
			sector_open_perimeters set [_region_two, (sector_open_perimeters select _region_two) + _ridge_length];
		};
		sector_perimeters set [_region_one, (sector_perimeters select _region_one) + _ridge_length];
		sector_perimeters set [_region_two, (sector_perimeters select _region_two) + _ridge_length];
	} forEach voronoi_ridge_points;
};

bn_fnc_get_attackable_regions = {
	[] call bn_fnc_calculate_perimeters;
	_attackable_region_indexes = [];
	{
		if ((sector_perimeters select _forEachIndex > 0) && (sector_owners select _forEachIndex == 0)) then {
			if (((sector_open_perimeters select _forEachIndex) / (sector_perimeters select _forEachIndex) >= 0.4)) then {
				_attackable_region_indexes pushBack _forEachIndex;
			};
		};
	} forEach voronoi_regions;
	_attackable_region_indexes
};