private ["_veh"];
_veh = _this select 0;
clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
_veh addBackpackCargoGlobal ["rhs_sidor",2];
_veh addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK",8];
_veh addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK_green",8];
_veh addMagazineCargoGlobal ["rhs_VOG25",8];
_veh addMagazineCargoGlobal ["rhs_GRD40_Green",4];
_veh addMagazineCargoGlobal ["rhs_VG40OP_white",4];
_veh addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR",4];
_veh addItemCargoGlobal ["ACE_wirecutter", 1];
_veh addItemCargoGlobal ["ACE_EntrenchingTool",2];
_veh addBackpackCargoGlobal ['APOBS_A',1];
_veh addBackpackCargoGlobal ['APOBS_B',1];