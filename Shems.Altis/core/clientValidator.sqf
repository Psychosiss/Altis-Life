private "_vars";
_vars = 
[
	"life_revive_fee","life_gangPrice","life_gangUpgradeBase","life_enableFatigue","life_paycheck_period","life_taxes_period","life_vShop_rentalOnly","buy_array","life_impound_air",
	"life_weapon_shop_array","life_garage_prices","life_garage_sell","life_houseLimit","life_gangUpgradeMultipler","life_impound_car","life_impound_boat"
];

{
	if(!isNil {(missionNamespace getVariable _x)}) exitWith 
	{
		[[profileName,getPlayerUID player,format["VariableSetBeforeInitialized_%1",_x]],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
		[[profileName,format["Variable set before client initialized: %1",_x]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
		sleep 0.5;
		["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
	};
} foreach _vars;