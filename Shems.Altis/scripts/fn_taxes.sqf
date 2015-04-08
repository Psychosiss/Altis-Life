private["_taxe"];

if(playerSide == west) then{_taxe = 2000;};
if(playerSide == civilian) then{_taxe = 1000;};
if(playerSide == independent) then{_taxe = 1500;};

if (isNil "_taxe") then 
{
    _taxe = 1000;
};

while {true} do
{
    sleep 600;
    ["ImpotStandard",["Vous receverez votre avis d'imposition dans 10 minutes"]] call BIS_fnc_showNotification;
    sleep 600;
    if(_taxe > life_atmcash) exitWith{["ImpotPoor",["Vous ête trop pauvre et ne recevrez pas d'impots"]] call BIS_fnc_showNotification};
    ["ImpotLevy",[format["Le montant de vos impots s'élève à %1 €",_taxe]]] call BIS_fnc_showNotification;
    life_atmcash = life_atmcash - _taxe;
};