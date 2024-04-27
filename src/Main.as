// void initializeFile(IO::File@ &file);
// void collectAndWriteData(IO::File@ &file, Net::Socket@ &sock);
// void initializeSocket(Net::Socket@ &sock);
// void appendDataToFile(IO::File@ &file, CSmScriptPlayer@ api, CSceneVehicleVisState@ vehicle);
// void closeResources(IO::File@ &file, Net::Socket@ &sock);

IO::File file;
Net::Socket@ sock;

void Main() {
    // log("Starting data collection");
    //collectAndWriteData();
    //closeResources();
}

// Correct Update function
void Update(float dt) {
    // Correct instantiation of a Hitbox object
    DrawHitbox(exampleHitbox);


    // Correct instantiation of a Hitbox object


    CTrackMania@ app = cast<CTrackMania>(GetApp());
    if (app is null) return;
    // 

    auto playground = cast<CSmArenaClient>(app.CurrentPlayground);
    if (playground is null || playground.Arena.Players.Length == 0) { return; }

    auto scene = cast<ISceneVis@>(app.GameScene);
    if (scene is null) return;

    CSceneVehicleVis@ vis;
    auto player = cast<CSmPlayer@>(playground.GameTerminals[0].GUIPlayer);
    if (player !is null) {
        @vis = VehicleState::GetVis(scene, player);
    } else {
        @vis = VehicleState::GetSingularVis(scene);
    }
    if (vis is null) return;

    // CheckAllHitboxes(vis.AsyncState.Position);
    // SetFilenameFlag();

    
}
