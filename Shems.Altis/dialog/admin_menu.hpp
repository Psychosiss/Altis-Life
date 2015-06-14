class life_admin_menu 
{
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";

	class controlsBackground 
	{
		class Life_RscTitleBackground : Life_RscText 
		{
			colorBackground[] = {0.4,0.05,0.05,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class MainBackground : Life_RscText 
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
	};

	class controls 
	{
		class Title : Life_RscTitle 
		{
			colorBackground[] = {0,0,0,0};
			idc = 2901;
			text = "Menu Admin";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class PlayerList_Admin : Life_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[_this] spawn life_fnc_adminQuery;";
			x = 0.12; 
			y = 0.26;
			w = 0.30; 
			h = 0.4;
		};

		class PlayerBInfo : Life_RscStructuredText
		{
			idc = 2903;
			text = "";
			x = 0.42;
			y = 0.25;
			w = 0.35;
			h = 0.6;
		};

		class CloseButtonKey : Life_RscButtonMenu 
		{
			idc = -1;
			text = "Fermer";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class AdminID : Life_RscButtonMenu 
		{
			idc = -1;
			text = "ID";
			onButtonClick = "[] call life_fnc_admingetID;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Compensate : Life_RscButtonMenu 
		{
			idc = 2904;
			text = "Money";
			onButtonClick = "createDialog ""Life_Admin_Compensate"";";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Spectate : Life_RscButtonMenu 
		{
			idc = 2905;
			text = "Espion";
			onButtonClick = "[] call life_fnc_adminSpectate;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Teleport : Life_RscButtonMenu 
		{
			idc = 2906;
			text = "Teleporte";
			onButtonClick = "[] call life_fnc_adminTeleport;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class TeleportHere : Life_RscButtonMenu 
		{
			idc = 2907;
			text = "TP ici";
			onButtonClick = "[] call life_fnc_adminTpHere;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class God : Life_RscButtonMenu 
		{
			idc = 2908;
			text = "GodMode";
			onButtonClick = "[] call life_fnc_adminGodMode;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Freeze : Life_RscButtonMenu 
		{
			idc = 2909;
			text = "Geler";
			onButtonClick = "[] call life_fnc_adminFreeze;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Markers : Life_RscButtonMenu 
		{
			idc = 2910;
			text = "Markers";
			onButtonClick = "[] spawn life_fnc_adminMarkers;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Debug : Life_RscButtonMenu 
		{
			idc = 2911;
			text = "Debug";
			onButtonClick = "[] call life_fnc_adminDebugCon;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class CameraButtonKey : Life_RscButtonMenu 
		{
			idc = -1;
			text = "Camera";
			onButtonClick = "closeDialog 0; [] call BIS_fnc_camera;";
			x = -0.06 + (18.86 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class EquipAdminGear : Life_RscButtonMenu 
		{
			idc = -1;
			text = "Equipement";
			onButtonClick = "[] spawn life_fnc_adminGear;";
			x = -0.06 + (25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class EconomySystem : Life_RscButtonMenu 
		{
			idc = -1;
			text = "Economie";
			onButtonClick = "createDialog ""life_dynmarket_changeprice"";";
			x = -0.06 + (31.3 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
/*
		class BanButton : Life_RscButtonMenu 
		{
			idc = -1;
			text = "Bannir";
			onButtonClick = "[] call life_fnc_adminBan;";
			x = -0.06 + (37.6 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class KickButton : Life_RscButtonMenu 
		{
			idc = -1;
			text = "Kick";
			onButtonClick = "[] call life_fnc_adminKick;";
			x = 0.26 + (43.9 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
*/
		class Purge : Life_RscButtonMenu 
		{
			idc = 6847;
			text = "Purge";
			colorBackground[] = {0.584,0.086,0.086,1.0};
			onButtonClick = "[] call life_fnc_purge;";
			x = 0.26 + (50.2/ 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};