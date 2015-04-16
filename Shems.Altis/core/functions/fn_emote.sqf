_unit = _this select 0;
_msg = _this select 1;

if(_unit getVariable ["restrained", false]) exitWith {hint "Vous ne pouvez pas bouger lorsque vous êtes menotté!";};
if(vehicle _unit != _unit) exitWith {hint "Il est dangereux de faire des mouvements brusques dans un vehicule!";};

_black = [
	"Acts_listeningToRadio_In",
	"Acts_listeningToRadio_Loop",
	"Acts_listeningToRadio_Out",
	"AinvPknlMstpSnonWnonDr_medic0",
	"AinvPknlMstpSnonWnonDnon_medic_1",
	"AfalPknlMstpSnonWnonDnon",
	"Acts_carFixingWheel",
	"AinvPknlMstpSlayWrflDnon",
	"AmovPercMstpSnonWnonDnon",
	"AmovPercMstpSnonWnonDnon_Ease",
	"AmovPercMstpSsurWnonDnon",
	"amovppnemstpsraswrfldnon",
	"CutSceneAnimationBaseZoZo",
	"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"
];

_emotes = [
	["faire chier","Acts_AidlPercMstpSlowWrflDnon_pissing"],
	["impatient","Acts_B_M05_briefing"],
	["expliquer","Acts_C_in1_briefing"],
	["garde","Acts_Ending_Lacey2"],
	["signal","Acts_SignalToCheck"],
	["attirer","Acts_NavigatingChopper_Loop"],
	["vague","Acts_PercMstpSlowWrflDnon_handup1b"],
	["vague2","Acts_PercMstpSlowWrflDnon_handup1"],
	["vague3","Acts_PercMstpSlowWrflDnon_handup2"],
	["stop","Acts_PercMstpSlowWrflDnon_handup2c"],
	["droit","Acts_ShowingTheRightWay_loop"],
	["parler","acts_StandingSpeakingUnarmed"],
	["ninja","AmovPercMstpSnonWnonDnon_exerciseKata"],
	["exercice","AmovPercMstpSnonWnonDnon_exercisekneeBendA"],
	["exercice2","AmovPercMstpSnonWnonDnon_exercisekneeBendB"],
	["monter","AmovPercMstpSnonWnonDnon_exercisePushup"]
];

_message = [_msg, 3] call aniChatEvents_substr;
if ((_message call aniChatEvents_strlen) > 0) then
{
	_index = [_message,_emotes] call life_fnc_index;
	if (_index < 0) exitWith {};
	_anim = (_emotes select _index) select 1;
	if (_anim in _black) exitWith {};
	if (vehicle player != player) exitWith {};
	[[player,_anim,"playNow"],"life_fnc_animSync",true,false] call BIS_fnc_MP;
	[[player,_anim,"switch"],"life_fnc_animSync",true,false] call BIS_fnc_MP;
} else {
	_anims = "Vous pouvez faire ces animations: ";
	{ 
		_anims = _anims + (_x select 0); 
		if ((_forEachIndex + 1) < (count _emotes)) then 
		{ 
			_anims = _anims + ", ";
		}; 
	} forEach _emotes;
	_anims = _anims + ".";
	systemChat _anims;
};