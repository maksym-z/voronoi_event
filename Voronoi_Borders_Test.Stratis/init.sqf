[] call compile preprocessFileLineNumbers "geography.sqf";
colors = ["ColorRed",	"ColorOrange",	"ColorYellow",	"ColorGreen",	"ColorBlue",		"ColorCIV",		"ColorBlack",	"ColorWhite",	"ColorBrown"];
 
//voronoi_region_

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

/*
{
	["mrkVertex"+(str _forEachIndex), _x select 0, _x select 1, 1, "hd_dot", "ColorGreen"] call bn_fnc_marker_icon;
} forEach (voronoi_vertices);
*/

bn_fnc_draw_voronoi_ridge = {
	params ["_ridge_index",["_color","ColorBlack"]];
	deleteMarker (format ["mrk_ridge_%1",_ridge_index]);
	private _vertex_indices = voronoi_ridge_vertices select _ridge_index;
	if ((_vertex_indices select 0 >= 0) && (_vertex_indices select 1 >= 0)) then {
		[voronoi_vertices select (_vertex_indices select 0), voronoi_vertices select (_vertex_indices select 1), _color, 10, format ["mrk_ridge_%1",_ridge_index]] call bn_fnc_draw_line;
	};
};

{	
	_region = voronoi_regions select (voronoi_point_to_region select _forEachIndex);
	if (count _region > 2) then {_region pushBack (_region select 0)};
	for "_i" from 0 to ((count _region) - 2) do {
		private _begin_index = (_region select _i);
		private _end_index = (_region select _i+1);
		if ((_begin_index != -1) && (_end_index != -1)) then {
			_im = [voronoi_vertices select _begin_index, voronoi_vertices select _end_index, colors select (_forEachIndex mod count colors),10] call bn_fnc_draw_line;
			_im setMarkerAlpha 0.05;
		};
	};
	_point = _x;
	_mrk = ["vor" + (str _forEachIndex), _point select 0, _point select 1, 0.75, "hd_flag",colors select (_forEachIndex mod count colors)] call bn_fnc_marker_icon;
	_mrk setMarkerText (str _forEachIndex);
} forEach voronoi_points;

{
	[_forEachIndex] call bn_fnc_draw_voronoi_ridge;
} forEach voronoi_ridge_points;

bn_fnc_export_points = {
	private _points = [];
	{
		_points pushBack ((getPos _x) select [0,2])
	} forEach (allMissionObjects "Flag_Red_F");
	copyToClipboard (str _points);
};

[] call compile preprocessFileLineNumbers "click_processor.sqf";