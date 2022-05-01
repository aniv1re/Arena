if (global.isDebugMode) {
	//draw_text(objPlayer_Ship.x + 15, objPlayer_Ship.y, );
	draw_text_transformed(objPlayer_Ship.x + 10, objPlayer_Ship.y, "currentHealth:" + string(global.playerCurrentHearts), .5, .5, 0)
	draw_text_transformed(objPlayer_Ship.x + 10, objPlayer_Ship.y + 8, "dashCooldown:" + string(objPlayer_Ship.dashCooldown), .5, .5, 0)
	draw_text_transformed(objPlayer_Ship.x + 10, objPlayer_Ship.y + 16, "playerCurrentState:" + string(global.playerCurrentState), .5, .5, 0)
	draw_text_transformed(objPlayer_Ship.x + 10, objPlayer_Ship.y + 22, "playerWeapon:" + string(global.playerCurrentWeapon), .5, .5, 0)
}