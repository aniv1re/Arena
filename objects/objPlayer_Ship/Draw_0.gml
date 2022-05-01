// Отрисовка лазерного прицела
if (isLaserEnabled) {
	draw_set_alpha(.2);
	draw_line_width_color(x - 1, y, xEnd, yEnd, 3, c_red, c_red);
	draw_set_alpha(1);
}

// Отрисовка спрайта отдельно, чтобы избежать поворота маски коллизий
draw_sprite_ext(sprShip_Base, 0, x, y, 1, 1, angle, -1, 1);

// Отображение коллизии в дебаг-моде
if (global.isDebugMode) {
	draw_sprite_ext(sprShip_CollisionMask, 0, x, y, 1, 1, 0, c_red, .5);
}