
string filename; // This is set in UI

void initializeFile(IO::File@ &file) {
    @file = IO::Open(filename, IO::FileMode::Write);
    if (file is null) {
        log("Could not open file for writing: " + filename, LogLevel::Error, 7);
    } else {
        log("File opened successfully for writing: " + filename, LogLevel::Info, 9);
    }
}

void collectAndWriteData(IO::File@ &file, Net::Socket@ &sock) {

    openSocket();

    float prev_speed = 0;
    float speed = 0;
	float prev_acceleration = 0;
    float acceleration = 0;
	float jerk = 0;
	bool isBraking = false;

    bool getData = true;
    while (getData) {
        CTrackMania@ app = cast<CTrackMania>(GetApp());
		if(app is null) { yield(); continue; }

		CSmArenaClient@ playground = cast<CSmArenaClient>(app.CurrentPlayground);
        if(playground is null) { yield(); continue; }
        
        CSmArena@ arena = cast<CSmArena>(playground.Arena);
        if(arena is null) { yield(); continue; }
        if(arena.Players.Length <= 0) { yield(); continue; }

        CSmPlayer@ player = arena.Players[0];
        if(player is null || arena.Players.Length == 0) { yield(); continue; }

        CSmScriptPlayer@ api = cast<CSmScriptPlayer>(player.ScriptAPI); 
        if(api is null) { yield(); continue; }

        CSceneVehicleVisState@ vehicle = VehicleState::ViewingPlayerState();
        if(vehicle is null) { yield(); continue; }

        speed = api.Speed;
        acceleration = speed - prev_speed;
        jerk = acceleration - prev_acceleration;
        prev_speed = speed;
        prev_acceleration = acceleration;
        isBraking = api.InputIsBraking;

        if (file !is null) {
            append_float_to_file(file, speed);
            append_float_to_file(file, vehicle.FrontSpeed);

            append_float_to_file(file, api.Position.x); 
            append_float_to_file(file, api.Position.y);
            append_float_to_file(file, api.Position.z);
            append_float_to_file(file, api.InputSteer);
            append_float_to_file(file, api.InputGasPedal);
            append_bool_to_file(file, isBraking);

            append_float_to_file(file, acceleration);
            append_float_to_file(file, jerk);
            
            append_float_to_file(file, api.AimYaw);
            append_float_to_file(file, api.AimPitch);
            append_float_to_file(file, api.AimRoll);

            append_float_to_file(file, vehicle.FLSteerAngle);
            append_float_to_file(file, vehicle.FRSteerAngle);

            append_float_to_file(file, vehicle.FLSlipCoef); 
            append_float_to_file(file, vehicle.FRSlipCoef);	
            
            append_float_to_file(file, api.EngineCurGear);

            yield();
        }
        /* more socket code to be added later
            if (sock !is null && isSocketOpen) {
                /*
                buf.Seek(0, 0);
                // Sending data
                append_float(buf, vehicle.FrontSpeed); // 2

                append_float(buf, api.Position.x); 
                append_float(buf, api.Position.y); // 4
                append_float(buf, api.Position.z);
                append_float(buf, api.InputSteer); // 6
                append_float(buf, api.InputGasPedal);
                append_bool(buf, isBraking); // 8

                append_float(buf, acceleration); // 10
                append_float(buf, jerk);
                
                append_float(buf, api.AimYaw); // 12
                append_float(buf, api.AimPitch);
                append_float(buf, api.AimRoll);

                append_float(buf, vehicle.FLSteerAngle);
                append_float(buf, vehicle.FRSteerAngle); // 15

                append_float(buf, vehicle.FLSlipCoef); 
                append_float(buf, vehicle.FRSlipCoef); // 17	
                
                append_float(buf, api.EngineCurGear); // 18 int


                buf.Seek(0, 0);
                cc = send_memory_buffer(sock, buf);

                yield();
            }
            */

        yield();
    }
}


void append_float_to_file(IO::File@ file, float val) {
    file.Write(string(val) + "\n");
}

void append_bool_to_file(IO::File@ file, bool val) {
    file.Write(string(val ? 1.0f : 0.0f) + "\n");
}

void append_int_to_file(IO::File@ file, int32 val) {
    file.Write(string(float(val)) + "\n");
}
