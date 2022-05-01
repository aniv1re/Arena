partSystem = part_system_create();

global.default_wallHitParticles = 15;
global.wallHitParticles = global.default_wallHitParticles;

partType_WallHit = part_type_create();
part_type_sprite(partType_WallHit, sprWallHit, 0, 0, 0);
part_type_life(partType_WallHit, 15, 25);
part_type_size(partType_WallHit, 1, 1, -0.01, 0);
part_type_alpha3(partType_WallHit, 1, 0.5, 0.2);
part_type_direction(partType_WallHit, 0, 360, 10, 10);