private ["_veh"];
_veh = _this select 0;
clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
_veh addMagazineCargoGlobal ["rhs_45Rnd_545X39_7N22_AK",2];
_veh addMagazineCargoGlobal ["rhs_45Rnd_545X39_AK_Green",2];
_veh addBackpackCargoGlobal ["rhs_sidor",2];
_veh addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK",4];
_veh addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK_green",4];
_veh addMagazineCargoGlobal ["rhs_VOG25",10];
_veh addMagazineCargoGlobal ["rhs_GRD40_Green",3];
_veh addMagazineCargoGlobal ["rhs_VG40OP_white",3];
_veh addWeaponCargoGlobal ["rhs_weap_rpg26",1];
_veh addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag",2];
_veh addMagazineCargoGlobal ["rhs_rpg7_OG7V_mag",3];
_veh addItemCargoGlobal ["ACE_EntrenchingTool",3];
_veh addItemCargoGlobal ['pzn_f1',12];