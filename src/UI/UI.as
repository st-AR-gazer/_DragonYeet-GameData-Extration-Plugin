string filename;

bool showInterface = true;
string currentStatus = "Idle";

bool sendDataToTheShadowRelm;

bool classificationDoesHitRoof;
int classificationLevelOfHitRoofGeneral;
int classificationLevelOfHitRoofHorisontal;

void RenderMenu() {
	if(UI::MenuItem("\\$e44" + Icons::EllipsisH + Icons::EllipsisH + Icons::FighterJet + "\\$z" + "DragonYEETs Classifier", "", showInterface)) {
		showInterface = !showInterface;
	}
}

bool startFileEnabled;

void RenderInterface() {
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

        UI::InputInt("General", classificationLevelOfHitRoofGeneral);
        UI::SameLine();
        UI::InputInt("Horisontal Eval", classificationLevelOfHitRoofHorisontal);

        if (UI::Button("Does the dragonyeet hit the glass?")) { 
            if (classificationDoesHitRoof == true) { 
                classificationDoesHitRoof = false; 
            } else { 
                classificationDoesHitRoof = true; 
            } 
        }
        if (classificationDoesHitRoof == true) {
            UI::Text("The dragonyeet " + "\\$0f0" + "DOES "     + "\\$z" + "hit the glass");
        } else {
            UI::Text("The dragonyeet " + "\\$f00" + "DOES NOT " + "\\$z" + "hit the glass");
        }

        UI::Text("Current filename: `" + filename + "`");

        UI::Separator();
        
        if (startFileEnabled) {
            UI::BeginDisabled();
            if (UI::Button("Start Recording (file)")) { StartRecording(filename, classificationDoesHitRoof); startFileEnabled = false; }
            UI::EndDisabled();
            UI::SameLine();
            if (UI::Button("Stop Recording (file)")) { StopRecording(); startFileEnabled = true; }
        } else {
            if (UI::Button("Start Recording (file)")) { StartRecording(filename, classificationDoesHitRoof); startFileEnabled = false; }
            UI::SameLine();
            UI::BeginDisabled();
            if (UI::Button("Stop Recording (file)")) { StopRecording(); startFileEnabled = true; }
            UI::EndDisabled();
        }

        UI::Separator();

        UI::BeginDisabled();
        if (UI::Button("Open Socket")) { openSocket(); }
        UI::SameLine(); 
        if (UI::Button("Close Socket")) { closeSocket(); }

        if (UI::Button("Close Resoueces")) { closeResources(); }
        UI::EndDisabled();
        UI::End();
    }
}

void StartRecording(const string &in filename, const bool &in classificationDoesHitRoof) {
    if (filename == "") {
        currentStatus = "No filename";
        return;
    }
    initializeFile(filename);
    log("File initialized successfully.", LogLevel::Info, 78);
    currentStatus = "Recording";
    collectAndWriteData();
}

void StopRecording() {
    // if (file.IsOpen) {
    //     file.Close();
    //     log("File closed successfully.", LogLevel::Info, 86);
    // }
    file.Close();
    log("File closed successfully.", LogLevel::Info, 86);

    currentStatus = "Idle";
}

bool filenameFlag = false;

void SetFilenameFlag() {
    CTrackMania@ app = cast<CTrackMania>(GetApp());
    if(app is null) { return; }

    auto rootMap = cast<CGameCtnChallenge>(app.RootMap);
    if (rootMap is null) { return; }

    if (rootMap.MapInfo.FileName != filename) {
        filenameFlag = false;
    }

    if (!filenameFlag) {
        filename = rootMap.MapInfo.Name;
        if (filename != "") {
            filenameFlag = true;
        }
    }
}
