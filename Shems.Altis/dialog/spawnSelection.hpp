class life_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1; 
			y = 0.2 + (11 / 250);
			w = 0.8; 
			h = 0.6 - (22 / 250);
		};
		
		class Title : Life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "Lieux de reveil";
			x = 0.075; 
			y = 0.26;
			w = 0.2625; 
			h = 0.04;
		};
		
		class SpawnPointTitle : Title
		{
			idc = 38501;
			style = 1;
			text = "";
			x = 0.3625; 
			y = 0.26;
			w = 0.55; 
			h = 0.04;
		};
		
		class MapView : Life_RscMapControl 
		{
			idc = 38502;
			colorBackground[] = {0.47,0.45,0,0.1};
			x = 0.3625; 
			y = 0.32;
			w = 0.55;
			h = 0.42;
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;
		};
	};
	
	class controls
	{	
		class SpawnPointList: Life_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.9};
			colorBackground[] = {0.47,0.45,0,0.1};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.075;
			y = 0.32;
			w = 0.2625;
			h = 0.42;
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
		};
		
		class spawnButton : Life_RscButtonMenu
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Reveil";
			align = "center";
			onButtonClick = "[] call life_fnc_spawnConfirm";
			x = 0.3625; 
			y = 0.76;
			w = 0.55;
			h = 0.04;
		};
	};
};