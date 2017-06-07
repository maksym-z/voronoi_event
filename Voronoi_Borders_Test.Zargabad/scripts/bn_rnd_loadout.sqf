if (!isServer) exitWith {};
private ["_unit","_loadout", "_rank","_arr_rifles","_arr_rifle_mags","_rnd"];
_unit = _this select 0;
_loadout = _this select 1;
_rank = _this select 2;
diag_log _this;

// 	removeVest _unit;
//	removeUniform _unit;


// hlc_rifle_saiga12k

_arr_rifles = [
	"rhs_weap_aks74u",
	"RH_M16a1",
	"rhs_weap_akm_gp25",
	"rhs_weap_ak74m_gp25_dtk",
	"hlc_rifle_g3sg1",
	"rhs_weap_akm",
	"rhs_weap_akm",
	"rhs_weap_akm",
	"rhs_weap_akms",
	"rhs_weap_ak74m_dtk",
	"rhs_weap_ak74m_dtk",
	"rhs_weap_ak74m_2mag_camo_dtk"
	];
_arr_rifle_mags = [
	["rhs_30Rnd_545x39_7N10_AK"],
	["30Rnd_556x45_Stanag"],
	["rhs_30Rnd_762x39mm","rhs_VOG25"],
	["rhs_30Rnd_545x39_AK","rhs_VOG25"],
	["hlc_20rnd_762x51_b_G3"],
	["rhs_30Rnd_762x39mm"],
	["rhs_30Rnd_762x39mm"],
	["rhs_30Rnd_762x39mm"],
	["rhs_30Rnd_762x39mm"],
	["rhs_30Rnd_545x39_AK"],
	["rhs_30Rnd_545x39_AK"],
	["rhs_30Rnd_545x39_AK"]
];

_arr_mgs = [
	"hlc_lmg_m60",
	"rhs_weap_pkm",
	"rhs_weap_pkm"
	];
_arr_mg_mags = [
	["hlc_100Rnd_762x51_M_M60E4"],
	["rhs_100Rnd_762x54mmR_green"],
	["rhs_100Rnd_762x54mmR_green"]
];

_arr_sn = [
	"hlc_rifle_M14",
	"rhs_weap_svds"
	];
_arr_sn_mags = [
	["hlc_20Rnd_762x51_B_M14"],
	["rhs_10Rnd_762x54mmR_7N1"]
];
_arr_sn_scopes = [
	["hlc_optic_LRT_m14","hlc_optic_artel_m14"],
	["rhs_acc_pso1m2"]
];

_arr_smgs = [
	"rhs_weap_aks74u"
	];
_arr_smg_mags = [
	["rhs_30Rnd_545x39_7N10_AK"]
];

_arr_pistols = [
	"rhsusf_weap_m1911a1",
	"RH_m9",
	"RH_python",
	"RH_cz75",
	"RH_fn57",
	"RH_g17",
	"RH_g18",
	"RH_g19t",
	"RH_mak",
	"RH_muzi",
	"RH_vz61",
	"RH_usp",
	"RH_tt33"
	];
_arr_pistol_mags = [
	["rhsusf_mag_7x45acp_MHP"],
	["RH_15Rnd_9x19_M9"],
	["RH_6Rnd_357_Mag"],
	["RH_16Rnd_9x19_CZ"],
	["RH_20Rnd_57x28_FN"],
	["RH_17Rnd_9x19_g17"],
	["RH_33Rnd_9x19_g18"],
	["RH_19Rnd_9x19_g18"],
	["RH_8Rnd_9x18_Mak"],
	["RH_30Rnd_9x19_UZI"],
	["RH_20Rnd_32cal_vz61"],
	["RH_12Rnd_45cal_usp"],
	["RH_8Rnd_762_tt33"]
];

removeallweapons _unit;
removeallassigneditems _unit;

if (isNil 'bn_preloadRandomness') then {
	// пробный костыль для борьбы с падением миссии по состоянию на 21.07.2016
	bn_dummy_crate = "ACE_Box_Ammo" createVehicle [0,0,0];
	{
		bn_dummy_crate addWeaponCargoGlobal [_x,1];
	} forEach (_arr_smgs+_arr_pistols+_arr_sn+_arr_mgs+_arr_rifles);
	deleteVehicle bn_dummy_crate;
	bn_preloadRandomness = 1;
};

