[Setting name="Position X" min="-1200" max="2500"]
int S_positionX = 351;

[Setting name="Position Y" min="-20" max="40"]
int S_positionY = 10;

[Setting name="Position Z" min="-450" max="1950"]
int S_positionZ = -413;

[Setting name="Width" min="1" max="1000"]
int S_width = 302;

[Setting name="Height" min="1" max="350"]
int S_height = 30;

[Setting name="Length" min="1" max="1000"]
int S_length = 643;

Hitbox exampleHitbox(vec3(351, 10, -413), vec3(302, 30, 643), vec4(1, 1, 1, 1));

// South Korea (aka. South West?)
Hitbox SouthKorea_hitboxBeforeRamp(vec3(-96, -11, -414), vec3(119, 7, 117), vec4(0.10, 0.7, 0.30, 0.4));

Hitbox SouthKorea_hitboxOnRamp_Part1(vec3(-104, -11, -310), vec3(8, 7, 15), vec4(0.5, 0.8, 0.8, 0.8));
Hitbox SouthKorea_hitboxOnRamp_Part2(vec3(-112, -11, -306), vec3(8, 7, 17), vec4(0.5, 0.8, 0.8, 0.8));
Hitbox SouthKorea_hitboxOnRamp_Part3(vec3(-120, -9, -302), vec3(8, 7, 17), vec4(0.5, 0.8, 0.8, 0.8));
Hitbox SouthKorea_hitboxOnRamp_Part4(vec3(-128, -8, -296), vec3(8, 7, 17), vec4(0.5, 0.8, 0.8, 0.8));
Hitbox SouthKorea_hitboxOnRamp_Part5(vec3(-141, -7, -293), vec3(13, 8, 24), vec4(0.5, 0.8, 0.8, 0.8));

Hitbox SouthKorea_hitboxAfterRamp_Part1(vec3(-365, -7, -293), vec3(224, 34, 63), vec4(0.8, 0.6, 0.2, 0.8));
Hitbox SouthKorea_hitboxAfterRamp_Part2(vec3(-901, -1, -230), vec3(737, 45, 237), vec4(0.8, 0.6, 0.2, 0.8));

Hitbox SouthKorea_mainHitbox(vec3(-1025, -20, -6), vec3(921, 171, 760), vec4(0.93, 0.43, 0.55, 0.4));

Hitbox SouthKorea_hitboxFailed_Back(vec3(-1060, -20, -6), vec3(45, 189, 733), vec4(1, 0.2, 0.3, 0.7));
Hitbox SouthKorea_hitboxFailed_Middle(vec3(-1040, -20, 685), vec3(732, 189, 38), vec4(1, 0.3, 0.3, 0.7));
Hitbox SouthKorea_hitboxFailed_FrontSign(vec3(-318, -20, 488), vec3(36, 287, 204), vec4(1, 0.3, 0.4, 0.7));

Hitbox SouthKorea_hitboxGood_2_1(vec3(-328, 40, 401), vec3(20, 27, 56), vec4(0, 120, 0, 0.6));
Hitbox SouthKorea_hitboxGood_2_2(vec3(-328, 40, 401), vec3(20, 27, 56), vec4(0, 120, 0, 0.6));



// India (aka. South East?)
Hitbox India_hitboxBeforeRamp(vec3(-96, -11, 1824), vec3(119, 7, 117), vec4(0.90, 0.74, 0.60, 0.4));

Hitbox India_hitboxOnRamp_Part1(vec3(-104, -11, 1831), vec3(8, 7, 15), vec4(0.87, 0.67, 0.21, 0.4));
Hitbox India_hitboxOnRamp_Part2(vec3(-112, -11, 1826), vec3(8, 7, 17), vec4(0.91, 0.59, 0.81, 0.4));
Hitbox India_hitboxOnRamp_Part3(vec3(-120, -9, 1822), vec3(8, 7, 17), vec4(0.68, 0.08, 0.73, 0.4));
Hitbox India_hitboxOnRamp_Part4(vec3(-128, -8, 1817), vec3(8, 7, 17), vec4(0.57, 0.91, 0.60, 0.4));
Hitbox India_hitboxOnRamp_Part5(vec3(-141, -7, 1805), vec3(13, 8, 24), vec4(0.41, 0.35, 0.21, 0.4));

Hitbox India_hitboxAfterRamp_Part1(vec3(-365, -7, 1760), vec3(224, 34, 63), vec4(0.75, 0.71, 0.64, 0.4));
Hitbox India_hitboxAfterRamp_Part2(vec3(-901, -1, 1530), vec3(737, 45, 237), vec4(0.12, 0.15, 0.46, 0.4));

Hitbox India_mainHitbox(vec3(-1025, -20, 776), vec3(921, 171, 760), vec4(0.43, 0.14, 0.30, 0.4));





void Render() {
    int flags = UI::WindowFlags::NoTitleBar | UI::WindowFlags::AlwaysAutoResize;
    UI::SetNextWindowSize(400, 300);

    UI::Begin("Hitbox Settings", flags);
    
    S_positionX = UI::InputInt("Position X", S_positionX);
    S_positionY = UI::InputInt("Position Y", S_positionY);
    S_positionZ = UI::InputInt("Position Z", S_positionZ);
    S_width = UI::InputInt("Width", S_width);
    S_height = UI::InputInt("Height", S_height);
    S_length = UI::InputInt("Length", S_length);

    if (UI::Button("Copy to Clipboard")) {
        string settings = 
            "vec3(" + S_positionX + ", " + S_positionY + ", " + S_positionZ + "), " + "vec3(" + S_width + ", " + S_height + ", " + S_length + "),";
        IO::SetClipboard(settings);
    }

    UI::End();
}

