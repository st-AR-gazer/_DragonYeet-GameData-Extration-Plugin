class Hitbox {
    vec3 min;
    vec3 max;
    array<vec4> sideColors;

    Hitbox(const vec3 &in _min, const vec3 &in _max, const vec4 &in baseColor) {
        min = _min;
        max = _max;
        for (uint side = 0; side < 6; side++) {
            float intensityFactor = 1.0 - side * 0.05;
            vec4 sideColor = vec4(baseColor.x * intensityFactor, baseColor.y * intensityFactor, baseColor.z * intensityFactor, baseColor.w);
            sideColors.InsertLast(sideColor);
        }
    }

    bool IsInside(const vec3 &in point) const {
        return point.x >= min.x && point.x <= max.x &&
               point.y >= min.y && point.y <= max.y &&
               point.z >= min.z && point.z <= max.z;
    }
}