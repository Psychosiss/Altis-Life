private["_validMenus","_lastMenu"];
_validMenus = 
[
	"RscMainMenu","RscMoveHigh","#WATCH","#WATCH0","RscWatchDir","RscWatchMoveDir","#GETIN","#RscStatus","RscCallSupport","#ACTION",
	"RscCombatMode","RscFormations","RscTeam","RscSelectTeam","RscReply","#User:BIS_Menu_GroupCommunication","#CUSTOM_RADIO",
	"RscRadio","RscGroupRootMenu","RscMenuReply","RscMenuStatus","","#User:BIS_fnc_addCommMenuItem_menu","RscMenuMove","RscMenuFormations"
];

_lastMenu = "";
while {true} do
{
	waitUntil {commandingMenu != _lastMenu};
	_lastMenu = commandingMenu;

	if(!(commandingMenu in _validMenus)) then 
	{
		[[profileName,getPlayerUID player,_lastMenu],"SPY_fnc_observe",false,false] call life_fnc_MP;
		[[[0,1],format["%1 a été observé par SPY-GLASS, il/elle a tenté d'acceder a un menu de commande:\n\n %2\n\n et ce menu de commande est interdit. S'il vous plait il/elle n'est peut-etre pas un cheater car SPY-GLASS a détécté ce menu qui n'est pas whitelisté.",profileName,_lastMenu]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		showCommandingMenu "";
	};
};