private ["_veh"];
_veh = _this select 0;
clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
_veh addBackpackCargoGlobal ["rhs_sidor",2];
_veh addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag",3];
_veh addMagazineCargoGlobal ["rhs_rpg7_OG7V_mag",3];