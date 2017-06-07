private ["_veh"];
_veh = _this select 0;
clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
_veh addMagazineCargoGlobal ["BN_rhs_mag_og9v",6];
_veh addMagazineCargoGlobal ["BN_rhs_mag_pg9v",6];