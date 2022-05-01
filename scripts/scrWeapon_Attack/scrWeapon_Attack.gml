function scrWeapon_Attack(weaponType){
	switch (weaponType) {
			// Default
			case 101:
				instance_create_layer(x, y, "Inst_Base", objPlayer_Swoosh);
				var inst = instance_create_layer(x, y, "Inst_Base", objPlayer_BulletDefault);
				with (inst) {     
                    direction = objPlayer_Ship.direction;  
                    speed = objPlayer_Ship.projSpeed;   
					image_angle = direction - 90;
				}
				isAttack = false;
				alarm[0] = attackDelay;
			break;
			// Shotgun
			case 102:
				instance_create_layer(x, y, "Inst_Base", objPlayer_Swoosh);
				for (i = 0; i != projCount; i++) {
					var inst = instance_create_layer(x, y, "Inst_Base", objPlayer_BulletShotgun);
					var newDir = random_range(direction - spreadAngleDiff, direction + spreadAngleDiff);
					
					with (inst) {     
                        direction = newDir;  
                        speed = objPlayer_Ship.projSpeed - random_range(1, 2);   
						image_angle = direction - 90;
					}
				}
				isAttack = false;
				alarm[0] = attackDelay;
			break;
	}
}