bn_fn_add_grenades = {
	for "_i" from 1 to ((floor random 3) +1) do
	{
		(_this select 0) addItem "pzn_f1";
	};
	
	for "_i" from 1 to ((floor random 3)+1) do
	{
		(_this select 0) addItem "SmokeShell";
	};
};

bn_fn_random_civ = {
	removeUniform (_this select 0);
	removeVest (_this select 0);
	
	_arr_uniforms = [
		"U_C_Poloshirt_redwhite",
		"U_C_Poloshirt_stripped",
		"U_C_Poloshirt_tricolour",
		"U_C_Poloshirt_burgundy",
		"U_C_Commoner1_1",
		"U_C_Poloshirt_salmon",
		"U_C_Poloshirt_blue",
		"U_C_Commoner1_2",
		"U_C_Commoner1_3",
		"U_C_Commoner2_1",
		"U_C_Commoner_shorts",
		"U_Competitor",
		"U_C_WorkerCoveralls",
		"U_C_Poor_2",
		"U_C_Poor_1",
		"U_C_TeeSurfer_shorts_2",
		"U_C_TeeSurfer_shorts_1",
		"U_C_ShirtSurfer_shorts"
	];
	_arr_vests = [
		"V_BandollierB_blk",
		"V_BandollierB_cbr",
		"V_BandollierB_rgr",
		"V_Chestrig_khk",
		"V_Rangemaster_belt",
		"V_Rangemaster_belt",
		"V_Press_F",
		"V_Press_F",
		"V_TacVest_blk_POLICE",
		"V_TacVest_blk_POLICE",
		"rhs_vest_commander"
	];
	
	(_this select 0) forceAddUniform (_arr_uniforms select (floor (random (count _arr_uniforms))));
	(_this select 0) addVest (_arr_vests select (floor (random (count _arr_vests))));
};
	
bn_fn_random_uniform = {
	removeUniform (_this select 0);
	
	_arr_uniforms = [
		"LOP_U_AFR_Fatigue_02",
		"U_BG_Guerrilla_6_1",
		"rhs_chdkz_uniform_1",
		"rhs_chdkz_uniform_3",
		"rhs_chdkz_uniform_2",
		"LOP_U_NAPA_Fatigue_02",
		"LOP_U_UA_Fatigue_02",
		"TRYK_U_B_MARPAT_Wood_Tshirt",
		"LOP_U_CHR_Woodlander_01",
		"LOP_U_NAPA_Fatigue_01",
		"LOP_U_NAPA_Fatigue_03"
	];
	
	_arr_vests = [
		"V_BandollierB_blk",
		"V_BandollierB_cbr",
		"V_BandollierB_rgr",
		"V_Chestrig_khk",
		"V_TacVestIR_blk",
		"LOP_V_Chestrig_Kamysh",
		"LOP_V_CarrierLite_WDL",
		"LOP_V_CarrierLite_WDL"
	];

	(_this select 0) forceAddUniform (_arr_uniforms select (floor (random (count _arr_uniforms))));
	(_this select 0) addVest (_arr_vests select (floor (random (count _arr_vests))));
};
	removeBackpack _unit;
	_unit addWeapon "ItemWatch";
	_unit addGoggles "TRYK_Beard_BK3";
if (_rank > 0) then {
	_unit addWeapon "ItemCompass";
	_unit addWeapon "ItemRadio";
};

if (_rank > 1) then {
	_unit linkItem "ItemMap";
};

if (_rank > 2) then {
	_unit addWeapon "Binocular";	
};

if (_rank > 3) then {
	if (_loadout != "guer_m1") then {
		_unit addBackpack "tf_rt1523g_black";
	};
	_unit linkItem "ItemGPS";
};

[_unit] call bn_fn_random_uniform;

