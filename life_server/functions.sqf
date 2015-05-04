fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;
	{
		if(_item in _x) exitWith 
		{
			_return = _forEachIndex;
		};
	} foreach _stack;
	_return;
";

publicVariable "fnc_index";

fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};
	[[life_atmmoney,life_money,owner player,player],""life_fnc_admininfo"",_ret,false] spawn life_fnc_MP;
";
publicVariable "fnc_player_query";

fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;
	
	{
		if(_x in _valid) then	
		{
		} else {
			_return = false;
		};
	} foreach _array;
	_return;
";

publicVariable "fnc_isnumber";

clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		life_my_gang = ObjNull;
		[player] joinSilent (createGroup civilian);
		hint ""You have been kicked out of the gang."";
		
	};
";
publicVariable "clientGangKick";

clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR isNil ""_giver"") exitWith {};
	if(player == _unit && !(_vehicle in life_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 has gave you keys for a %2"",_giver,_name];
		life_vehicles pushBack _vehicle;
		[[getPlayerUID player,playerSide,_vehicle,1],""TON_fnc_keyManagement"",false,false] spawn life_fnc_MP;
	};
";

publicVariable "clientGetKey";

clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint ""Vous ête le nouveau leadeur du gang."";
	};
";

publicVariable "clientGangLeader";

