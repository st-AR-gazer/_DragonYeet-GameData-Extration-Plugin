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

    for (uint i = 0; i < corners.Length; ++i) {
        vec2 screenPos = Camera::ToScreenSpace(corners[i]);
        if (i == 0) {
            nvg::MoveTo(screenPos);
        } else {
            nvg::LineTo(screenPos);
        }
    }

    nvg::ClosePath();

    nvg::StrokeColor(hitbox.color);

    nvg::Stroke();
}

void RenderHitboxes(const array<Hitbox> &in hitboxes) {
    for (uint i = 0; i < hitboxes.Length; ++i) {
        DrawHitbox(hitboxes[i]);
    }
}