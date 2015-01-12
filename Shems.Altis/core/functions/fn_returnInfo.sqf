private["_exp","_mode","_return","_side","_lvl2","_lvl3","_lvl4","_lvl5","_lvl5","_lvl6","_lvl7","_lvl8","_lvl9","_lvl10","_lvl11","_lvl12","_lvl13","_lvl14","_lvl15","_lvl16","_lvl17","_lvl18","_lvl19","_lvl20","_lvl21","_lvl22","_lvl23","_lvl24","_lvl25","_lvl26","_lvl27","_lvl28","_lvl29","_lvl30","_lvl31","_lvl32","_lvl33","_lvl34","_lvl35","_lvl36","_lvl37","_lvl38","_lvl39","_lvl40","_lvl41"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_exp = [_this,0,0,[0]] call BIS_fnc_param;
_side = playerSide;

_lvl2 = 200;
_lvl3 = 600;
_lvl4 = 1200;
_lvl5 = 2000;
_lvl6 = 3600;
_lvl7 = 6000;
_lvl8 = 9200;
_lvl9 = 13200;
_lvl10 = 18000;
_lvl11 = 25200;
_lvl12 = 34800;
_lvl13 = 46800;
_lvl14 = 61200;
_lvl15 = 78000;
_lvl16 = 102000;
_lvl17 = 133200;
_lvl18 = 171600;
_lvl19 = 217200;
_lvl20 = 270000;
_lvl21 = 344400;
_lvl22 = 440400;
_lvl23 = 558000;
_lvl24 = 697200;
_lvl25 = 901200;
_lvl26 = 1170000;
_lvl27 = 1503600;
_lvl28 = 1902000;
_lvl29 = 2365200;
_lvl30 = 2893200;
_lvl31 = 3550800;
_lvl32 = 4338000;
_lvl33 = 5254800;
_lvl34 = 6301200;
_lvl35 = 7477200;
_lvl36 = 8912400;
_lvl37 = 10606800;
_lvl38 = 12560400;
_lvl39 = 14773200;
_lvl40 = 17245200;
_lvl41 = 20235600;

switch (_mode) do 
{
	case 0: 
	{
		_exp = life_exp;
		if(_exp >= 0 && _exp < _lvl2)then {_return = 1;};
		if(_exp >= _lvl2 && _exp < _lvl3)then {_return = 2;};
		if(_exp >= _lvl3 && _exp < _lvl4)then {_return = 3;};
		if(_exp >= _lvl4 && _exp < _lvl5)then {_return = 4;};
		if(_exp >= _lvl5 && _exp < _lvl6)then {_return = 5;};
		if(_exp >= _lvl6 && _exp < _lvl7)then {_return = 6;};
		if(_exp >= _lvl7 && _exp < _lvl8)then {_return = 7;};
		if(_exp >= _lvl8 && _exp < _lvl9)then {_return = 8;};
		if(_exp >= _lvl9 && _exp < _lvl10)then {_return = 9;};
		if(_exp >= _lvl10 && _exp < _lvl11)then {_return = 10;};
		if(_exp >= _lvl11 && _exp < _lvl12)then {_return = 11;};
		if(_exp >= _lvl12 && _exp < _lvl13)then {_return = 12;};
		if(_exp >= _lvl13 && _exp < _lvl14)then {_return = 13;};
		if(_exp >= _lvl14 && _exp < _lvl15)then {_return = 14;};
		if(_exp >= _lvl15 && _exp < _lvl16)then {_return = 15;};
		if(_exp >= _lvl16 && _exp < _lvl17)then {_return = 16;};
		if(_exp >= _lvl17 && _exp < _lvl18)then {_return = 17;};
		if(_exp >= _lvl18 && _exp < _lvl19)then {_return = 18;};
		if(_exp >= _lvl19 && _exp < _lvl20)then {_return = 19;};
		if(_exp >= _lvl20 && _exp < _lvl21)then {_return = 20;};
		if(_exp >= _lvl21 && _exp < _lvl22)then {_return = 21;};
		if(_exp >= _lvl22 && _exp < _lvl23)then {_return = 22;};
		if(_exp >= _lvl23 && _exp < _lvl24)then {_return = 23;};
		if(_exp >= _lvl24 && _exp < _lvl25)then {_return = 24;};
		if(_exp >= _lvl25 && _exp < _lvl26)then {_return = 25;};
		if(_exp >= _lvl26 && _exp < _lvl27)then {_return = 26;};
		if(_exp >= _lvl27 && _exp < _lvl28)then {_return = 27;};
		if(_exp >= _lvl28 && _exp < _lvl29)then {_return = 28;};
		if(_exp >= _lvl29 && _exp < _lvl30)then {_return = 29;};
		if(_exp >= _lvl30 && _exp < _lvl31)then {_return = 30;};
		if(_exp >= _lvl31 && _exp < _lvl32)then {_return = 31;};
		if(_exp >= _lvl32 && _exp < _lvl33)then {_return = 32;};
		if(_exp >= _lvl33 && _exp < _lvl34)then {_return = 33;};
		if(_exp >= _lvl34 && _exp < _lvl35)then {_return = 34;};
		if(_exp >= _lvl35 && _exp < _lvl36)then {_return = 35;};
		if(_exp >= _lvl36 && _exp < _lvl37)then {_return = 36;};
		if(_exp >= _lvl37 && _exp < _lvl38)then {_return = 37;};
		if(_exp >= _lvl38 && _exp < _lvl39)then {_return = 38;};
		if(_exp >= _lvl39 && _exp < _lvl40)then {_return = 39;};
		if(_exp >= _lvl40 && _exp < _lvl41)then {_return = 40;};
	};
	
	case 1: 
	{
		private["_exp","_itemInfo","_level2"];
		_exp = life_exp;
		_i = 0;
		_return = 0;
		_level2 = [0] call life_fnc_returnInfo;
		_config = [] call life_fnc_skillsCfg;
		{
			_itemInfo = _x select 1;
			
			if(missionNamespace getVariable[_itemInfo,true])then
			{
				_i = _i + 1;
			};
		} foreach _config;

		_return = _level2 - _i;
	};
	
	case 2: 
	{
		private["_exp","_level","_explast","_expnext","_need","_have"];
		_exp = life_exp;
		_need = 0;
		_explast = 0;
		_expnext = 0;
		_level = [0] call life_fnc_returnInfo;
		switch (_level) do {
			case 1: {_expnext = _lvl2};			
			case 2: {_explast = _lvl2; _expnext = _lvl3};			
			case 3: {_explast = _lvl3; _expnext = _lvl4;};         
			case 4: {_explast = _lvl4; _expnext = _lvl5;};            
			case 5: {_explast = _lvl5; _expnext = _lvl6;};            
			case 6: {_explast = _lvl6; _expnext = _lvl7;};              
			case 7: {_explast = _lvl7; _expnext = _lvl8;};               
			case 8: {_explast = _lvl8; _expnext = _lvl9;};              
			case 9: {_explast = _lvl9; _expnext = _lvl10;};             
			case 10: {_explast = _lvl10; _expnext = _lvl11;};         
			case 11: {_explast = _lvl11; _expnext = _lvl12;};         
			case 12: {_explast = _lvl12; _expnext = _lvl13;};      
			case 13: {_explast = _lvl13; _expnext = _lvl14;}; 
			case 14: {_explast = _lvl14; _expnext = _lvl15;}; 
			case 15: {_explast = _lvl15; _expnext = _lvl16;}; 
			case 16: {_explast = _lvl16; _expnext = _lvl17;}; 
			case 17: {_explast = _lvl17; _expnext = _lvl18;}; 
			case 18: {_explast = _lvl18; _expnext = _lvl19;}; 
			case 19: {_explast = _lvl19; _expnext = _lvl20;}; 
			case 20: {_explast = _lvl20; _expnext = _lvl21;}; 
			case 21: {_explast = _lvl21; _expnext = _lvl22;}; 
			case 22: {_explast = _lvl22; _expnext = _lvl23;}; 
			case 23: {_explast = _lvl23; _expnext = _lvl24;}; 
			case 24: {_explast = _lvl24; _expnext = _lvl25;}; 
			case 25: {_explast = _lvl25; _expnext = _lvl26;}; 
			case 26: {_explast = _lvl26; _expnext = _lvl27;}; 
			case 27: {_explast = _lvl27; _expnext = _lvl28;}; 
			case 28: {_explast = _lvl28; _expnext = _lvl29;}; 
			case 29: {_explast = _lvl29; _expnext = _lvl30;}; 
			case 30: {_explast = _lvl30; _expnext = _lvl31;}; 
			case 31: {_explast = _lvl31; _expnext = _lvl32;}; 
			case 32: {_explast = _lvl32; _expnext = _lvl33;}; 
			case 33: {_explast = _lvl33; _expnext = _lvl34;}; 
			case 34: {_explast = _lvl34; _expnext = _lvl35;}; 
			case 35: {_explast = _lvl35; _expnext = _lvl36;}; 
		};
		_need = _expnext - _explast;
		_have = life_exp - _explast; 
		_return = ((1/_need)*_have);
	};
	
	case 3: 
	{
		if(_exp >= 0 && _exp < _lvl2)then {_return = 1;};
		if(_exp >= _lvl2 && _exp < _lvl3)then {_return = 2;};
		if(_exp >= _lvl3 && _exp < _lvl4)then {_return = 3;};
		if(_exp >= _lvl4 && _exp < _lvl5)then {_return = 4;};
		if(_exp >= _lvl5 && _exp < _lvl6)then {_return = 5;};
		if(_exp >= _lvl6 && _exp < _lvl7)then {_return = 6;};
		if(_exp >= _lvl7 && _exp < _lvl8)then {_return = 7;};
		if(_exp >= _lvl8 && _exp < _lvl9)then {_return = 8;};
		if(_exp >= _lvl9 && _exp < _lvl10)then {_return = 9;};
		if(_exp >= _lvl10 && _exp < _lvl11)then {_return = 10;};
		if(_exp >= _lvl11 && _exp < _lvl12)then {_return = 11;};
		if(_exp >= _lvl12 && _exp < _lvl13)then {_return = 12;};
		if(_exp >= _lvl13 && _exp < _lvl14)then {_return = 13;};
		if(_exp >= _lvl14 && _exp < _lvl15)then {_return = 14;};
		if(_exp >= _lvl15 && _exp < _lvl16)then {_return = 15;};
		if(_exp >= _lvl16 && _exp < _lvl17)then {_return = 16;};
		if(_exp >= _lvl17 && _exp < _lvl18)then {_return = 17;};
		if(_exp >= _lvl18 && _exp < _lvl19)then {_return = 18;};
		if(_exp >= _lvl19 && _exp < _lvl20)then {_return = 19;};
		if(_exp >= _lvl20 && _exp < _lvl21)then {_return = 20;};
		if(_exp >= _lvl21 && _exp < _lvl22)then {_return = 21;};
		if(_exp >= _lvl22 && _exp < _lvl23)then {_return = 22;};
		if(_exp >= _lvl23 && _exp < _lvl24)then {_return = 23;};
		if(_exp >= _lvl24 && _exp < _lvl25)then {_return = 24;};
		if(_exp >= _lvl25 && _exp < _lvl26)then {_return = 25;};
		if(_exp >= _lvl26 && _exp < _lvl27)then {_return = 26;};
		if(_exp >= _lvl27 && _exp < _lvl28)then {_return = 27;};
		if(_exp >= _lvl28 && _exp < _lvl29)then {_return = 28;};
		if(_exp >= _lvl29 && _exp < _lvl30)then {_return = 29;};
		if(_exp >= _lvl30 && _exp < _lvl31)then {_return = 30;};
		if(_exp >= _lvl31 && _exp < _lvl32)then {_return = 31;};
		if(_exp >= _lvl32 && _exp < _lvl33)then {_return = 32;};
		if(_exp >= _lvl33 && _exp < _lvl34)then {_return = 33;};
		if(_exp >= _lvl34 && _exp < _lvl35)then {_return = 34;};
		if(_exp >= _lvl35 && _exp < _lvl36)then {_return = 35;};
		if(_exp >= _lvl36 && _exp < _lvl37)then {_return = 36;};
		if(_exp >= _lvl37 && _exp < _lvl38)then {_return = 37;};
		if(_exp >= _lvl38 && _exp < _lvl39)then {_return = 38;};
		if(_exp >= _lvl39 && _exp < _lvl40)then {_return = 39;};
		if(_exp >= _lvl40 && _exp < _lvl41)then {_return = 40;};
	};
};

_return;