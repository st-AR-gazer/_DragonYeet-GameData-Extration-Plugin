// void initializeFile(IO::File@ &file);
// void collectAndWriteData(IO::File@ &file, Net::Socket@ &sock);
// void initializeSocket(Net::Socket@ &sock);
// void appendDataToFile(IO::File@ &file, CSmScriptPlayer@ api, CSceneVehicleVisState@ vehicle);
// void closeResources(IO::File@ &file, Net::Socket@ &sock);

IO::File file;
Net::Socket@ sock;

void Main() {
    UICall();
    initializeFile();
    initializeSocket();

    log("Starting data collection");
    return;
    //collectAndWriteData();
    //closeResources();
}