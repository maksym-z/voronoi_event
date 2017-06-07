modulesAdd[] = {"bn_freezetime"};
modulesRemove[] = {"freeztime"};

//толщина зоны в которой будет выскакивать хинт о покидании зоны брифинга
hintzonesize = 20;
//радиус зоны за которую нельзя выходить во время брифинга ингейм
//REDFOR
zoneSizeREDFOR = 50;
//BLUEFOR
zoneSizeBLUEFOR = 150;
//все остальные
zoneSizeDefault = 20;
//Воюющие стороны:
//"west", "east", "resistance", "civilian"
sideREDFOR = "east";
sideBLUEFOR = "west";
//здесь можно описать условие при котором техника в стартовой зоне не будет зафиксирована. Доступны 2 переменные - _side - какая сторона стартует в зоне, и _object - объект, который будет/не будет зафисирован. Пример: "_side == west" - на старте синих можно свободно кататься, "_object isKindOf 'tank'" - можно кататься на танках
vehHolderExludeCondition = "true";
//Текст который будет использован в сообщении о победе/проигрыше
//Можно дописать свое в stringtable.xml
titleREDFOR = "российские спецназовцы";
titleBLUEFOR = "боевики";

//если у одной из сторон окажется численное преимущество в _domiMult и противоположная сторона достигнет коэффициента допутимых потерь миссия завершится
domiMult = 2;
//коэффициент допустимых потерь красных. Если выживут меньше n*(начальные силы) красные отступят
RFRetreat = 0.1;
//коэффициент допустимых потерь синих. Если выживут меньше n*(начальные силы) синие отступят
BFRetreat = 0;

//дальность обзора
viewDistance = 2500;

//0 - при рандомном респе стартовые позиции не зависят друг от друга
//1 - при рандомном респе стартовые позиции зависят друг от друга
synchronizedRespawn = 1;

// ["_include_condition","_can_move_condition",["_init_code",""],["_cleanup_code",""]];
freezetime_zone_array[] = {{"side player == east","_vehicle distance BN_TRIGGER > 2000","","deleteMarkerLocal 'mrk_extended_spawn'"}};
vehicle_classes_to_show[] = {"Tank_F","Air","Car","Ship","ACE_Box_Ammo"};