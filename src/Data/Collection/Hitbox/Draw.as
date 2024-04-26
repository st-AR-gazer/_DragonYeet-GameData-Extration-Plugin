void DrawHitbox(const Hitbox &in hitbox) {
    if (Camera::IsBehind(hitbox.min) && Camera::IsBehind(hitbox.max)) {
        return;
    }

    array<vec3> corners = {
        hitbox.min,
        vec3(hitbox.max.x, hitbox.min.y, hitbox.min.z),
        hitbox.max,
        vec3(hitbox.min.x, hitbox.max.y, hitbox.max.z),
        vec3(hitbox.min.x, hitbox.min.y, hitbox.max.z),
        vec3(hitbox.max.x, hitbox.max.y, hitbox.min.z),
        vec3(hitbox.min.x, hitbox.max.y, hitbox.min.z),
        vec3(hitbox.max.x, hitbox.min.y, hitbox.max.z)
    };

    nvg::BeginPath();

    InitializeSidesArray();

    float intensityFactor = 0.95;

    for (uint i = 0; i < sides.length(); ++i) {
        vec2 screenPos1 = Camera::ToScreenSpace(corners[sides[i][0]]);
        vec2 screenPos2 = Camera::ToScreenSpace(corners[sides[i][1]]);

        float factor = intensityFactor + (i % sides[i].length()) * 0.05;
        vec4 sideColor = vec4(hitbox.sideColors[0].x * factor, hitbox.sideColors[0].y * factor, hitbox.sideColors[0].z * factor, hitbox.sideColors[0].w);

        nvg::BeginPath();
        nvg::MoveTo(screenPos1);
        nvg::LineTo(screenPos2);
        nvg::StrokeColor(sideColor);
        nvg::Stroke();
    }
}

array<array<int>> sides(12);

void InitializeSidesArray() {
    sides[0] = {0, 1}; // Bottom
    sides[1] = {1, 3}; // Bottom
    sides[2] = {3, 2}; // Bottom
    sides[3] = {2, 0}; // Bottom
    sides[4] = {4, 5}; // Top
    sides[5] = {5, 7}; // Top
    sides[6] = {7, 6}; // Top
    sides[7] = {6, 4}; // Top
    sides[8] = {0, 4}; // Vertical sides
    sides[9] = {1, 5}; // Vertical sides
    sides[10] = {3, 7}; // Vertical sides
    sides[11] = {2, 6}; // Vertical sides
}

void RenderHitboxes(const array<Hitbox> &in hitboxes) {
    for (uint i = 0; i < hitboxes.Length; ++i) {
        DrawHitbox(hitboxes[i]);
    }
}