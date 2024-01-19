void closeResources() {
    if (file.Size() > 0) {
        file.Close();
        log("File closed successfully.", LogLevel::Info, 4);
    }

    if (sock !is null && isSocketOpen) {
        sock.Close();
        log("Socket closed successfully.", LogLevel::Info, 9);
        isSocketOpen = false;
    }
}