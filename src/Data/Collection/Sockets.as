bool isSocketOpen = false;

void initializeSocket() {
    log("Initializing socket...", LogLevel::Info, 4);

    if (isSocketOpen) {
        log("Socket is already open.", LogLevel::Info, 7);
        return;
    }

    Net::Socket@ sock = Net::Socket();
    if (!sock.Listen("127.0.0.1", 9000)) {
        log("Could not initiate server socket on port 9000.", LogLevel::Error, 13);
        return;
    } else {
        log("Server socket initiated and listening on port 9000.", LogLevel::Info, 16);
        isSocketOpen = true;
        openSocket();
    }
    return;
}

void openSocket() {
    if (!isSocketOpen) {
        log("Socket is not open.", LogLevel::Info, 25);
        return;
    }
    log("Waiting for incoming connection...", LogLevel::Info, 28);
    Net::Socket@ sock_serv = Net::Socket();
    if (!sock_serv.Listen("127.0.0.1", 9000)) { 
        log("Could not initiate server socket.", LogLevel::Error, 31); 
        return; 
    }
    log(Time::Now + ": Waiting for incoming connection...", LogLevel::Info, 34);

    while(!sock_serv.CanRead()) { yield(); }
    log("Socket can read", LogLevel::Info, 37);
    
    auto sock = sock_serv.Accept();
    log(Time::Now + ": Accepted incomming connection.", LogLevel::InfoG, 40);

    while (!sock.CanWrite()) { yield(); }
    log("Socket can write", LogLevel::Info, 43);
    log(Time::Now + ": Connected!", LogLevel::InfoG, 44);
}

void closeSocket() {
    if (sock !is null && isSocketOpen) {
        sock.Close();
        log("Socket closed.", LogLevel::Info, 50);
        isSocketOpen = false;
    }
}