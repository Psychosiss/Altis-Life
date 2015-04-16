private["_vault","_state","_funds"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_state = [_this,1,-1,[0]] call BIS_fnc_param;
_funds = [_this,2,-1,[0]] call BIS_fnc_param;

if(isNull _vault) exitWith {};

switch(_state) do
{
	case -1: {_vault setVariable["fed_rob_ip",false,true]; _vault setVariable["fed_locked",false,true];};
	case 0:
	{
		[[2,"Le vol de la réserve fédérale a échoué pour des raisons inconnues"],"life_fnc_broadcast",nil,false] call life_fnc_MP;
		_vault setVariable["fed_locked",true,true];
		sleep (10 * 60);
		_vault setVariable["fed_locked",false,true];
		_vault setVariable["fed_rob_ip",false,true];
	};
	
	case 1:
	{
		[[1,format["%1 € a été volé à la réserve fédérale.",[_funds] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
		_vault setVariable["fed_locked",true,true];
		sleep (30 * 60);
		_vault setVariable["fed_locked",false,true];
		_vault setVariable["fed_rob_ip",false,true];
	
		if(_funds > life_federal_funds) then
		{
			life_federal_funds = 0;
		} else {
			life_federal_funds = life_federal_funds - _funds;
		};
		
		_funds = round(_funds / (count playableUnits) * 3);
		[[_funds],"life_fnc_fedSuccess",false,false] call life_fnc_MP;
	};
};