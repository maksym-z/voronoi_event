if (!isServer) exitWith {};
_unit = _this select 0;

[_unit] call bn_equip_vdv_rzv1_rifleman;
_unit addBackpack 'RHS_SPG9_Tripod_Bag';
[_unit] call bn_equip_vdv_rzv1_assistant;
