class Hitbox {
    vec3 min;
    vec3 max;
    vec4 color;

    Hitbox(const vec3 &in _min, const vec3 &in _max, const vec4 &in _color) {
        min = _min;
        max = _max;
        color = _color;
    }

    bool IsInside(const vec3 &in point) const {
        return point.x >= min.x && point.x <= max.x &&
               point.y >= min.y && point.y <= max.y &&
               point.z >= min.z && point.z <= max.z;
    }
}