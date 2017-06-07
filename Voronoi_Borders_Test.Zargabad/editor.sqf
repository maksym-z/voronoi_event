
bn_fnc_export_points = {
	private _points = [];
	{
		_points pushBack ((getPos _x) select [0,2])
	} forEach (allMissionObjects "Flag_Red_F");
	copyToClipboard (str _points);
	hint "Points exported to clipboard.";
};

bn_fnc_export_geography = {
	private _export_string = format[
		"voronoi_vertices = %1; /n voronoi_regions = %2; /n voronoi_ridge_vertices = %3; voronoi_ridge_points = %4; voronoi_points = %5;",
		str voronoi_vertices,
		str voronoi_regions,
		str voronoi_ridge_vertices,
		str voronoi_ridge_points,
		str voronoi_points
	];
	copyToClipboard (_export_string);
	hint "Geography exported to clipboard.";
};


{	
	_region = voronoi_regions select (voronoi_point_to_region select _forEachIndex);
	if (count _region > 2) then {_region pushBack (_region select 0)};
	for "_i" from 0 to ((count _region) - 2) do {
		private _begin_index = (_region select _i);
		private _end_index = (_region select _i+1);
		if ((_begin_index != -1) && (_end_index != -1)) then {
			_im = [voronoi_vertices select _begin_index, voronoi_vertices select _end_index, bn_sector_colors select (_forEachIndex mod count bn_sector_colors),10] call bn_fnc_draw_line;
			_im setMarkerAlpha 0.05;
		};
	};
	_point = _x;
	_mrk = ["vor" + (str _forEachIndex), _point select 0, _point select 1, 0.75, "hd_flag",bn_sector_colors select(sector_owners select _forEachIndex)] call bn_fnc_marker_icon;
	_mrk setMarkerText (str _forEachIndex);
} forEach voronoi_points;

[] call compile preprocessFileLineNumbers "click_processor.sqf";