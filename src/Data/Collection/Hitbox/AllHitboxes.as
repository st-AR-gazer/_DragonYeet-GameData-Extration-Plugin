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

[Setting name="Rotation X" min="-180" max="180"]
int S_rotationX = 0;

[Setting name="Rotation Y" min="-180" max="180"]
int S_rotationY = 0;

[Setting name="Rotation Z" min="-180" max="180"]
int S_rotationZ = 0;

Hitbox exampleHitbox(vec3(S_positionX, S_positionY, S_positionZ), vec3(S_width, S_height, S_length), vec3(S_rotationX, S_rotationY, S_rotationZ), vec4(1, 1, 1, 1));

// South Korea (aka. South West?)
Hitbox SouthKorea_hitboxBeforeRamp(vec3(-96, -11, -414), vec3(119, 7, 117), vec3(0, 0, 0), vec4(0.10, 0.7, 0.30, 0.4));



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
    S_rotationX = UI::InputInt("Rotation X", S_rotationX);
    S_rotationY = UI::InputInt("Rotation Y", S_rotationY);
    S_rotationZ = UI::InputInt("Rotation Z", S_rotationZ);

    if (UI::Button("Copy to Clipboard")) {
        string settings = 
            "vec3(" + S_positionX + ", " + S_positionY + ", " + S_positionZ + "), " + "vec3(" + S_width + ", " + S_height + ", " + S_length + "), " + "vec3(" + S_rotationX + ", " + S_rotationY + ", " + S_rotationZ + "), ";
        IO::SetClipboard(settings);
    }

    UI::End();
}

void DrawDings() {
    DrawHitbox(exampleHitbox);

    // South Korea (aka. South West?)
    DrawHitbox(SouthKorea_hitboxBeforeRamp);







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