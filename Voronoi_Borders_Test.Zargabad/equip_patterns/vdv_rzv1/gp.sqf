if (!isServer) exitWith {};
_unit = _this select 0;

_unit addVest 'rhs_6b23_6sh92_vog_headset';
_unit addBackpack 'rhs_sidor';
for '_i' from 1 to 10 do {_unit addItem 'rhs_30Rnd_545x39_7N10_AK';};
for '_i' from 1 to 4 do {_unit addItem 'rhs_30Rnd_545x39_AK_green';};
for '_i' from 1 to 8 do {_unit addItem 'rhs_VOG25';};
_unit addItemToVest 'rhs_GRD40_Green';
_unit addWeapon 'rhs_weap_ak74m_gp25';
_unit addPrimaryWeaponItem 'rhs_acc_dtk';
