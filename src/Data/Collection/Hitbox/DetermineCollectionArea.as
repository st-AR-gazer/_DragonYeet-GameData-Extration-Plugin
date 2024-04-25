bool CheckAllHitboxes(vec3 playerPosition) {
    array<vec3> arr_boxMin = {vec3(100, 0, 50), vec3(200, 10, 200)};
    array<vec3> arr_boxMax = {vec3(150, 50, 100), vec3(250, 60, 250)};

    for (int i = 0; i < arr_boxMin.Length; i++) {
        if (IsInBox(playerPosition, arr_boxMin[i], arr_boxMax[i])) {
            if (S_shouldDraw) {
                DrawBox(arr_boxMin[i], arr_boxMax[i]);
            }
            return true;
        }
    }

    return false;
}

bool IsInDoughnut(vec3 playerPosition) {
    float mapCenterCalculation = 48 * 32 / 2;

    float mapCenterX = mapCenterCalculation;
    float mapCenterZ = mapCenterCalculation;

    float outerRadius = 1000;
    float innerRadius = 900;

    float distance = Math::Sqrt(Math::Pow(playerPosition.x - mapCenterX, 2) + Math::Pow(playerPosition.z - mapCenterZ, 2));

    return distance > innerRadius && distance < outerRadius;
}

bool IsInBox(vec3 playerPosition, vec3 boxMin, vec3 boxMax) {
    bool withinX = playerPosition.x >= boxMin.x && playerPosition.x <= boxMax.x;
    bool withinY = playerPosition.y >= boxMin.y && playerPosition.y <= boxMax.y;
    bool withinZ = playerPosition.z >= boxMin.z && playerPosition.z <= boxMax.z;

    return withinX && withinY && withinZ;
}
