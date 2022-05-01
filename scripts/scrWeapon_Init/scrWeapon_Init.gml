function scrWeapon_Init(weaponType){
	switch (weaponType) {
		case 101:
			attackDelay = 8;
			attackDamage = 1;
			projCount = 1;
			projLife = noone;
			projSpeed = 8;
			spreadAngleDiff = noone;
			break;
		case 102:
			attackDelay = 30;
			attackDamage = 3;
			projCount = 5;
			projLife = 35;
			projSpeed = 11.5;
			spreadAngleDiff = 8;
			break;
	}
}