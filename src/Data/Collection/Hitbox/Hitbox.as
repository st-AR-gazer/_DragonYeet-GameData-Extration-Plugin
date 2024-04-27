// File: Hitbox.as
class Hitbox {
    vec3 position;
    vec3 size;
    vec4 color;

    Hitbox(const vec3 &in _pos, const vec3 &in _size, const vec4 &in _color) {
        position = _pos;
        size = _size;
        color = _color;
    }
    
    bool IsWithin(const vec3 &in point) {
        return point.x >= position.x && point.x <= position.x + size.x &&
               point.y >= position.y && point.y <= position.y + size.y &&
               point.z >= position.z && point.z <= position.z + size.z;
    }
}