private ["_veh"];
_veh = _this select 0;
clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
_veh addBackpackCargoGlobal ["rhs_sidor",2];
_veh addItemCargoGlobal ["ACE_Track",1];
_veh addItemCargoGlobal ["ToolKit",1];