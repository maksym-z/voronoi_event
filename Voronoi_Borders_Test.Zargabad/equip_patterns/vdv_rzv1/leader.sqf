if (!isServer) exitWith {};
_unit = _this select 0;

_unit addVest 'rhs_6b23_6sh92_headset_mapcase';
for '_i' from 1 to 2 do {_unit addItemToVest 'rhs_mag_rdg2_white';};
_unit addItemToVest 'rhs_mag_nspd';
_unit addItemToVest 'rhs_mag_nspd';
_unit addBackpack 'tf_bussole';
_unit addWeapon 'Binocular';
_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'itemRadio';
_unit linkItem 'itemGPS';
