private["_idxA","_idxB","_idxC","_slotType","_ret"];
_idxA = [_this,0,-1,[0]] call BIS_fnc_param;
_idxB = [_this,1,-1,[0]] call BIS_fnc_param;
_idxC = [_this,2,-1,[0]] call BIS_fnc_param;
_slotType = [_this,3,0,[0]] call BIS_fnc_param;
if(_idxA == -1 OR _idxB == -1 OR _idxC == -1) exitWith {[]};

_ret = 0;

if(_idxA == 8 && _idxB == 8 && _idxC == 8)then
{
   if(_slotType == 0)then {_ret = 500000;};
   if(_slotType == 1)then {_ret = 1000000;};
   if(_slotType == 2)then {_ret = 2000000;};
};
       
if(_idxA == 7 && _idxB == 7 && _idxC == 7)then
{
   if(_slotType == 0)then {_ret = 300000;};
   if(_slotType == 1)then {_ret = 600000;};
   if(_slotType == 2)then {_ret = 1200000;};
};

if(_idxA == 6 && _idxB == 6 && _idxC == 6)then
{
   if(_slotType == 0)then {_ret = 200000;};
   if(_slotType == 1)then {_ret = 400000;};
   if(_slotType == 2)then {_ret = 800000;};
};
         
if(_idxA == 5 && _idxB == 5 && _idxC == 5)then
{
   if(_slotType == 0)then {_ret = 100000;};
   if(_slotType == 1)then {_ret = 200000;};
   if(_slotType == 2)then {_ret = 400000;};
};

if(_idxA == 4 && _idxB == 4 && _idxC == 4)then
{
   if(_slotType == 0)then {_ret = 50000;};
   if(_slotType == 1)then {_ret = 100000;};
   if(_slotType == 2)then {_ret = 200000;};
};
         
if(_idxA == 3 && _idxB == 3 && _idxC == 3)then
{
   if(_slotType == 0)then {_ret = 40000;};
   if(_slotType == 1)then {_ret = 80000;};
   if(_slotType == 2)then {_ret = 160000;};
};
         
if(_idxA == 2 && _idxB == 2 && _idxC == 2)then
{
   if(_slotType == 0)then {_ret = 30000;};
   if(_slotType == 1)then {_ret = 60000;};
   if(_slotType == 2)then {_ret = 120000;};
};
         
if(_idxA == 1 && _idxB == 1 && _idxC == 1)then
{
   if(_slotType == 0)then {_ret = 20000;};
   if(_slotType == 1)then {_ret = 40000;};
   if(_slotType == 2)then {_ret = 80000;};
};

if(_idxA == 0 && _idxB == 0 && _idxC == 0)then
{
   if(_slotType == 0)then {_ret = 10000;};
   if(_slotType == 1)then {_ret = 20000;};
   if(_slotType == 2)then {_ret = 40000;};
};


if((_idxA == 8 && _idxB == 8 && _idxC != 8) or (_idxA == 8 && _idxB != 8 && _idxC == 8) or (_idxA != 8 && _idxB == 8 && _idxC == 8))then
{
   if(_slotType == 0)then {_ret = 8000;};
   if(_slotType == 1)then {_ret = 16000;};
   if(_slotType == 2)then {_ret = 32000;};
};

if((_idxA == 7 && _idxB == 7 && _idxC != 7) or (_idxA == 7 && _idxB != 7 && _idxC == 7) or (_idxA != 7 && _idxB == 7 && _idxC == 7))then
{
   if(_slotType == 0)then {_ret = 4000;};
   if(_slotType == 1)then {_ret = 8000;};
   if(_slotType == 2)then {_ret = 16000;};
};

if((_idxA == 6 && _idxB == 6 && _idxC != 6) or (_idxA == 6 && _idxB != 6 && _idxC == 6) or (_idxA != 6 && _idxB == 6 && _idxC == 6))then
{
   if(_slotType == 0)then {_ret = 2000;};
   if(_slotType == 1)then {_ret = 4000;};
   if(_slotType == 2)then {_ret = 8000;};
};

if((_idxA == 5 && _idxB == 5 && _idxC != 5) or (_idxA == 5 && _idxB != 5 && _idxC == 5) or (_idxA != 5 && _idxB == 5 && _idxC == 5))then
{
   if(_slotType == 0)then {_ret = 1000;};
   if(_slotType == 1)then {_ret = 2000;};
   if(_slotType == 2)then {_ret = 4000;};
};

if((_idxA == 4 && _idxB == 4 && _idxC != 4) or (_idxA == 4 && _idxB != 4 && _idxC == 4) or (_idxA != 4 && _idxB == 4 && _idxC == 4))then
{
   if(_slotType == 0)then {_ret = 900;};
   if(_slotType == 1)then {_ret = 1800;};
   if(_slotType == 2)then {_ret = 3600;};
};

if((_idxA == 3 && _idxB == 3 && _idxC != 3) or (_idxA == 3 && _idxB != 3 && _idxC == 3) or (_idxA != 3 && _idxB == 3 && _idxC == 3))then
{
   if(_slotType == 0)then {_ret = 800;};
   if(_slotType == 1)then {_ret = 1600;};
   if(_slotType == 2)then {_ret = 3200;};
};

if((_idxA == 2 && _idxB == 2 && _idxC != 2) or (_idxA == 2 && _idxB != 2 && _idxC == 2) or (_idxA != 2 && _idxB == 2 && _idxC == 2))then
{
   if(_slotType == 0)then {_ret = 700;};
   if(_slotType == 1)then {_ret = 1400;};
   if(_slotType == 2)then {_ret = 2800;};
};

if((_idxA == 1 && _idxB == 1 && _idxC != 1) or (_idxA == 1 && _idxB != 1 && _idxC == 1) or (_idxA != 1 && _idxB == 1 && _idxC == 1))then
{
   if(_slotType == 0)then {_ret = 600;};
   if(_slotType == 1)then {_ret = 1200;};
   if(_slotType == 2)then {_ret = 2400;};
};

if((_idxA == 0 && _idxB == 0 && _idxC != 0) or (_idxA == 0 && _idxB != 0 && _idxC == 0) or (_idxA != 0 && _idxB == 0 && _idxC == 0))then
{
   if(_slotType == 0)then {_ret = 500;};
   if(_slotType == 1)then {_ret = 1000;};
   if(_slotType == 2)then {_ret = 2000;};
};

_ret;