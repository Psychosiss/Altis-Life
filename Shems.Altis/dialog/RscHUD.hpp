class Life_RscHUD 
{
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 1e+011;
	scriptName = "life_RscHUD";
	scriptPath = "GUI";
	scriptIsInternal = 1;
	onLoad = "[_this,""RscHUD"",true] call life_fnc_initDisplay";

	class Controls
	{
		class TextMoney: life_RscText
		{
			idc = 5100;
			x = "safezoneX + safezoneW - 7.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 4 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "7 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorText[] = {"(profilenamespace getVariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_A',0.8])"};
			shadow = 0;
			style = 1;
			text = "0 €";
		};

		class BackgroundHealth: Life_RscText
		{
			idc = 5101;
			x = "safezoneX + safezoneW - 7.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 1.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "7 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorBackground[] = {"(profilenamespace getVariable ['IGUI_BCG_RGB_R',0])", "(profilenamespace getVariable ['IGUI_BCG_RGB_G',1])", "(profilenamespace getVariable ['IGUI_BCG_RGB_B',1])", "(profilenamespace getVariable ['IGUI_BCG_RGB_A',0.8])"};
		};

		class ValueHealth: Life_RscText
		{
			idc = 5102;
			x = "safezoneX + safezoneW - 7.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 1.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "7 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorBackground[] = {"(profilenamespace getVariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_A',0.8])"};
		};

		class PictureHealth: Life_RscPictureKeepAspect
		{
			idc = 5103;
			x = "safezoneX + safezoneW - 1.8 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 1.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			text = "icons\health.paa";
		};

		class BackgroundFatigue: Life_RscText
		{
			idc = 5104;
			x = "safezoneX + safezoneW - 7.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 2.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "7 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorBackground[] = {"(profilenamespace getVariable ['IGUI_BCG_RGB_R',0])", "(profilenamespace getVariable ['IGUI_BCG_RGB_G',1])", "(profilenamespace getVariable ['IGUI_BCG_RGB_B',1])", "(profilenamespace getVariable ['IGUI_BCG_RGB_A',0.8])"};
		};

		class ValueFatigue: Life_RscText
		{
			idc = 5105;
			x = "safezoneX + safezoneW - 7.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 2.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "7 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorBackground[] = {"(profilenamespace getVariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_A',0.8])"};
		};

		class PictureFatigue: Life_RscPictureKeepAspect
		{
			idc = 5106;
			x = "safezoneX + safezoneW - 1.8 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 2.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			text = "icons\fatigue.paa";
		};

		class PictureHungerRing: Life_RscPictureKeepAspect
		{
			idc = 5107;
			x = "safezoneX + safezoneW - 2.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "10 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY )";
			w = "2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorText[] = {"(profilenamespace getVariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_A',0.8])"};
			text = "icons\ring_8.paa";
		};

		class PictureThirstRing: Life_RscPictureKeepAspect
		{
			idc = 5108;
			x = "safezoneX + safezoneW - 2.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "12.5 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY )";
			w = "2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorText[] = {"(profilenamespace getVariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_A',0.8])"};
			text = "icons\ring_8.paa";
		};

		class PictureHunger: Life_RscPictureKeepAspect
		{
			idc = 5109;
			x = "safezoneX + safezoneW - 2.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "10 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY )";
			w = "2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorText[] = { "(profilenamespace getVariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_A',0.8])" };
			text = "icons\hunger.paa";
		};

		class PictureThirst: Life_RscPictureKeepAspect
		{
			idc = 5110;
			x = "safezoneX + safezoneW - 2.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "12.5 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY )";
			w = "2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorText[] = {"(profilenamespace getVariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getVariable ['IGUI_TEXT_RGB_A',0.8])"};
			text = "icons\thirst.paa";
		};
	};
};