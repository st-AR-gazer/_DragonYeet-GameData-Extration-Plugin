bool showInterface = true;
string currentStatus = "Idle";


void RenderMenu() {
	if(UI::MenuItem("\\$e44" + Icons::EllipsisH + Icons::EllipsisH + Icons::FighterJet + "\\$z DragonYEETs Clasifier", "", showInterface)) {
		showInterface = !showInterface;
	}
}


string classification;

void Render() {
    if (!showInterface) { return; }

    int window_flags = UI::WindowFlags::NoCollapse | UI::WindowFlags::AlwaysAutoResize | UI::WindowFlags::NoDocking;

    if (UI::Begin("DragonYEETs Classifier", showInterface, window_flags)) {
        UI::Text("Status: " + currentStatus);
        UI::InputText("Filename", filename);
        UI::InputText("Classification", classification);

        UI::Separator();
        
        if (UI::Button("Start Recording")) {
            StartRecording(filename, classification);
        }
        UI::SameLine();
        if (UI::Button("Stop Recording")) {
            StopRecording();
        }

        UI::Separator();

        if (UI::Button("Open Socket")) { openSocket(); }
        UI::SameLine(); 
        if (UI::Button("Close Socket")) { closeSocket(); }
        
        if (UI::Button("Close Resoueces")) {
            closeResources();
        }
        UI::End();
    }
}

void StartRecording(const string &in filename, const string &in classification) {
    if (filename == "") {
        currentStatus = "No filename";
        return;
    }
    if (classification == "") {
        currentStatus = "No classification";
        return;
    }
    currentStatus = "Recording";
}

void StopRecording() {
    currentStatus = "Idle";
}


void UICall() {
    // initializeSocket();
    
    while (true) {
        // ui.Render();
        yield();
    }
}
