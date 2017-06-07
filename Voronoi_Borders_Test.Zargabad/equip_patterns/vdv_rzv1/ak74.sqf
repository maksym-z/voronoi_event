if (!isServer) exitWith {};
_unit = _this select 0;

_unit addVest 'rhs_6b23_6sh92';
for '_i' from 1 to 8 do {_unit addItemToVest 'rhs_30Rnd_545x39_7N10_AK';};
for '_i' from 1 to 2 do {_unit addItemToVest 'rhs_30Rnd_545x39_AK_green';};
for '_i' from 1 to 4 do {_unit addItem 'pzn_f1';};
private _set = selectRandom [['rhs_weap_ak105','rhs_acc_pgs64'],['rhs_weap_ak74m','rhs_acc_dtk']];
_unit addWeapon (_set select 0);
_unit addPrimaryWeaponItem (_set select 1);
_unit addPrimaryWeaponItem (selectRandom ['rhs_acc_1p78','rhs_acc_1p63','rhs_acc_1p63','rhs_acc_1p63','']);

