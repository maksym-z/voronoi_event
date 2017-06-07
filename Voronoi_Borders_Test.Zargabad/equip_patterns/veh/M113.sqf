_veh = _this select 0;

clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
_veh addBackpackCargoGlobal ["B_FieldPack_oli",3];
_veh addItemcargoglobal ["ToolKit", 1];
["ACE_Track", _veh] call ace_cargo_fnc_loadItem;
_veh addItemCargoGlobal ["ACE_EntrenchingTool",2];
_veh addItemcargoGlobal ["hlc_20rnd_762x51_b_G3",20];
_veh addItemcargoGlobal ["rhs_mag_M433_HEDP",4];
_veh addItemcargoGlobal ["rhs_mag_m67",10];
_veh addItemcargoGlobal ["rhs_mag_an_m8hc",10];
_veh addWeaponCargoGlobal ["rhs_weap_m72a7",3];
_veh addMagazineCargoGlobal ["rhs_mag_100rnd_127x99_mag",8];