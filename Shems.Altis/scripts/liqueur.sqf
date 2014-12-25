			player setVariable ["drugInUse",true,true];
			"colorCorrections" ppEffectEnable true; 			
			"colorCorrections" ppEffectAdjust [1, 0.75, 0, [0.8,0.9,1,-0.1], [1,1,1,2], [-0.5,0,-1,5]]; 
			"colorCorrections" ppEffectCommit 10;	
			"chromAberration" ppEffectEnable true;			
			"chromAberration" ppEffectAdjust [0.05,0.05,true]; 
			"chromAberration" ppEffectCommit 10;	
			"radialBlur" ppEffectEnable true;					
			"radialBlur" ppEffectAdjust [0.02,0.02,0.15,0.15]; 
			"radialBlur" ppEffectCommit 10;	
			
			sleep (20); 
			5 fadeSound 0.1;
			player setFatigue 1;
			addCamShake [75, 40, 0.3];	
			sleep (8); 			
			addCamShake [62, 50, 0.2];	
			sleep (10); 					
			addCamShake [23, 60, 0.1];
			sleep (12); 			
			"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1], [1,1,1,1]]; 
			"colorCorrections" ppEffectCommit 10;

			"chromAberration" ppEffectAdjust [0,0,true]; 
			"chromAberration" ppEffectCommit 10;	

			"radialBlur" ppEffectAdjust [0,0,0.15,0.15]; 
			"radialBlur" ppEffectCommit 10;
			
			sleep (20); 
            resetCamShake;			
			"colorCorrections" ppEffectEnable false; 
			"chromAberration" ppEffectEnable false; 
			"radialBlur" ppEffectEnable false;			
			20 fadeSound 1;
			sleep (300);
			player setVariable ["drugInUse",false,true];
