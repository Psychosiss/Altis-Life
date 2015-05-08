class playerHUD
{
	idd=-1;
	movingEnable=0;
	fadein=0;
	duration = 99999999999999999999999999999999999999999999;
	fadeout=0;
	name="playerHUD";
	onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[]={};

	class controlsBackground
	{
		class foodHIcon : life_RscPicture 
		{
			idc = 23531;
			text = "icons\food.paa";
			x = safeZoneX + safeZoneW - 0.15;
			y = safeZoneY + safeZoneH - 0.510;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {0,0,0,0.5};
		};

		class waterHIcon : life_RscPicture 
		{
			idc = 23532;
			text = "icons\water.paa";
			x = safeZoneX + safeZoneW-  0.15;
			y = safeZoneY + safeZoneH - 0.445;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {0,0,0,0.5};
		};

		class healthHIcon : life_RscPicture
		{
			idc = 23533;
			text = "icons\health.paa";
			x = safeZoneX + safeZoneW - 0.15;
			y = safeZoneY + safeZoneH - 0.380;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {0,0,0,0.5};
		};

		class KarmaHIcon : life_RscPicture
		{
			idc = 23534;
			text = "icons\karma.paa";
			x = safeZoneX + safeZoneW - 0.15;
			y = safeZoneY + safeZoneH - 0.315;
			w = 0.05;
			h = 0.06;
			colorBackground[] = {0,0,0,0.5};
		};
	};

	class controls
	{
		class foodtext
		{
			type=0;
			idc=23500;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = {0,0,0,0.5};
			colorText[] = {1,1,1,1};
			shadow=true;
			text="";
		};

		class watertext
		{
			type=0;
			idc=23510;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = {0,0,0,0.5};
			colorText[] = {1,1,1,1};
			shadow=true;
			text="";
		};

		class healthtext
		{
			type=0;
			idc=23515;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = {0,0,0,0.5};
			colorText[] = {1,1,1,1};
			shadow=true;
			text="";
		};

		class karmatext
		{
			type=0;
			idc=23520;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.03;
			size=1;
			font="PuristaSemibold";
			colorBackground[] = {0,0,0,0.5};
			colorText[] = {1,1,1,1};
			shadow=true;
			text="";
		};
	};
};