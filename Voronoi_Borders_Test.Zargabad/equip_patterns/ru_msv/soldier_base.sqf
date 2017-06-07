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

_unit forceAddUniform 'rhs_uniform_mvd_izlom';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit addHeadgear 'ZSH_1';
