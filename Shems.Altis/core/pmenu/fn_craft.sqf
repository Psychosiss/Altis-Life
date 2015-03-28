private["_dialog","_inv","_itemInfo","_filter"];
if(!dialog) then 
{
	createDialog "life_craft";
};
disableSerialization;

if(life_is_processing) exitWith 
{
	closeDialog 2001;
	closeDialog 0;
};

_dialog = findDisplay 666;
_inv = _dialog displayCtrl 669;
lbClear _inv;

_filter = _dialog displayCtrl 673;
_filter lbAdd "Armes";
_filter lbSetData[(lbSize _filter)-1,"weapon"];
_filter lbAdd "Uniformes";
_filter lbSetData[(lbSize _filter)-1,"uniform"];
_filter lbAdd "Sacs";
_filter lbSetData[(lbSize _filter)-1,"backpack"];
_filter lbAdd "Objets";
_filter lbSetData[(lbSize _filter)-1,"item"];
_filter lbSetCurSel 0;