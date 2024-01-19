// void initializeFile(IO::File@ &file);
// void collectAndWriteData(IO::File@ &file, Net::Socket@ &sock);
// void initializeSocket(Net::Socket@ &sock);
// void appendDataToFile(IO::File@ &file, CSmScriptPlayer@ api, CSceneVehicleVisState@ vehicle);
// void closeResources(IO::File@ &file, Net::Socket@ &sock);

IO::File file;
Net::Socket@ sock;

void Main() {
    log("Starting data collection");
    //collectAndWriteData();
    //closeResources();
}

bool filenameFlag = false;

void Update(float dt) {
    CTrackMania@ app = cast<CTrackMania>(GetApp());
    if(app is null) { return; }

    auto rootMap = cast<CGameCtnChallenge>(app.RootMap);
    if (rootMap is null) { return; }
    if (filenameFlag) { filenameFlag = false; return; }
    filename = rootMap.MapInfo.FileName;
    if (filename != "") {
        filenameFlag = true;
    }
}