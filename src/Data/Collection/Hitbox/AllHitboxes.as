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

[Setting name="ColorR"]
float S_colorR = 0.4;

[Setting name="ColorG"]
float S_colorG = 0.4;

[Setting name="ColorB"]
float S_colorB = 0.4;

[Setting name="ColorA"]
float S_colorA = 0.4;

// Is done in Update() in Main.as
Hitbox exampleHitbox(vec3(S_positionX, S_positionY, S_positionZ), vec3(S_width, S_height, S_length), vec3(S_rotationX, S_rotationY, S_rotationZ), vec4(S_colorR, S_colorG, S_colorB, S_colorA));

// South Korea (aka. South West?)
Hitbox SouthKorea_hitboxBeforeRamp(vec3(-66, -8, -334), vec3(76, 7, 43), vec3(0, 23, 0), vec4(1, 0, 1, 0.7));
Hitbox SouthKorea_hitboxOnRamp(vec3(-116, -3, -294), vec3(49, 15, 12), vec3(0, 28, 0), vec4(1, 0, 1, 0.7));

Hitbox SouthKorea_hitboxFailZone_Back(vec3(-1042, 100, 232), vec3(33, 335, 531), vec3(0, 0, 0), vec4(1, 0, 0, 0.7));
Hitbox SouthKorea_hitboxFailZone_BackSideStadiumDiagonal(vec3(-718, 100, -190), vec3(45, 335, 761), vec3(0, -58, 0), vec4(1, 0, 0, 0.7));
Hitbox SouthKorea_hitboxFailZone_FrontSideStadiumDiagonal(vec3(-323, 100, 89), vec3(489, 350, 33), vec3(0, 10, 0), vec4(1, 0, 0, 0.7));
Hitbox SouthKorea_hitboxFailZone_Middle(vec3(-661, 100, 539), vec3(809, 335, 33), vec3(0, -10, 0), vec4(1, 0, 0, 0.7));

// India (aka. South East?)
Hitbox India_hitboxBeforeRamp(vec3(-66, -8, 1869), vec3(76, 7, 43), vec3(0, -23, 0), vec4(1, 0, 1, 0.7));
Hitbox India_hitboxOnRamp(vec3(-116, -3, 1829), vec3(49, 15, 12), vec3(0, -28, 0), vec4(1, 0, 1, 0.7));

Hitbox India_hitboxFailZone_Back(vec3(-1042, 100, 1332), vec3(33, 335, 531), vec3(0, 0, 0), vec4(1, 0, 0, 0.7));
Hitbox India_hitboxFailZone_BackSideStadiumDiagonal(vec3(-718, 100, 1754), vec3(45, 335, 761), vec3(0, 58, 0), vec4(1, 0, 0, 0.7));
Hitbox India_hitboxFailZone_FrontSideStadiumDiagonal(vec3(-323, 100, 1463), vec3(489, 350, 33), vec3(0, -10, 0), vec4(1, 0, 0, 0.7));
Hitbox India_hitboxFailZone_Middle(vec3(-661, 100, 1020), vec3(809, 335, 33), vec3(0, 10, 0), vec4(1, 0, 0, 0.7));



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

    S_colorR = UI::InputFloat("ColorR", S_colorR);
    S_colorG = UI::InputFloat("ColorG", S_colorG);
    S_colorB = UI::InputFloat("ColorB", S_colorB);
    S_colorA = UI::InputFloat("ColorA", S_colorA);

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
    DrawHitbox(SouthKorea_hitboxOnRamp);

    DrawHitbox(SouthKorea_hitboxFailZone_Back);
    DrawHitbox(SouthKorea_hitboxFailZone_BackSideStadiumDiagonal);
    DrawHitbox(SouthKorea_hitboxFailZone_FrontSideStadiumDiagonal);
    DrawHitbox(SouthKorea_hitboxFailZone_Middle);



    // India (aka. South East?)
    DrawHitbox(India_hitboxBeforeRamp);
    DrawHitbox(India_hitboxOnRamp);

    DrawHitbox(India_hitboxFailZone_Back);
    DrawHitbox(India_hitboxFailZone_BackSideStadiumDiagonal);
    DrawHitbox(India_hitboxFailZone_FrontSideStadiumDiagonal);
    DrawHitbox(India_hitboxFailZone_Middle);


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