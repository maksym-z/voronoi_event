if (!isServer) exitWith {};
_unit = _this select 0;

[_unit] call bn_equip_vdv_rzv1_soldier_base;
[_unit] call bn_equip_vdv_rzv1_ak74;
[_unit] call bn_equip_vdv_rzv1_ace_med;
[_unit] call bn_equip_vdv_rzv1_assistant;
_unit linkItem "ItemGPS";
_unit addWeapon 'rhs_weap_rpg26';
