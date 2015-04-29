if(isNull (findDisplay 2900)) then
{
	if(!createDialog "SettingsMenu") exitWith {hint "Something went wrong, the menu won't open?"};
};

disableSerialization;

ctrlSetText[2902, format["%1", life_vdFoot]];
ctrlSetText[2912, format["%1", life_vdCar]];
ctrlSetText[2922, format["%1", life_vdAir]];

{
	slidersetRange [_x select 0,100,12000];
	((findDisplay 2900) displayCtrl _x select 0) sliderSetSpeed [100,100,100];
	sliderSetPosition [_x select 0, _x select 1];
} foreach [[2901,life_vdFoot],[2911,life_vdCar],[2921,life_vdAir]];

((findDisplay 2900) displayCtrl 2971) cbSetChecked life_sidechat;
((findDisplay 2900) displayCtrl 2970) cbSetChecked life_tagson;
((findDisplay 2900) displayCtrl 2972) cbSetChecked life_revealObjects;