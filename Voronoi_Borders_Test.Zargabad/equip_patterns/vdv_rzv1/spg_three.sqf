if (!isServer) exitWith {};
_unit = _this select 0;

[_unit] call bn_equip_vdv_rzv1_rifleman;
_unit addBackpack 'rhs_sidor';
for '_i' from 1 to 3 do {_unit addItemToBackpack 'BN_rhs_mag_pg9v';};
for '_i' from 1 to 3 do {_unit addItemToBackpack 'BN_rhs_mag_og9v';};
