void initializeFile(IO::File@ &file);
void collectAndWriteData(IO::File@ &file, Net::Socket@ &sock);
void initializeSocket(Net::Socket@ &sock);
void appendDataToFile(IO::File@ &file, CSmScriptPlayer@ api, CSceneVehicleVisState@ vehicle);
void closeResources(IO::File@ &file, Net::Socket@ &sock);

void Main() {
    IO::File@ file;
    Net::Socket@ sock;

    UICall();
    initializeFile(file);
    initializeSocket(sock);
    collectAndWriteData(file, sock);
    closeResources(file, sock);
}