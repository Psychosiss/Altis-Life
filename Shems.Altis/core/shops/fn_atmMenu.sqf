#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)

private["_display","_text","_units","_type"];

if(!life_use_atm) exitWith
{
	hint "Vous devez attendre 5 minutes après avoir pillé la reserve fédérale.";
};

if(!dialog) then
{
	if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;

lbClear _units;
_text ctrlSetStructuredText parseText format
["
	<img size='1.7' image='icons\bank.paa'/> %1 €<br/>
	<img size='1.6' image='icons\money.paa'/> %2 €"
	,[life_atmmoney] call life_fnc_numberText
	,[life_money] call life_fnc_numberText
];

{
	if(alive _x) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "EMS"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [2703,0];

if(isNil {(group player getVariable "gang_bank")}) then 
{
	(getControl(2700,2705)) ctrlEnable false;
};