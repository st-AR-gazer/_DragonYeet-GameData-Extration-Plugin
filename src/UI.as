bool showInterface = true;
string currentStatus = "Idle";

int classificationDoesHit;
int classificationLevelOfhit;

void RenderMenu() {
	if(UI::MenuItem("\\$e44" + Icons::EllipsisH + Icons::EllipsisH + Icons::FighterJet + "\\$z DragonYEETs Clasifier", "", showInterface)) {
		showInterface = !showInterface;
	}
}



void Render() {
    if (!showInterface) { return; }

    int window_flags = UI::WindowFlags::NoCollapse | UI::WindowFlags::AlwaysAutoResize | UI::WindowFlags::NoDocking;

    if (UI::Begin("DragonYEETs Classifier", showInterface, window_flags)) {
        UI::Text("Status: " + currentStatus);
        UI::InputText("Filename", filename);
        UI::Button("Does the dragonyeet hit the glass?", classificationDoesHit);
        if (classificationDoesHit == true) {
            UI::Text("The dragonyeet hits the glass");
        } else {
            UI::Text("The dragonyeet does not hit the glass");
        }

        UI::Text("Current filename: `" + filename + "`");

        UI::Separator();
        
        if (UI::Button("Start Recording")) { StartRecording(filename, classification); }
        UI::SameLine();
        if (UI::Button("Stop Recording")) { StopRecording(); }

        UI::Separator();

        if (UI::Button("Open Socket")) { openSocket(); }
        UI::SameLine(); 
        if (UI::Button("Close Socket")) { closeSocket(); }
        
        if (UI::Button("Close Resoueces")) { closeResources(); }
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
    initializeFile(filename);
    currentStatus = "Recording";
}

void StopRecording() {
    currentStatus = "Idle";
}