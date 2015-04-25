life_life_airdrop_helicopter_main = "B_Heli_Transport_03_unarmed_F";
life_life_airdrop_helicopter_scnd = "B_Heli_Attack_01_F";
life_airdrop_chance = 10;
life_airdrop_positions = [[6224.38,11925.8,0.00156784],[7592,13856,0.00119019],[10018,12119.2,0.00144005],[9122.34,17830.7,0.00247192]];
_airdrop_time_interval = [1,4];
life_airdrop_time_min = _airdrop_time_interval select 0;
life_airdrop_time_max = _airdrop_time_interval select 1;
life_airdrop_time_min = life_airdrop_time_min*3600;
life_airdrop_time_max = life_airdrop_time_max*3600;

if (life_airdrop_time_min >= life_airdrop_time_max) exitWith {life_airdrop_enable = false;};
life_airdrop_enable = true;
life_airdrop_goingon = false;