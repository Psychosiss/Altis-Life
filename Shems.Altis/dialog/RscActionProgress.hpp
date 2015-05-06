class life_RscActionProgress
{
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 1e+011;
	scriptName = "life_RscActionProgress";
	scriptPath = "GUI";
	onLoad = "[_this, ""life_RscActionProgress""] call life_fnc_initDisplay";

	class Controls
	{
		class Background: life_RscText
		{
			idc = -1;
			x = "10 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = {"(profilenamespace getVariable ['IGUI_BCG_RGB_R',0])", "(profilenamespace getVariable ['IGUI_BCG_RGB_G',1])", "(profilenamespace getVariable ['IGUI_BCG_RGB_B',1])", 0.8};
		};

		class Progress: life_RscProgress
		{
			idc = 28000;
			x = "10 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class TextProgress: life_RscText
		{
			idc = 28001;
			x = "10 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorText[] = {1,1,1,1};
			style = 2;
			text = "50%";
		};

		class TextAction: life_RscText
		{
			idc = 28002;
			x = "10 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + (safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "safezoneY + safezoneH - 6.2 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "20 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			style = 2;
		};
	};
};