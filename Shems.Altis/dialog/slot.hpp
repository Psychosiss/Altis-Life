class life_slotmachine
{
	name = "life_slotmachine";
	idd = 38205;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['life_slotmachine',_this select 0]";
	objects[]={};

	class controlsBackground 
	{
		class TitleBackground: Life_RscText 
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.82;
			h = (1/25);
		};

		class MainBackground : Life_RscText 
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.82;
			h = 0.7;
		};
	};

	class controls 
	{
		class Title : Life_RscTitle 
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Blackhawk Casino - Slotmachine";
		};

		class PlayButton : life_RscButton 
		{
			idc = 88808;
			text = "PLAY";
			type = 1;
			onButtonClick = "[] call life_fnc_slotPlay";
			x = 0.25;
			y = 0.6;
		};

		class Reel1 : RscPicture 
		{
			idc = 88801;
			text = "images\slots\SlotMachine\bar.paa";
			x = 0.1;
			y = 0.3;
			w = 0.15;
			h = 0.15;
		};

		class Reel2 : RscPicture 
		{
			idc = 88802;
			text = "images\slots\SlotMachine\bar.paa";
			x = 0.26;
			y = 0.3;
			w = 0.15;
			h = 0.15;
		};

		class Reel3 : RscPicture 
		{
			idc = 88803;
			text = "images\slots\SlotMachine\bar.paa";
			x = 0.42;
			y = 0.3;
			w = 0.15;
			h = 0.15;
		};

		class Legend : Life_RscStructuredText 
		{
			idc = -1;
			text = "Legend<br/> 3x BAR - JACKPOT!<br/> 7 + Bell + Diamond - 1000x<br/> 3x 7 - 300x<br/> 3x Bell - 200x<br/> 3x Diamond - 100x<br/> Mix of Diamond, Bell, 7 - 40x<br/> 3x Grapes - 40x <br/> 3x Plum - 30x <br/> 3x Cherry - 20x<br/> Mix of Fruits - 2x<br/> Anything other than Hearts - 1x";
			x = 0.57;
			y = 0.3;
			w = 0.4;
			h = 0.7;
		};
		
		class Last : Life_RscText 
		{
			idc = 88806;
			text = "Last winning: $0";
			x = 0.11;
			y = 0.65;
			w = 0.8;
		};

		class Cash : Life_RscText 
		{
			idc = 88807;
			text = "Your cash: $0";
			x = 0.11;
			y = 0.7;
			w = 0.8;
		};

		class Jackpot : Life_RscText 
		{
			idc = 88804;
			text = "Current Jackpot: [...Loading Jackpot...]";
			x = 0.11;
			y = 0.75;
			w = 0.8;
		};

		class Bet : Life_RscText 
		{
			idc = 88805;
			text = "Your bet: $0";
			x = 0.11;
			y = 0.8;
			w = 0.8;
		};
		
		class CloseButton : Life_RscButtonMenu 
		{
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.9 + (12 / 250);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};