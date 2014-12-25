private ["_this", "_ret"];

_ret = 	if (typeName _this != typeName "") then 
{
	-1;
} else {
	count (toArray(_this));
};
_ret;