if (_loadout == "guer_r") exitWith {

	
	if (random 1 < 0.2) then {
		_unit addWeapon "rhs_weap_rpg26";
	};
	
	clearItemCargoGlobal (vestContainer _unit);
	clearMagazineCargoGlobal (vestContainer _unit);
	clearWeaponCargoGlobal (vestContainer _unit);
	
	_rnd = floor (random count _arr_rifles);
	{
		(vestContainer _unit) addmagazinecargoGlobal [_x,6];
		_veh = (nearestObjects [_unit, ["Car"], 100]) select 0;
		_veh setVariable ["bn_add_mags", (_veh getVariable ["bn_add_mags",[]] )+ [[_x,6]]];
	} forEach (_arr_rifle_mags select _rnd);
	_unit addWeapon (_arr_rifles select _rnd);
	
	[_unit] call bn_fn_add_grenades;
	
	_unit selectWeapon (primaryWeapon _unit);
	[_unit] call bn_equip_ru_msv_ace_med;
	
};

if (_loadout == "guer_rpga") exitWith {

	removeBackpack _unit;
	
	clearItemCargoGlobal (vestContainer _unit);
	clearMagazineCargoGlobal (vestContainer _unit);
	clearWeaponCargoGlobal (vestContainer _unit);
	
	_unit addBackpack "B_TacticalPack_blk";
	clearItemCargoGlobal (backpackContainer _unit);
	clearMagazineCargoGlobal (backpackContainer _unit);
	clearWeaponCargoGlobal (backpackContainer _unit);
	
	[_unit] call bn_fn_add_grenades;
	
	(backpackContainer _unit) addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag",floor (random 2) + 2];
	
	_rnd = floor (random count _arr_rifles);
	{
		(vestContainer _unit) addmagazinecargoGlobal [_x,6];
		_veh = (nearestObjects [_unit, ["Car"], 100]) select 0;
		_veh setVariable ["bn_add_mags", (_veh getVariable ["bn_add_mags",[]] )+ [[_x,6]]];
	} forEach (_arr_rifle_mags select _rnd);
	_unit addWeapon (_arr_rifles select _rnd);
	
	_unit selectWeapon (primaryWeapon _unit);
	[_unit] call bn_equip_ru_msv_ace_med;
};

if (_loadout == "guer_sn") exitWith {

	removeBackpack _unit;
	
	clearItemCargoGlobal (vestContainer _unit);
	clearMagazineCargoGlobal (vestContainer _unit);
	clearWeaponCargoGlobal (vestContainer _unit);
	
	_rnd = floor (random count _arr_sn);
	{
		(vestContainer _unit) addmagazinecargoGlobal [_x,6];
		_veh = (nearestObjects [_unit, ["Car"], 100]) select 0;
		_veh setVariable ["bn_add_mags", (_veh getVariable ["bn_add_mags",[]] )+ [[_x,6]]];
	} forEach (_arr_sn_mags select _rnd);
	_unit addWeapon (_arr_sn select _rnd);
	_unit addPrimaryWeaponItem ((_arr_sn_scopes select _rnd) select (floor (random count (_arr_sn_scopes select _rnd))));
	
	[_unit] call bn_fn_add_grenades;
	
	_unit selectWeapon (primaryWeapon _unit);
	[_unit] call bn_equip_ru_msv_ace_med;
};

if (_loadout == "guer_mg") exitWith {

	removeBackpack _unit;
	
	_unit addBackpack "B_TacticalPack_blk";
		
	clearItemCargoGlobal (vestContainer _unit);
	clearMagazineCargoGlobal (vestContainer _unit);
	clearWeaponCargoGlobal (vestContainer _unit);
	
	clearItemCargoGlobal (backpackContainer _unit);
	clearMagazineCargoGlobal (backpackContainer _unit);
	clearWeaponCargoGlobal (backpackContainer _unit);
	
	_rnd = floor (random count _arr_mgs);
	{
		(backpackContainer _unit) addmagazinecargoGlobal [_x,4];
		_veh = (nearestObjects [_unit, ["Car"], 100]) select 0;
		_veh setVariable ["bn_add_mags", (_veh getVariable ["bn_add_mags",[]] )+ [[_x,4]]];
	} forEach (_arr_mg_mags select _rnd);
	_unit addWeapon (_arr_mgs select _rnd);
	
	[_unit] call bn_fn_add_grenades;
	
	_unit selectWeapon (primaryWeapon _unit);
	[_unit] call bn_equip_ru_msv_ace_med;
};

