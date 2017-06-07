if (!isServer) exitWith {};
_unit = _this select 0;

_unit addItemToUniform 'ACE_MapTools';
_unit addItemToUniform 'ACE_Flashlight_KSF1';
_unit addWeapon 'Binocular';
_unit linkItem 'ItemMap';
_unit addMagazine ['rhs_30Rnd_545x39_AK_green', 2];
_unit linkItem 'itemRadio';
_unit linkItem 'ItemGPS';
