private ["_box","_random_list"];
_box = _this select 0;
_random_list = _this select 1;
_box setVariable ["bn_random_list",_random_list];
if (isServer) then {
	clearWeaponCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearBackpackCargoGlobal _box;
};
_box addAction ["Выбрать средство усиления","dynamis\selectable_item.sqf"];