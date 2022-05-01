if (collision_circle(x, y, 3, objWall, 0, 0)) {
		part_particles_create(objComponent_Particles.partSystem, x, y, objComponent_Particles.partType_WallHit, 1);
		global.wallHitParticles = global.default_wallHitParticles;
		instance_destroy();
}

// Стрельба возле стены, чтобы продж не ломался
if (x <= -5 && x >= room_width + 5) {
	instance_destroy();
}
if (y <= -5 && y >= room_height + 5) {
	instance_destroy();
}