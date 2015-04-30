with missionNamespace do 
{
	["Deconnection..."] call life_fnc_log;
	_colorHighlight = ["GUI","BCG_RGB"] call BIS_fnc_displayColorGet;
	_colorHighlight = _colorHighlight call life_fnc_colorRGBtoHTML;
	player allowDamage false;
	disableUserInput true;
	showChat false;
	hint "";
	//false call life_fnc_playerTags;
	1 fadeSound 0;
	1 fadeMusic 0;
	1 fadeRadio 0;
	1 fadeSpeech 0;
	[] call SOCK_fnc_updateRequest;
	cutText ["","BLACK",1];
	sleep 1;
	_effectID = 1 + floor random 3;
	_videoFile = "A3\Missions_F_Bootcamp\video\VR_GenericTransition_" + str _effectID + ".ogv";
	_video = [_videoFile] spawn BIS_fnc_playVideo;
	playSound ("Transition" + str _effectID);
	sleep 1;
	0 = [format["<br/><t color='%4'>%3</t><br/><br/><t size='0.7'>%1 %2.</t>","Nous esperons vous revoir bientot",profileName,"Synchronisation avec le serveur",_colorHighlight],0,0.2,2,0.5,0,1000] spawn BIS_fnc_dynamicText;
	[] spawn 
	{
		if !(life_is_arrested) then 
		{
			player setPosATL (getMarkerPos "abort");
		};
		//[] call SOCK_fnc_updateRequest;
		sleep 4;
		disableUserInput false;
		showChat true;
		["Abort",true,false] call BIS_fnc_endMission;
	};
};