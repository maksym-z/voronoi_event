{
	_veh = _x; 
	{_veh addMagazineCargoGlobal _x} forEach (_veh getVariable ["bn_add_mags",[]]);
	_veh setVariable ["bn_add_mags", Nil];
} forEach allMissionObjects "Car";