{waitUntil player == player};
private _playerPos = player getVariable ["serp_startPos",getPos player];
["mrkMyself", _playerPos select 0, _playerPos select 1, 0.25, "mil_start", "ColorGreen", ""] call bn_fnc_local_marker_icon;

["side player == east","<font color = '#ffaaaa'>","<font color = '#aaaaff'>"] call bn_conditional_text;
bn_player_info_text = bn_player_info_text + "Я - <marker name = 'mrkMyself'>" + (roleDescription player) + "</marker></font><br />";

["[player] call ace_medical_fnc_isMedic","Я обучен оказывать медицинскую помощь.",""] call bn_conditional_text;
["(player getVariable ['bn_mission_ks', false])","На фриз-тайме я могу/должен выбрать средства усиления в ящиках.",""] call bn_conditional_text;
["player == boss","Меня касаются особые условности перемещения (см. ниже).",""] call bn_conditional_text;
/*["(player getVariable ['isCrew', false])","Я умею управлять легкой гусеничной бронетехникой.",""] call bn_conditional_text;
["(player getVariable ['isPilot', false])","Я умею управлять вертолетом.",""] call bn_conditional_text;
["(player getVariable ['isTankCrew', false])","Я умею управлять танком.",""] call bn_conditional_text;
["(player getVariable ['bn_isObserver', false])","Я артиллерийский корректировщик (см. условия победы красных).",""] call bn_conditional_text;

["(player in [spn1,spn2,spn3,spn3])","Я вхожу в состав разведгруппы синих (см. условности перемещения).",""] call bn_conditional_text;
["(player in (units group spnLeader))","Я вхожу в состав разведгруппы красных (см. условности перемещения).",""] call bn_conditional_text;*/

bn_player_info_text = bn_player_info_text + "<br />Меня касаются следующие условности:<br />";

[
	"side player == east",
	"<font color = '#ffaaaa'>Задача красных</font>: за отведённое время зачистить %1 (создать 4-кратное преимущество) И уничтожить главаря банды. В случае побега главаря преследовать его и ликвидировать (в таком случае захват зоны не требуется).",
	"", 
	true,
	[["markername","лагерь террористов","#ffaaaa"]]
] call bn_conditional_text;
[
	"side player == west",
	"<font color = '#aaaaff'>Задача синих</font>: не допустить захвата %1 в течение отведенного на атаку времени либо нанести атакующим тяжёлые потери. Если обороняющихся останется " + (str BN_GUARDS_REQUIRED) + " или менее, главарь получит маркер на карте и должен будет сбежать в течение"+ (str BN_BOSS_ESCAPE_TIME) + " мин. В случае успешного побега синие побеждают.<br />",
	"", 
	true,
	[["markername","лагеря","#ffaaaa"]]
] call bn_conditional_text;
bn_mission_conventions = bn_mission_conventions + "<br />";
[
	"player == boss",
	"Главарь банды должен находиться на территории %1 от окончания фриз-тайма и до тех пор, пока он не получит сообщение, разрешающее ему сбежать.",
	"", 
	true,
	[["markername","лагеря","#ffaaaa"]]
] call bn_conditional_text;
[
	"side player == west",
	"Всем синим запрещается выходить за пределы %1 до тех пор, пока главарь не получит сообщение о побеге.",
	"", 
	true,
	[["mrk_blue_border","красной окружности","#ffaaaa"]]
] call bn_conditional_text;
["true","Запрещено надевать каски, головные уборы, разгрузки, бронежилеты, маскхалаты противника. Синим запрещено снимать бороды, а красным запрещено их надевать.","", true] call bn_conditional_text;
bn_mission_conventions = bn_mission_conventions + "<br />";
["false","Ограничение по времени: " + (str BN_MISSION_TIME_MINUTES) + " минут.","", true] call bn_conditional_text;

player createDiaryRecord ["Diary", ["Кто я?",bn_player_info_text]];
player createDiaryRecord ["Diary", ["Условности (тестовая вкладка)",bn_mission_conventions]];