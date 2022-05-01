// Отрисовка сердец
for (i = 0; i != global.playerMaxHearts; i++) {
	draw_sprite_ext(sprHeart_Blank, 0, 585 - i * 45, 85, 3, 3, 0, -1, 1);
}

for (i = 0; i != global.playerCurrentHearts; i++) {
	draw_sprite_ext(sprHeart_Filled, 0, 585 - i * 45, 85, 3, 3, 0, -1, 1);
}


draw_sprite_ext(sprHeart_Icon, 0, 635, 85, 3, 3, 0, -1, 1);