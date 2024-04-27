// File: Draw.as
void DrawHitbox(const Hitbox &in hitbox) {
    vec3[] points(8);
    
    points[0] = hitbox.position;
    points[1] = hitbox.position + vec3(hitbox.size.x, 0, 0);
    points[2] = hitbox.position + vec3(0, hitbox.size.y, 0);
    points[3] = hitbox.position + vec3(0, 0, hitbox.size.z);
    points[4] = hitbox.position + vec3(hitbox.size.x, hitbox.size.y, 0);
    points[5] = hitbox.position + vec3(hitbox.size.x, hitbox.size.y, hitbox.size.z);
    points[6] = hitbox.position + vec3(0, hitbox.size.y, hitbox.size.z);
    points[7] = hitbox.position + vec3(hitbox.size.x, 0, hitbox.size.z);

    int[] edges = {0, 1,  1, 4,  4, 2,  2, 0,  // Bottom square
                3, 6,  6, 5,  5, 7,  7, 3,  // Top square
                0, 3,  1, 7,  2, 6,  4, 5}; // Vertical lines

    for (uint i = 0; i < edges.Length; i += 2) {
        if (Camera::IsBehind(points[edges[i]]) || Camera::IsBehind(points[edges[i + 1]]))
            continue;

        vec2 p1 = Camera::ToScreenSpace(points[edges[i]]);
        vec2 p2 = Camera::ToScreenSpace(points[edges[i + 1]]);

        nvg::StrokeColor(hitbox.color);
        nvg::StrokeWidth(2.0f);
        nvg::BeginPath();
        nvg::MoveTo(p1);
        nvg::LineTo(p2);
        nvg::Stroke();
    }
}

