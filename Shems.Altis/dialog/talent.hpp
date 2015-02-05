class life_talent 
{
	idd = 966;
	name= "life_talent";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground 
	{
		class Life_RscTitleBackground:Life_RscText 
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
	};

	class controls 
	{
		class Title : Life_RscTitle 
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 967;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class talentListHeader : Life_RscText
		{
			idc = 968;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Competences";
			sizeEx = 0.04;
			x = 0.105; 
			y = 0.26;
			w = 0.275; 
			h = 0.04;
		};

		class talentList : life_RscListBox
		{
			idc = 969;
			sizeEx = 0.030;
			onLBSelChanged = "[] spawn life_fnc_talentRefresh;";
			x = 0.105;
			y = 0.31;
			w = 0.275; 
			h = 0.44;
		};

		class materialListHeader : Life_RscText
		{
			idc = 970;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Description";
			sizeEx = 0.04;
			x = 0.395; 
			y = 0.26;
			w = 0.275; 
			h = 0.04;
		};

		class materialList : Life_RscControlsGroup
		{
			idc = 971;
			w = 0.275;
			h = 0.44;
			x = 0.395;
			y = 0.30;
			class Controls
			{
				class mats : Life_RscStructuredText
				{
					idc = 972;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27; 
					h = 0.44;
				};
			};
		};

		class Buttontalent : Life_RscButtonMenu 
		{
			idc = 973;
			text = "Apprendre";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "if(!life_is_processing) then {[] spawn life_fnc_viewTalent};";
			x = 0.69;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};


		class CloseButtonKey : Life_RscButtonMenu 
		{
			idc = -1;
			text = "Fermer";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};