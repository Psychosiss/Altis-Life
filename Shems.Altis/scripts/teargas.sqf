While{true} do 
{
    "dynamicBlur" ppEffectEnable true;
    "dynamicBlur" ppEffectAdjust [0];
    "dynamicBlur" ppEffectCommit 15;
    resetCamShake;
    20 fadeSound 1;
    waituntil {((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10) and (getpos (nearestObject [getpos player, "SmokeShellYellow"]) select 2 < 0.5)};
    if (headgear player != "H_CrewHelmetHeli_B") then
    {
        "dynamicBlur" ppEffectEnable true;
        "dynamicBlur" ppEffectAdjust [20];
        "dynamicBlur" ppEffectCommit 3;
        enableCamShake true;
        addCamShake [10, 45, 10];
        player setFatigue 1;
        5 fadeSound 0.1;
    };
    sleep 5;
};