if (_loadout == "guer_med") exitWith {

	removeBackpack _unit;
	
	_unit addBackpack "B_TacticalPack_blk";
		
	clearItemCargoGlobal (vestContainer _unit);
	clearMagazineCargoGlobal (vestContainer _unit);
	clearWeaponCargoGlobal (vestContainer _unit);
	
	_rnd = floor (random count _arr_rifles);
	{
		(vestContainer _unit) addmagazinecargoGlobal [_x,6];
		_veh = (nearestObjects [_unit, ["Car"], 100]) select 0;
		_veh setVariable ["bn_add_mags", (_veh getVariable ["bn_add_mags",[]] )+ [[_x,6]]];
	} forEach (_arr_rifle_mags select _rnd);
	_unit addWeapon (_arr_rifles select _rnd);
	
	[_unit] call bn_fn_add_grenades;
	
	_unit addItem "ACE_surgicalKit";
	for '_i' from 1 to 25 do {_unit addItemToBackpack 'ACE_fieldDressing';};
	for '_i' from 1 to 15 do {_unit addItemToBackpack 'ACE_morphine';};
	for '_i' from 1 to 15 do {_unit addItemToBackpack 'ACE_Epinephrine';};
	for '_i' from 1 to 6 do {_unit addItemToBackpack 'ACE_salineIV';};
	for '_i' from 1 to 6 do {_unit addItemToBackpack 'ACE_tourniquet';};
	for '_i' from 1 to 6 do {_unit addItemToBackpack 'ACE_quikclot';};
	
	_unit selectWeapon (primaryWeapon _unit);
};




if (_loadout == "guer_rpg") exitWith {

	removeBackpack _unit;
	
	clearItemCargoGlobal (vestContainer _unit);
	clearMagazineCargoGlobal (vestContainer _unit);
	clearWeaponCargoGlobal (vestContainer _unit);
	
	_rnd = floor (random count _arr_rifles);
	{
		(vestContainer _unit) addmagazinecargoGlobal [_x,6];
		_veh = (nearestObjects [_unit, ["Car"], 100]) select 0;
		_veh setVariable ["bn_add_mags", (_veh getVariable ["bn_add_mags",[]] )+ [[_x,6]]];
	} forEach (_arr_rifle_mags select _rnd);
	_unit addWeapon (_arr_rifles select _rnd);
	
	_unit selectWeapon (primaryWeapon _unit);
	
	_unit addBackpack "B_TacticalPack_blk";
	
	_unit addWeapon "rhs_weap_rpg7";
	if (random 1 < 0.6) then {_unit addSecondaryWeaponItem "rhs_acc_pgo7v2";};
	
	[_unit] call bn_fn_add_grenades;
	
	clearItemCargoGlobal (backpackContainer _unit);
	clearMagazineCargoGlobal (backpackContainer _unit);
	clearWeaponCargoGlobal (backpackContainer _unit);
	(backpackContainer _unit) addmagazinecargoGlobal ["rhs_rpg7_PG7VL_mag",floor (random 2) + 2];
	[_unit] call bn_equip_ru_msv_ace_med;
	
};

if (_loadout == "guer_m1") exitWith {

	removeBackpack _unit;
	clearItemCargoGlobal (vestContainer _unit);
	clearMagazineCargoGlobal (vestContainer _unit);
	clearWeaponCargoGlobal (vestContainer _unit);
	
	_rnd = floor (random count _arr_rifles);
	{
		(vestContainer _unit) addmagazinecargoGlobal [_x,6];
		_veh = (nearestObjects [_unit, ["Car"], 100]) select 0;
		_veh setVariable ["bn_add_mags", (_veh getVariable ["bn_add_mags",[]] )+ [[_x,6]]];
	} forEach (_arr_rifle_mags select _rnd);
	_unit addWeapon (_arr_rifles select _rnd);
	
	[_unit] call bn_fn_add_grenades;
	
	_unit selectWeapon (primaryWeapon _unit);
	_unit addItem "ACE_MapTools";
	_unit addItem "tu_arty_tables_m224";
	_unit addBackpack "BN_M224_Gun_Bag";
	[_unit] call bn_equip_ru_msv_ace_med;
	
};

