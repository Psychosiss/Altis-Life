class life_RscSoundStatus
{
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 1e+011;
	scriptName = "life_RscSoundStatus";
	scriptPath = "GUI";
	onLoad = "[_this, ""life_RscSoundStatus""] call life_fnc_initDisplay";

	class Controls
	{	
		class PictureStatus: life_RscPictureKeepAspect
		{
			idc = 23000;
			x = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX )";
			y = "22 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "2 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "2 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			colorBackground[] = {0.95,0.95,0.95,1};
			text = "icons\mute.paa";
		};
	};
};