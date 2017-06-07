private ["_vehicle","_item","_storedItems"];
diag_log "bn_remove_specific_item";
diag_log _this;
diag_log (itemCargo _vehicle);
_vehicle = _this select 0;	
_item = _this select 1;
if (_item in (itemCargo _vehicle)) then {
	_storedItems = itemCargo _vehicle;
	clearItemCargoGlobal _vehicle;
	{
		if (_x != _item) then {
			_vehicle addItemCargoGlobal _x;
		};
	} forEach _storedItems;
};