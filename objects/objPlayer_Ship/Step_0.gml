#region Movement
// Захват передвижения
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyDash = mouse_check_button(mb_right);

// Если во время движения был сделан дэш, при этом он не в кулдауне
if (keyDash && dashCooldown == 10) {
	global.playerCurrentState = playerState.dash;
	isDash = false;
}

if (global.playerCurrentState == playerState.move) {
	// Получение направления движения
	inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
	inputMagnetude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

	hSpeed = lengthdir_x(inputMagnetude * moveSpeed, inputDirection);
	vSpeed = lengthdir_y(inputMagnetude * moveSpeed, inputDirection);
	
	x += hSpeed; 
	y += vSpeed; 
	
	// Поворот  в сторону курсора
	angle += sin(degtorad(point_direction(x, y, mouse_x, mouse_y) - angle - 90)) * rotationSpeed;
}
else if (global.playerCurrentState == playerState.dash) {
	if (!isDash) {	
		if (!dashDirection_locked) {		
			// Получение x, y для направления
			x_input = keyboard_check(ord("D")) - keyboard_check(ord("A")) ;
			y_input = keyboard_check(ord("S")) - keyboard_check(ord("W")) ;
		
			dashDirection = point_direction(0, 0, x_input, y_input); 
			dashDirection_locked = true;
		
			if (x_input != 0 || y_input != 0) {
				instance_create_layer(x, y, "Inst_FX", objPlayer_Dash);
			}
		}

		if (x_input != 0 || y_input != 0) {
			// Блок управления во время дэша
			if (dashDirection_locked) {
				keyUp = 0;
				keyDown = 0;
				keyLeft = 0;
				keyRight = 0;
			}
		
			// Непосредственно сам дэш
			instance_create_layer(x, y, "Inst_FX", objPlayer_ShipGhost);
			move_contact_solid(dashDirection, dashDistance);
		
			if (dashCooldown == 0) {
				isDash = true;
				motion_set(0, 0);
				dashDirection_locked = false;
				alarm[1] = 30;
				global.playerCurrentState = playerState.move;
			}
			else {
				dashCooldown--;
			}
		}
		else {
			isDash = true;
			dashDirection_locked = false;
			dashCooldown = 10;
			global.playerCurrentState = playerState.move;
		}
	}
}

// Коллизии
x = clamp(x, 5, room_width - 5);
y = clamp(y, 18, room_height - 18);

// Legacy
// Коллизии и передвижение
//if (place_meeting(x + hSpeed, y, objWall)) {
//	while (!place_meeting(x + sign(hSpeed), y, objWall)) {
//		x += sign(hSpeed);
//	}
//	hSpeed = 0;
//}

//if (place_meeting(x, y + vSpeed, objWall)) {
//	while (!place_meeting(x , y + sign(vSpeed), objWall)) {
//		y += sign(vSpeed);
//	}
//	vSpeed = 0;
//}

#endregion
#region Laser Liner

// Лазерный прицел
var maxLength = 900;
direction = point_direction(x, y, mouse_x, mouse_y);

for (i = 0; i < maxLength; i++) {
	xEnd = x + lengthdir_x(i, direction);
	yEnd = y + lengthdir_y(i, direction);
	
	//if (collision_point(xEnd, yEnd, objWall, 0, 0)) {
	//	break;
	//}
}

#endregion
#region Attack
if (isAttack) {
	if (mouse_check_button(mb_left)) {
		scrWeapon_Attack(global.playerCurrentWeapon);
	}
}
#endregion