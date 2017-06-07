
class CfgRespawnTemplates
{
	class Spectator
	{
		onPlayerRespawn = "SerP_spectator";
	};
};
class CfgDebriefingSections
{
	class SerP_statistics
	{
		title = "Statistics";
		variable = "SerP_statistics";
	};
};


SerP_version = addon;
respawn = 1;
respawndelay = 3;
respawnButton = 0;
class Header	{
	gameType = Unknown;
	minPlayers = 1;
	maxPlayers = 200;
};
joinUnassigned = 1;
disableChannels[] = {0,2,5,6};

author=$STR_SerP_author;
OnLoadName = $STR_SerP_missionname;
OnLoadMission = $STR_SerP_missionDescription;
