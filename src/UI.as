string filename;

bool showInterface = true;
string currentStatus = "Idle";

bool sendDataToTheShadowRelm;

bool classificationDoesHitRoof;
int classificationLevelOfHitRoofGeneral;
int classificationLevelOfHitRoofHorisontal;

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
        UI::SameLine();
        if(UI::Button("Send Data to the Shadow Relm")) {
            sendDataToTheShadowRelm = !sendDataToTheShadowRelm;
        }
        
        UI::Separator();

        UI::InputText("Filename", filename);

        UI::InputText("General", classificationLevelOfHitRoofGeneral);
        UI::SameLine();
        UI::InputText("Horisontal Eval", classificationLevelOfHitRoofHorisontal);

        if (UI::Button("Does the dragonyeet hit the glass?")) { 
            if (classificationDoesHitRoof == true) { 
                classificationDoesHitRoof = false; 
            } else { 
                classificationDoesHitRoof = true; 
            } 
        }
        if (classificationDoesHitRoof == true) {
            UI::Text("The dragonyeet hits the glass");
        } else {
            UI::Text("The dragonyeet does not hit the glass");
        }

        UI::Text("Current filename: `" + filename + "`");

        UI::Separator();
        
        if (UI::Button("Start Recording")) { StartRecording(filename, classificationDoesHitRoof); }
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

void StartRecording(const string &in filename) {
    if (filename == "") {
        currentStatus = "No filename";
        return;
    }
    initializeFile(filename);
    currentStatus = "Recording";
}

void StopRecording() {
    currentStatus = "Idle";
}