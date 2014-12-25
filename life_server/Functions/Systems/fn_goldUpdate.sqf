private["_goldB"];

while {true} do
{
	sleep (30 * 270);
	_goldB = gold_safe getVariable["gold",0];
	gold_safe setVariable["gold",round(_goldB+round(random 100)),true];
};