if (_loadout == "guer_m2") exitWith {

	removeBackpack _unit;
	clearItemCargoGlobal (vestContainer _unit);
	clearMagazineCargoGlobal (vestContainer _unit);
	clearWeaponCargoGlobal (vestContainer _unit);
	
	_rnd = floor (random count _arr_rifles);
	{
		(vestContainer _unit) addmagazinecargoGlobal [_x,6];
		_veh = (nearestObjects [_unit, ["Car"], 100]) select 0;
		_veh setVariable ["bn_add_mags", (_veh getVariable ["bn_add_mags",[]] )+ [[_x,6]]];
	} forEach (_arr_rifle_mags select _rnd);
	_unit addWeapon (_arr_rifles select _rnd);
	
	[_unit] call bn_fn_add_grenades;
	
	_unit selectWeapon (primaryWeapon _unit);
	_unit addItem "ACE_MapTools";
	_unit addItem "tu_arty_tables_m224";
	_unit addBackpack "BN_M224_Bipod_Bag";
	[_unit] call bn_equip_ru_msv_ace_med;
};

if (_loadout == "guer_m3") exitWith {

	removeBackpack _unit;
	clearItemCargoGlobal (vestContainer _unit);
	clearMagazineCargoGlobal (vestContainer _unit);
	clearWeaponCargoGlobal (vestContainer _unit);
	
	_rnd = floor (random count _arr_rifles);
	{
		(vestContainer _unit) addmagazinecargoGlobal [_x,6];
		_veh = (nearestObjects [_unit, ["Car"], 100]) select 0;
		_veh setVariable ["bn_add_mags", (_veh getVariable ["bn_add_mags",[]] )+ [[_x,6]]];
	} forEach (_arr_rifle_mags select _rnd);
	_unit addWeapon (_arr_rifles select _rnd);
	
	[_unit] call bn_fn_add_grenades;
	
	_unit selectWeapon (primaryWeapon _unit);
	_unit addBackpack "B_Carryall_oli";
	for '_i' from 1 to 12 do {_unit addItemToBackpack 'bn_60mm_shell_0';};
	
	[_unit] call bn_equip_ru_msv_ace_med;
};

if (_loadout == "smg") exitWith {

	removeBackpack _unit;
	
	[_unit] call bn_fn_random_civ;
	
	clearItemCargoGlobal (vestContainer _unit);
	clearMagazineCargoGlobal (vestContainer _unit);
	clearWeaponCargoGlobal (vestContainer _unit);
	
	clearItemCargoGlobal (uniformContainer _unit);
	clearMagazineCargoGlobal (uniformContainer _unit);
	clearWeaponCargoGlobal (uniformContainer _unit);
	
	_rnd = floor (random count _arr_smgs);
	{
		(uniformContainer _unit) addmagazinecargoGlobal [_x,4];
	} forEach (_arr_smg_mags select _rnd);
	_unit addWeapon (_arr_smgs select _rnd);
	
	_unit addItem "SmokeShellGreen";
	
	_unit selectWeapon (primaryWeapon _unit);
};

if (_loadout == "pistol") exitWith {

	removeBackpack _unit;
	
	[_unit] call bn_fn_random_civ;
	
	clearItemCargoGlobal (vestContainer _unit);
	clearMagazineCargoGlobal (vestContainer _unit);
	clearWeaponCargoGlobal (vestContainer _unit);
	
	clearItemCargoGlobal (uniformContainer _unit);
	clearMagazineCargoGlobal (uniformContainer _unit);
	clearWeaponCargoGlobal (uniformContainer _unit);
	
	_rnd = floor (random count _arr_pistols);
	{
		(vestContainer _unit) addmagazinecargoGlobal [_x,4];
	} forEach (_arr_pistol_mags select _rnd);
	_unit addWeapon (_arr_pistols select _rnd);
	
	_unit addItem "SmokeShellGreen";
	
	_unit selectWeapon (handgunWeapon _unit);
};