private "_spikes";
_spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0;
if(isNil "_spikes") exitWith {};

if(([true,"spikeStrip",1] call life_fnc_handleInv)) then
{
	titleText["Vous avez placé des herses.","PLAIN"];
	player removeAction life_action_spikeStripPickup;
	life_action_spikeStripPickup = nil;
	deleteVehicle _spikes;
};