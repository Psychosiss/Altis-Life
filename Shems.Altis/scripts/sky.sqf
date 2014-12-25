			player setVariable ["drugInUse",true,true];
			"colorCorrections" ppEffectEnable true; 			
			"colorCorrections" ppEffectAdjust [1, 0.6, 0, [0.5,0.6,1,-0.1], [1,1,1,5], [-0.9,0,-2,5]]; 
			"colorCorrections" ppEffectCommit 10;	
			"chromAberration" ppEffectEnable true;			
			"chromAberration" ppEffectAdjust [0.15,0.15,true]; 
			"chromAberration" ppEffectCommit 10;	
			"radialBlur" ppEffectEnable true;					
			"radialBlur" ppEffectAdjust [0.08,0.08,0.15,0.15]; 
			"radialBlur" ppEffectCommit 10;	
			
			sleep (20); 
			5 fadeSound 0.1;
			player setFatigue 1;
			addCamShake [200, 80, 0.4];	
			sleep (8); 			
			addCamShake [100, 60, 0.3];	
			sleep (10); 					
			addCamShake [50, 60, 0.2];
			sleep (12); 			
			"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1], [1,1,1,1]]; 
			"colorCorrections" ppEffectCommit 10;

			"chromAberration" ppEffectAdjust [0,0,true]; 
			"chromAberration" ppEffectCommit 10;	

			"radialBlur" ppEffectAdjust [0,0,0.15,0.15]; 
			"radialBlur" ppEffectCommit 10;
			
			sleep (40); 
            resetCamShake;			
			"colorCorrections" ppEffectEnable false; 
			"chromAberration" ppEffectEnable false; 
			"radialBlur" ppEffectEnable false;			
			20 fadeSound 1;
			sleep (360);
			player setVariable ["drugInUse",false,true];