if (!isServer) exitWith {};
_unit = _this select 0;

[_unit] call bn_equip_vdv_rzv1_rifleman;
_unit addBackpack 'RHS_NSV_Gun_Bag';
_unit linkItem 'ItemMap';
_unit addItem 'ACE_MapTools';
