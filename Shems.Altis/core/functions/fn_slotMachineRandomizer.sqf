private["_RandomNumber","_VirtReel","_ret"];

_ret = 0;
_RandomNumber = floor(random 1000000);
_VirtReel = _RandomNumber mod 64;

diag_log format["Randomizer remainder is %1 from %2",_VirtReel, _RandomNumber];

switch _VirtReel do 
{ 
	case 0;
	case 1;
	case 2; 
	case 3; 
	case 4;
	case 5;
	case 6;
	case 7;
	case 8;
	case 9: { _ret = 0 };
	case 10;
	case 11;
	case 12;
	case 13;
	case 14;
	case 15;
	case 16;
	case 17;
	case 18: { _ret = 1 };
	case 19;
	case 20;
	case 21;
	case 22;
	case 23;
	case 24;
	case 25;
	case 26: { _ret = 2 };
	case 27;
	case 28;
	case 29;
	case 30;
	case 31;
	case 32;
	case 33;
	case 34: { _ret = 3 };
	case 35;
	case 36; 
	case 37;
	case 38;
	case 39;
	case 40;
	case 41;
	case 42: { _ret = 4 };
	case 43;
	case 44;
	case 45;
	case 46;
	case 47;
	case 48;
	case 49;
	case 50: { _ret = 5 };
	case 51;
	case 52;
	case 53;
	case 54;
	case 55: { _ret = 6 };
	case 56;
	case 57;
	case 58;
	case 59;
	case 60: { _ret = 7 };
	case 61;
	case 62;
	case 63: { _ret = 8 };
};
 
diag_log format["Randomizer return number is %1",_ret];

_ret;