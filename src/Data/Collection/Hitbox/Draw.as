// File: Draw.as
void DrawHitbox(const Hitbox &in hitbox) {
    array<vec3> points = hitbox.GetTransformedPoints();

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