fnc_cell_emsrequest = 
compileFinal "
private[""_msg"",""_to""];
	ctrlShow[3022,false];
	_msg = ctrlText 3003;
	_to = ""EMS Units"";
	if(_msg == """") exitWith {hint ""Vous devez écrire un message à envoyer!"";ctrlShow[3022,true];};
		
	[[_msg,name player,5],""clientMessage"",independent,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Vous avez envoyé un message au médecin."",_to,_msg];
	ctrlShow[3022,true];
";

fnc_cell_textmsg =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3015,false];
	_msg = ctrlText 3003;
	if(lbCurSel 3004 == -1) exitWith {hint ""Vous devez séléctionner quelqu'un!""; ctrlShow[3015,true];};
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {ctrlShow[3015,true];};
	if(isNil ""_to"") exitWith {ctrlShow[3015,true];};
	if(_msg == """") exitWith {hint ""Vous devez écrire un message à envoyer!"";ctrlShow[3015,true];};
	
	[[_msg,name player,0],""clientMessage"",_to,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Vous envoyez à %1 ce message: %2"",name _to,_msg];
	ctrlShow[3015,true];
";

fnc_cell_textcop =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3016,false];
	_msg = ctrlText 3003;
	_to = ""The Police"";
	if(_msg == """") exitWith {hint ""Vous devez écrire un message à envoyer!"";ctrlShow[3016,true];};
		
	[[_msg,name player,1],""clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Vous envoyez à %1 ce message: %2"",_to,_msg];
	ctrlShow[3016,true];
";

fnc_cell_textadmin =
compileFinal "
	private[""_msg"",""_to"",""_from""];
	ctrlShow[3017,false];
	_msg = ctrlText 3003;
	_to = ""The Admins"";
	if(_msg == """") exitWith {hint ""Vous devez écrire un message à envoyer!"";ctrlShow[3017,true];};
	[[_msg,name player,2],""clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Vous envoyez à %1 ce message: %2"",_to,_msg];
	ctrlShow[3017,true];
";

fnc_cell_adminmsg =
compileFinal "
	if(isServer) exitWith {};
	if((call life_adminlevel) < 1) exitWith {hint ""Vous n'ête pas administrateur!"";};
	private[""_msg"",""_to""];
	_msg = ctrlText 3003;
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {};
	if(_msg == """") exitWith {hint ""Vous devez écrire un message à envoyer!"";};
	[[_msg,name player,3],""clientMessage"",_to,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Message Admin Envoyé à: %1 - Message: %2"",name _to,_msg];
";

fnc_cell_adminmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((call life_adminlevel) < 1) exitWith {hint ""Vous n'ête pas administrateur!"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""Vous devez écrire un message à envoyer!"";};
	[[_msg,name player,4],""clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Message Admin à tous: %1"",_msg];
";

fnc_cell_serverMessageall =
compileFinal "
	if(isServer) exitWith {};
	if((call life_adminlevel) < 1) exitWith {hint ""Vous n'ête pas administrateur!"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""Vous devez écrire un message à envoyer!"";};
	[[_msg,name player,7],""clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Evenement du serveur à tous: %1"",_msg];
";
//Test : hint format[""Purge: %1"",_msg];

publicVariable "fnc_cell_textmsg";
publicVariable "fnc_cell_textcop";
publicVariable "fnc_cell_textadmin";
publicVariable "fnc_cell_adminmsg";
publicVariable "fnc_cell_adminmsgall";
publicVariable "fnc_cell_emsrequest";
publicVariable "fnc_cell_serverMessageall";

clientMessage =
compileFinal "
	if(isServer) exitWith {};
	private[""_msg"",""_from"", ""_type""];
	_msg = _this select 0;
	_from = _this select 1;
	_type = _this select 2;
	if(_from == """") exitWith {};
	switch _type do
	{
		case 0 :
		{
			private[""_message""];
			_message = format["">>>MESSAGE DE %1: %2"",_from,_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Nouveau Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>à: <t color='#ffffff'>Vous<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			[""TextMessage"",[format[""Vous avez reçu un nouveau SMS de %1"",_from]]] call bis_fnc_showNotification;
			player say3D ""message"";
			systemChat _message;
		};

		case 1 :
		{
			if(side player != west) exitWith {};
			private[""_message""];
			_message = format[""Police %1: %2"",_from,_msg];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Nouveau message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>à: <t color='#ffffff'>Tout les policiers<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			[""PoliceDispatch"",[format[""Un nouveau rapport de police de: %1"",_from]]] call bis_fnc_showNotification;
			player say3D ""message"";
			systemChat _message;
		};

		case 2 :
		{
			if((call life_adminlevel) < 1) exitWith {};
			private[""_message""];
			_message = format[""Requête Administrative de %1: %2"",_from,_msg];
			hint parseText format [""<t color='#ffcefe'><t size='2'><t align='center'>Requête Administrative<br/><br/><t color='#33CC33'><t align='left'><t size='1'>à: <t color='#ffffff'>Administrateurs<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			[""AdminDispatch"",[format[""%1 As fait une requête à l'administration!"",_from]]] call bis_fnc_showNotification;
			player say3D ""message"";
			systemChat _message;
		};

		case 3 :
		{
			private[""_message""];
			_message = format[""MESSAGE ADMIN : %1"",_msg];
			_admin = format[""Envoyer par: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Message Admin<br/><br/><t color='#33CC33'><t align='left'><t size='1'>à: <t color='#ffffff'>Vous<br/><t color='#33CC33'>De: <t color='#ffffff'>Un Administrateur<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1"",_msg];
			[""AdminMessage"",[""Vous avez reçu un message d'un admin!""]] call bis_fnc_showNotification;
			player say3D ""message"";
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};

		case 4 :
		{
			private[""_message"",""_admin""];
			_message = format[""!!!ADMIN MESSAGE: %1"",_msg];
			_admin = format[""Envoyer par: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Message Admin<br/><br/><t color='#33CC33'><t align='left'><t size='1'>à: <t color='#ffffff'>Tout les joueurs<br/><t color='#33CC33'>De: <t color='#ffffff'>The Admins<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1"",_msg];
			[""AdminMessage"",[""Vous avez reçu un message d'un admin!""]] call bis_fnc_showNotification;
			player say3D ""message"";
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};

		case 5 : 
		{
			private[""_message""];
			_message = format[""Requête Medicale: %1"",_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Requête medicale<br/><br/><t color='#33CC33'><t align='left'><t size='1'>à: <t color='#ffffff'>Vous<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			[""TextMessage"",[format[""Requête médicale de %1"",_from]]] call bis_fnc_showNotification;
		};

		case 6 :
		{
			private[""_message"",""_admin""];
			_message = format[""Evenement: %1"",_msg];
			_admin = format[""Envoyé par l'administrateur: %1"", _from];
			hint parseText format [""<t color='#A00ED0'><t size='2'><t align='center'>Evenement<br/><br/><t color='#33CC33'><t align='left'><t size='1'>à: <t color='#ffffff'>Tout les joueurs<br/><t color='#33CC33'>De: <t color='#ffffff'>L'administration<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1"",_msg];
			[""AdminMessage"",[""Vous avez reçu un message par rapport à un evenement!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_adminlevel) > 1) then {systemChat _admin;};
		};
	};
";
/*
in case 6 :
_message = format[""Purge: %1"",_msg];
hint parseText format [""<t color='#A00ED0'><t size='2'><t align='center'>Purge<br/><br/><t color='#33CC33'><t align='left'><t size='1'>à: <t color='#ffffff'>Tout les joueurs<br/><t color='#33CC33'>De: <t color='#ffffff'>L'administration<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1"",_msg];
[""AdminMessage"",[""Vous avez reçu un message par rapport à la purge!""]] call bis_fnc_showNotification;
*/

publicVariable "clientMessage";