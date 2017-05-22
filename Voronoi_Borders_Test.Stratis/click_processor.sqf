bn_ve_currentVertex = -1;

bn_ve_find_nearest_vertex = {
	params ["_position"];
//	hint ("click processor " + str _position);
	private _current_distance = 100;
	private _current_vertex = -1;
	{
		if (_x distance _position < _current_distance) then {
			_current_vertex = _forEachIndex;
			_current_distance = _x distance _position;
		};
	} forEach voronoi_vertices;
	hint (format ["Vertex selected: %1",_current_vertex]);
	_current_vertex
};

bn_ve_move_current_vertex = {
	params ["_position"];
	voronoi_vertices set [bn_ve_currentVertex, +_position];
	_affected_ridges = [];
	{
		if (bn_ve_currentVertex in _x) then {
			_affected_ridges pushBack _forEachIndex;
		};
	} forEach voronoi_ridge_vertices;
	{
		[_x] call bn_fnc_draw_voronoi_ridge;
	} forEach _affected_ridges;
	bn_ve_currentVertex = -1;
};

bn_fnc_receive_click = {
	params ["_position"];
	if (bn_ve_currentVertex < 0) then {
		bn_ve_currentVertex = [_position] call bn_ve_find_nearest_vertex;
	} else {
		 [_position] call bn_ve_move_current_vertex;
	};
};

["bn_mapClickEH", "onMapSingleClick", {
	[_pos] call bn_fnc_receive_click;
}, []] call BIS_fnc_addStackedEventHandler;