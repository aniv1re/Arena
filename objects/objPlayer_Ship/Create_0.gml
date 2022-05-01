#region Movement var.

enum playerState {
	move = 201,
	dash = 202,
	freeze = 203
}

global.playerCurrentState = playerState.move;

hSpeed = 0;
vSpeed = 0;
moveSpeed = 3;
rotationSpeed = 25;
angle = 0;

#endregion
#region Laser stuff var.

isLaserEnabled = true;
xEnd = 0;
yEnd = 0;

#endregion
#region Attack var.

// Виды оружия
enum weapons {
	defaultWeapon = 101,
	shotgunWeapon = 102
}
	
isAttack = true;
global.playerCurrentWeapon = 102;

// Характеристики оружия
scrWeapon_Init(global.playerCurrentWeapon)

#endregion
#region Dash var.

dashCooldown = 10;
dashDistance = 6;
isDash = false;
dashDirection = 0;
dashDirection_locked = false;

#endregion