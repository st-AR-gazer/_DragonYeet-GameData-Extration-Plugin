class UserInterface {
    string filename;
    string classification;

    void RenderControlls() {
        UI::InputText("Filename", filename);
        UI::InputText("Classification", classification);

        if (UI::Button("Start Recording")) {
            StartRecording(filename, classification);
        }

        if (UI::Button("Stop Recording")) {
            StopRecording();
        }

        UI::Text(currentStatus);
        
        
        if (UI::Button("Open Socket")) {
            openSocket();
        }

        if (UI::Button("Close Socket")) {
            closeSocket();
        }

        if (UI::Button("Close Resoueces")) {
            closeResources();
        }
    }
}

void StartRecording(const string &in filename, const string &in classification) {
    currentStatus = "Recording";
}

void StopRecording() {
    currentStatus = "Stopped";
}

UserInterface ui;
string currentStatus = "Idle";

void UICall() {
    initializeSocket();
    
    while (true) {
        ui.Render();
        yield();
    }
}
