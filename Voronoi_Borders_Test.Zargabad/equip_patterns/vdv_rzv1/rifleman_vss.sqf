if (!isServer) exitWith {};
_unit = _this select 0;

[_unit] call bn_equip_vdv_rzv1_soldier_base;
//_unit forceAddUniform 'U_B_T_FullGhillie_tna_F';
_unit addVest 'rhs_6b23_digi_6sh92_Spetsnaz';
for '_i' from 1 to 4 do {_unit addItemToVest 'rhs_20rnd_9x39mm_SP5';};
for '_i' from 1 to 4 do {_unit addItemToVest 'rhs_20rnd_9x39mm_SP6';};
for '_i' from 1 to 2 do {_unit addItemToVest 'rhs_mag_rgd5';};

_unit addItemToVest 'rhs_mag_rdg2_white';
_unit addWeapon 'rhs_weap_vss';
_unit addPrimaryWeaponItem 'rhs_acc_pso1m21';
[_unit] call bn_equip_vdv_rzv1_ace_med;