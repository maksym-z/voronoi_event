if (!isServer) exitWith {};
_unit = _this select 0;

_unit addVest 'rhs_6b23_6sh92';
_unit addItemToVest 'rhs_100Rnd_762x54mmR';
for '_i' from 1 to 2 do {_unit addItemToVest 'pzn_f1';};
for '_i' from 1 to 2 do {_unit addItemToVest 'rhs_mag_rdg2_white';};
_unit addBackpack 'rhs_assault_umbts';
_unit addItemToBackpack 'rhs_100Rnd_762x54mmR';
_unit addItemToBackpack 'rhs_100Rnd_762x54mmR_green';
_unit addHeadgear 'rhs_6b27m_ess';