void DrawDings() {
    // South Korea (aka. South West?)
    DrawHitbox(SouthKorea_hitboxBeforeRamp);

    DrawHitbox(SouthKorea_hitboxOnRamp_Part1);
    DrawHitbox(SouthKorea_hitboxOnRamp_Part2);
    DrawHitbox(SouthKorea_hitboxOnRamp_Part3);
    DrawHitbox(SouthKorea_hitboxOnRamp_Part4);
    DrawHitbox(SouthKorea_hitboxOnRamp_Part5);

    DrawHitbox(SouthKorea_hitboxAfterRamp_Part1);
    DrawHitbox(SouthKorea_hitboxAfterRamp_Part2);

    DrawHitbox(SouthKorea_mainHitbox);

    DrawHitbox(SouthKorea_hitboxFailed_Back);
    DrawHitbox(SouthKorea_hitboxFailed_Middle);
    DrawHitbox(SouthKorea_hitboxFailed_FrontSign);

    DrawHitbox(SouthKorea_hitboxGood_2_1);
    DrawHitbox(SouthKorea_hitboxGood_2_2);

    // India (aka. South East?)
    // DrawHitbox(India_hitboxBeforeRamp);

    // DrawHitbox(India_hitboxOnRamp_Part1);
    // DrawHitbox(India_hitboxOnRamp_Part2);
    // DrawHitbox(India_hitboxOnRamp_Part3);
    // DrawHitbox(India_hitboxOnRamp_Part4);
    // DrawHitbox(India_hitboxOnRamp_Part5);

    // DrawHitbox(India_hitboxAfterRamp_Part1);
    // DrawHitbox(India_hitboxAfterRamp_Part2);

    // DrawHitbox(India_mainHitbox);
}




// vec4(0.90, 0.74, 0.60, 0.4));
// vec4(0.45, 0.70, 0.51, 0.4));
// vec4(0.85, 0.87, 0.38, 0.4));
// vec4(0.97, 0.26, 0.26, 0.4));
// vec4(0.91, 0.74, 0.08, 0.4));
// vec4(0.55, 0.04, 0.97, 0.4));
// vec4(0.20, 0.15, 0.95, 0.4));
// vec4(0.02, 0.95, 0.88, 0.4));
// vec4(0.56, 0.98, 0.32, 0.4));
// vec4(0.93, 0.43, 0.55, 0.4));
// vec4(0.92, 0.63, 0.42, 0.4));
// vec4(0.82, 0.26, 0.46, 0.4));
// vec4(1.00, 0.18, 0.78, 0.4));
// vec4(0.94, 0.06, 0.09, 0.4));
// vec4(0.87, 0.67, 0.21, 0.4));
// vec4(0.43, 0.14, 0.30, 0.4));
// vec4(0.53, 0.94, 0.94, 0.4));
// vec4(0.76, 0.28, 0.71, 0.4));
// vec4(0.81, 0.03, 0.70, 0.4));
// vec4(0.93, 0.75, 0.94, 0.4));
// vec4(0.75, 0.71, 0.64, 0.4));
// vec4(0.12, 0.15, 0.46, 0.4));
// vec4(0.37, 0.58, 0.04, 0.4));
// vec4(0.44, 0.67, 0.20, 0.4));
// vec4(0.88, 0.78, 0.79, 0.4));
// vec4(0.70, 0.84, 0.19, 0.4));
// vec4(0.36, 0.15, 0.34, 0.4));
// vec4(0.88, 0.62, 0.97, 0.4));
// vec4(0.80, 0.07, 0.18, 0.4));
// vec4(0.27, 0.84, 0.06, 0.4));
// vec4(0.79, 0.19, 0.44, 0.4));
// vec4(0.91, 0.59, 0.81, 0.4));
// vec4(0.94, 0.20, 0.76, 0.4));
// vec4(0.11, 0.51, 0.15, 0.4));
// vec4(0.67, 0.89, 0.35, 0.4));
// vec4(0.41, 0.35, 0.21, 0.4));
// vec4(0.66, 0.73, 0.83, 0.4));
// vec4(0.42, 0.91, 0.86, 0.4));
// vec4(0.48, 0.05, 0.22, 0.4));
// vec4(0.70, 0.74, 0.11, 0.4));
// vec4(0.48, 0.34, 0.80, 0.4));
// vec4(0.23, 0.42, 0.42, 0.4));
// vec4(0.92, 0.14, 0.08, 0.4));
// vec4(0.43, 0.71, 0.14, 0.4));
// vec4(0.18, 0.95, 0.74, 0.4));
// vec4(0.95, 0.36, 0.91, 0.4));
// vec4(0.68, 0.08, 0.73, 0.4));
// vec4(0.48, 0.75, 0.81, 0.4));
// vec4(0.39, 0.11, 0.61, 0.4));
// vec4(0.57, 0.91, 0.60, 0.4));

// The Green ones
// vec4(0, 120, 0, 0.6)); a
// vec4(0, 139, 0, 0.6));
// vec4(0, 158, 0, 0.6));
// vec4(0, 177, 0, 0.6));
// vec4(0, 197, 0, 0.6));
// vec4(0, 216, 0, 0.6));
// vec4(0, 235, 0, 0.6));
// vec4(0, 255, 0, 0.6));