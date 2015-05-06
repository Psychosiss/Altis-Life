class Life_RscHUD 
{
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 1e+011;
	scriptName = "life_RscHUD";
	scriptPath = "GUI";
	scriptIsInternal = 1;
	onLoad = "[_this,""life_RscHUD""] call life_fnc_initDisplay";

	class Controls
	{
		class TextMoney: Life_RscText
		{
			idc = 5100;
			x = "safezoneX + safezoneW - 7.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 4 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "7 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorText[] = {1,1,1,1};
			style = 1;
			text = "0 €";
		};

		class BackgroundDamage: Life_RscText
		{
			idc = -1;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 1.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorBackground[] = {0.2,0.2,0.2,0.3};
		};

		class BackgroundFatigue: Life_RscText
		{
			idc = -1;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 2.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorBackground[] = {0.2,0.2,0.2,0.3};
		};

		class ProgressDamage: Life_RscProgress
		{
			idc = 5101;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 1.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorBackground[] = {0,0,0,0.25};
			colorBar[] = {0,0,0,0.25};
		};

		class ProgressFatigue: Life_RscProgress
		{
			idc = 5102;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 2.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorBackground[] = {0,0,0,0.25};
			colorBar[] = {0,0,0,0.25};
		};

		class TextDamage: Life_RscText
		{
			idc = -1;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 1.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			text = "DAMAGE";
			sizeEX = "0.8 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class TextFatigue: TextDamage
		{
			idc = -1;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 2.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			text = "FATIGUE";
		};

		class ValueDamage: Life_RscText
		{
			idc = 5103;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 1.5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			sizeEX = "0.8 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			style = 1;
		};

		class ValueFatigue: ValueDamage
		{
			idc = 5104;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 2.8 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			sizeEX = "0.8 * 			( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class GroupMeta: Life_RscControlsGroupNoScrollbars
		{
			idc = 5105;
			x = "safezoneX + safezoneW - 12.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "safezoneY + safezoneH - 10 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "12 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2.8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{
				class BackgroundMeta: Life_RscText
				{
					idc = -1;
					x = "6.6 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "5.4 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1.4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					colorBackground[] = {0.2,0.2,0.2,0.4};
				};

				class PictureMetaSide: Life_RscPictureKeepAspect
				{
					idc = 5106;
					x = "7.2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "1.4 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1.4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					text = "";
				};

				class PictureMetaVehicle: Life_RscPictureKeepAspect
				{
					idc = 5107;
					x = "8.9 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "2.8 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1.4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					text = "";
				};

				class TextMeta: Life_RscText
				{
					idc = 5108;
					x = "0 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "1.4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "12 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "1.4 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					colorBackground[] = {0.95,0.95,0.95,0.8};
					colorText[] = {0,0,0,1};
					shadow = 0;
					sizeEX = "1 * 				( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					style = 2;
					text = "";
				};
			};
		};

		class BackgroundHunger: Life_RscPictureKeepAspect
		{
			idc = 5109;
			x = "safezoneX + safezoneW - 2.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "10.5 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorText[] = { "( profilenamespace getVariable [ 'IGUI_BCG_RGB_R', 0 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_G', 1 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_B', 1 ] )", "( profilenamespace getVariable [ 'IGUI_BCG_RGB_A', 0.8 ] )" };
			text = "icons\HUD\ring_8.paa";
		};

		class BackgroundThirst: BackgroundHunger
		{
			idc = 5110;
			x = "safezoneX + safezoneW - 2.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
		};

		class RingHunger: Life_RscPictureKeepAspect
		{
			idc = 5111;
			x = "safezoneX + safezoneW - 2.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "10.5 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorText[] = {0.95,0.95,0.95,1};
			text = "icons\HUD\ring_6.paa";
		};

		class RingThirst: RingHunger
		{
			idc = 5112;
			x = "safezoneX + safezoneW - 2.5 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			y = "8 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			w = "2 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			text = "icons\HUD\ring_3.paa";
		};

		class IconHunger: RingHunger
		{
			idc = 5113;
			text = "icons\HUD\hunger.paa";
		};

		class IconThirst: RingThirst
		{
			idc = 5114;
			text = "icons\HUD\thirst.paa";
		};
	};
};