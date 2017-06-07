if (!isServer) exitWith {};
_unit = _this select 0;

[_unit] call bn_equip_vdv_rzv1_soldier_base;
[_unit] call bn_equip_vdv_rzv1_leader;
[_unit] call bn_equip_vdv_rzv1_ak74;
_unit addPrimaryWeaponItem 'rhs_acc_tgpa';
[_unit] call bn_equip_vdv_rzv1_ace_med;
_unit addBackpack "tf_bussole";