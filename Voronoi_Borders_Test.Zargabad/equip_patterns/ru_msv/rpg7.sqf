if (!isServer) exitWith {};
_unit = _this select 0;

_unit addBackpack 'rhs_rpg_empty';
for '_i' from 1 to 3 do {_unit addItemToBackpack 'rhs_rpg7_PG7VL_mag';};
_unit addItemToBackpack 'rhs_rpg7_OG7V_mag';
_unit addWeapon 'rhs_weap_rpg7';
_unit addSecondaryWeaponItem 'rhs_acc_pgo7v2';
