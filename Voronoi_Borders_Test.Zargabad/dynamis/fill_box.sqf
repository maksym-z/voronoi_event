private ["_box","_choice"];
_choice = _this select 0;
_box = _this select 1;
hint str (_choice);
diag_log "current box:";
diag_log _box;
//(player getVariable ["bn_current_box",objNull]);
	if (_choice == "СПГ") then {
		_box addBackpackCargoGlobal ["RHS_SPG9_Gun_Bag", 1]; 
		_box addBackpackCargoGlobal ["RHS_SPG9_Tripod_Bag", 1]; 
		_box addMagazineCargoGlobal ["BN_rhs_mag_pg9n",6]; 
		_box addMagazineCargoGlobal ["BN_rhs_mag_pg9v",6]; 
		_box addBackpackCargoGlobal ["rhs_sidor", 2]; 
	};
	if (_choice == "2х Корд") then {
		_box addBackpackCargoGlobal ["RHS_Kord_Gun_Bag", 2]; 
		_box addBackpackCargoGlobal ["RHS_Kord_Tripod_Bag", 2]; 
		_box addMagazineCargoGlobal ["rhs_mag_127x108mm_50",8]; 
		_box addBackpackCargoGlobal ["rhs_sidor", 2]; 
	};
	if (_choice == "8 ПП мин") then {
		_box addMagazineCargoGlobal ["APERSTripMine_Wire_Mag",8]; 
		_box addBackpackCargoGlobal ["rhs_sidor", 2]; 
	};
	if (_choice == "АГС") then {
		_box addBackpackCargoGlobal ["RHS_AGS30_Gun_Bag", 1]; 
		_box addBackpackCargoGlobal ["RHS_AGS30_Tripod_Bag", 1]; 
		_box addMagazineCargoGlobal ["RHS_mag_VOG30_30",3]; 
		_box addBackpackCargoGlobal ["rhs_sidor", 1]; 
	};
	if (_choice == "ЗУ-23-2") then {
		_zu = "RHS_ZU23_MSV" createVehicle bn_zu_pos;
		_zu setPosATL bn_zu_pos;
		_box addMagazineCargoGlobal ["BN_40Rnd_23mm",2]; 
		_box addBackpackCargoGlobal ["rhs_sidor", 2]; 
		["mrkZU", bn_zu_pos select 0, bn_zu_pos select 1, 1, "mil_dot","ColorWhite","ЗУ-23-2", "ICON", {side player == west}] remoteExec ["tu_decoration_fnc_create_marker", 2];
	};
	if (_choice == "РПО-М") then {
		_box addWeaponCargoGlobal ["pzn_rpom", 1]; 
	};
	if (_choice == "КСВК") then {
		_box addWeaponCargoGlobal ["CUP_srifle_ksvk", 1]; 
		_box addItemCargoGlobal ["CUP_optic_PSO_3",1]; 
		_box addMagazineCargoGlobal ["CUP_5Rnd_127x108_KSVK_M",3]; 
		_box addBackpackCargoGlobal ["rhs_sidor", 1]; 
	};
	if (_choice == "Легкий БПЛА") then {
		_box addItemCargoGlobal ["O_UavTerminal",1]; 
		_box addBackpackCargoGlobal ["TU_cheap_UAV_backpack_Red", 1]; 
	};
	if (_choice == "") exitWith {};
[_box,"removeAllActions"] call BIS_fnc_MP;