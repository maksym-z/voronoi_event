_veh = _this select 0;

clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
_veh addItemcargoGlobal ["hlc_20rnd_762x51_b_G3",10];
_veh addItemcargoGlobal ["rhs_mag_m67",5];
_veh addItemcargoGlobal ["rhs_mag_an_m8hc",5];