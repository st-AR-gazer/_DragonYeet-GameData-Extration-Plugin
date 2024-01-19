bool isSocketOpen = false;

void initializeSocket() {
    log("Initializing socket...", LogLevel::Info, 6);

    if (isSocketOpen) {
        log("Socket is already open.", LogLevel::Info, 6);
        return;
    }

    Net::Socket@ sock = Net::Socket();
    if (!sock.Listen("127.0.0.1", 9000)) {
        log("Could not initiate server socket on port 9000.", LogLevel::Error, 12);
        return;
    } else {
        log("Server socket initiated and listening on port 9000.", LogLevel::Info, 14);
        isSocketOpen = true;
        openSocket();
    }
    return;
}

void openSocket() {
    if (!isSocketOpen) {
        log("Socket is not open.", LogLevel::Info, 6);
        return;
    }
    log("Waiting for incoming connection...", LogLevel::Info, 6);
    Net::Socket@ sock_serv = Net::Socket();
    if (!sock_serv.Listen("127.0.0.1", 9000)) { 
        log("Could not initiate server socket.", LogLevel::Error, 17); 
        return; 
    }
    log(Time::Now + ": Waiting for incoming connection...", LogLevel::Info, 18);

    while(!sock_serv.CanRead()) { yield(); }
    log("Socket can read", LogLevel::Info, 23);
    
    auto sock = sock_serv.Accept();
    log(Time::Now + ": Accepted incomming connection.", LogLevel::InfoG, 26);

    while (!sock.CanWrite()) { yield(); }
    log("Socket can write", LogLevel::Info, 31);
    log(Time::Now + ": Connected!", LogLevel::InfoG, 32);
}

void closeSocket() {
    if (sock !is null && isSocketOpen) {
        sock.Close();
        log("Socket closed.", LogLevel::Info, 22);
        isSocketOpen = false;
    }
}