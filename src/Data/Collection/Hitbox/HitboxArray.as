array<Hitbox> hitboxes;

void InitializeHitboxes() {
    hitboxes.InsertLast(Hitbox(vec3(100, 40, 100), vec3(200, 40, 200), vec4(1, 0, 0, 0.5))); // Red
    hitboxes.InsertLast(Hitbox(vec3(300, 40, 100), vec3(500, 40, 200), vec4(0, 1, 0, 0.5))); // Green
}

bool IsPlayerInAnyHitbox(const vec3 &in playerPosition) {
    for (uint i = 0; i < hitboxes.Length; ++i) {
        if (hitboxes[i].IsInside(playerPosition)) {
            return true;
        }
    }
    return false;
}