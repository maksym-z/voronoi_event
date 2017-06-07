if (!isServer) exitWith {};
_unit = _this select 0;

[_unit] call bn_equip_vdv_rzv1_soldier_base;
[_unit] call bn_equip_vdv_rzv1_ace_med;
_unit addBackpack 'rhs_assault_umbts';
_unit addItemToBackpack 'ACE_M26_Clacker';
_unit addItemToBackpack 'ACE_DefusalKit';
_unit addItemToBackpack 'SatchelCharge_Remote_Mag';
_unit addItemToBackpack 'SatchelCharge_Remote_Mag';
for '_i' from 1 to 6 do {_unit addItem "rhs_20rnd_9x39mm_SP5"};
_unit addVest 'rhs_6b23_6sh92';
for '_i' from 1 to 2 do {_unit addItemToVest 'pzn_f1';};
_unit addWeapon "rhs_weap_asval";
for '_i' from 1 to 3 do {_unit addItemToBackpack 'APERSTripMine_Wire_Mag';};
for '_i' from 1 to 2 do {_unit addItemToVest 'rhs_mine_pmn2_mag';};
_unit addItemToBackpack 'rhs_mine_pmn2_mag';
_unit addItemToBackpack 'Chemlight_yellow';
