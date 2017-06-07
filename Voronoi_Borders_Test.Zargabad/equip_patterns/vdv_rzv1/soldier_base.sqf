if (!isServer) exitWith {};
_unit = _this select 0;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit forceAddUniform (selectRandom ['rhs_uniform_gorka_r_g','rhs_uniform_gorka_r_y','rhs_uniform_emr_patchless']);
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit addHeadgear (selectRandom ['H_Bandanna_khk','H_Bandanna_khk_hs','rhs_beanie_green']);
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemMap';