class Hitbox {
    vec3 min;
    vec3 max;
    vec4 color;
    array<vec4> sideColors;

    Hitbox(const vec3 &in _min, const vec3 &in _max, const vec4 &in baseColor) {
        min = _min;
        max = _max;
        color = baseColor;
        GenerateSideColors();
    }

    bool IsInside(const vec3 &in point) const {
        return point.x >= min.x && point.x <= max.x &&
               point.y >= min.y && point.y <= max.y &&
               point.z >= min.z && point.z <= max.z;
    }

    void GenerateSideColors() {
        float intensityFactor = 0.95;
        sideColors.Resize(6);
        for (uint i = 0; i < sideColors.Length; ++i) {
            float factor = intensityFactor - i * 0.05;
            sideColors[i] = vec4(color.x * factor, color.y * factor, color.z * factor, color.w);
        }
    }
}