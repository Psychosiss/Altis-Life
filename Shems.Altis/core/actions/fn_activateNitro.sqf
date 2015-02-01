_vehicle = vehicle player;

if (_vehicle == player) exitWith {};
if (driver _vehicle != player) exitWith {};
if ((_vehicle getVariable ["nitro",0]) < 1) exitWith {};
if ((speed _vehicle) <= 10) exitWith {systemChat format ["Tu dois avancer plus vite que 10km pour utiliser le Nitro."];};

_vehicle setVariable["nitro",((_vehicle getVariable["nitro",0]) - 1),true];
_vehicle setVariable["nitroTime", time, false];
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = 20;
_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)];