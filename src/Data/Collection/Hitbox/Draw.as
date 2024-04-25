void DrawLine(vec2 start, vec2 end, vec4 color) {
    nvg::StrokeColor(color);
    nvg::MoveTo(start);
    nvg::LineTo(end);
    nvg::Stroke();
}

void DrawQuad(vec2[]@ screenCorners, int i1, int i2, int i3, int i4, vec4 color) {
    nvg::FillColor(color);
    nvg::MoveTo(screenCorners[i1]);
    nvg::LineTo(screenCorners[i2]);
    nvg::LineTo(screenCorners[i3]);
    nvg::LineTo(screenCorners[i4]);
    nvg::ClosePath();
}

void DrawBox(vec3 boxMin, vec3 boxMax) {
    array<vec3> corners[8];
    corners[0] = vec3(boxMin.x, boxMin.y, boxMin.z);
    corners[1] = vec3(boxMax.x, boxMin.y, boxMin.z);
    corners[2] = vec3(boxMax.x, boxMax.y, boxMin.z);
    corners[3] = vec3(boxMin.x, boxMax.y, boxMin.z);
    corners[4] = vec3(boxMin.x, boxMin.y, boxMax.z);
    corners[5] = vec3(boxMax.x, boxMin.y, boxMax.z);
    corners[6] = vec3(boxMax.x, boxMax.y, boxMax.z);
    corners[7] = vec3(boxMin.x, boxMax.y, boxMax.z);

    array<vec2> screenCorners(8);
    for (int i = 0; i < 8; ++i) {
        if (!Camera::IsBehind(corners[i])) {
            screenCorners[i] = Camera::ToScreenSpace(corners[i]);
        }
    }

    nvg::BeginPath();
    DrawQuad(screenCorners, 0, 1, 2, 3, vec4(1.0f, 1.0f, 1.0f, 0.5f)); // White semi-transparent
    DrawQuad(screenCorners, 4, 5, 6, 7, vec4(1.0f, 0.0f, 0.0f, 0.5f)); // Red   semi-transparent

    DrawLine(screenCorners[0], screenCorners[4], vec4(0.0f, 1.0f, 0.0f, 0.5f)); // Green  semi-transparent
    DrawLine(screenCorners[1], screenCorners[5], vec4(0.0f, 0.0f, 1.0f, 0.5f)); // Blue   semi-transparent
    DrawLine(screenCorners[2], screenCorners[6], vec4(1.0f, 1.0f, 0.0f, 0.5f)); // Yellow semi-transparent
    DrawLine(screenCorners[3], screenCorners[7], vec4(0.0f, 1.0f, 1.0f, 0.5f)); // Cyan   semi-transparent
    nvg::Fill();
    nvg::Stroke();
}
