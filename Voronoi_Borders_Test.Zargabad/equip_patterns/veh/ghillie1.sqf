private ["_veh"];
if (!isServer) exitWith {};
_veh = _this select 0;
clearItemCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
_veh addmagazineCargoGlobal ["rhs_100Rnd_762x54mmR",3];
_veh addmagazineCargoGlobal ["rhs_20rnd_9x39mm_SP6",3];
_veh addmagazineCargoGlobal ["rhs_20rnd_9x39mm_SP5",3];
_veh addmagazineCargoGlobal ["rhs_30Rnd_545x39_7N10_AK",12];
_veh addItemCargoGlobal ["IEDUrbanBig_Remote_Mag",2];
_veh addItemCargoGlobal ["ACE_Tripod",1];
_veh addItemCargoGlobal ["ACE_SpottingScope",1];
_veh addItemCargoGlobal ["ACE_Clacker",2];
_veh addItemCargoGlobal ['pzn_f1',10];
_veh addBackpackCargoGlobal ['B_Bergen_tna_F',2];
_veh addWeaponCargoGlobal ['rhs_weap_rpg26',2];