
void initializeFile(string filename) {
    file.Open(IO::FromStorageFolder("DragonYEET Saves/" + filename), IO::FileMode::Write);
    log("File opened successfully for writing: `" + filename + "`", LogLevel::Info, 9);
    string headers = "Speed, FrontSpeed, PosX, PosY, PosZ, InputSteer, InputGasPedal, IsBraking, Acceleration, Jerk, AimYaw, AimPitch, AimRoll, FLSteerAngle, FRSteerAngle, FLSlipCoef, FRSlipCoef, EngineCurGear\n";
    file.Write(headers);
}


void collectAndWriteData() {

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
        isBraking = vehicle.InputIsBraking;

        if (file.Size() > 0) {
            append_float_to_file(speed);
            append_float_to_file(vehicle.FrontSpeed);

            append_float_to_file(vehicle.Position.x); 
            append_float_to_file(vehicle.Position.y);
            append_float_to_file(vehicle.Position.z);
            append_float_to_file(vehicle.InputSteer);
            append_float_to_file(vehicle.InputGasPedal);
            append_bool_to_file(isBraking);

            append_float_to_file(acceleration);
            append_float_to_file(jerk);
            
            append_float_to_file(api.AimYaw);
            append_float_to_file(api.AimPitch);
            append_float_to_file(api.AimRoll);

            append_float_to_file(vehicle.FLSteerAngle);
            append_float_to_file(vehicle.FRSteerAngle);

            append_float_to_file(vehicle.FLSlipCoef); 
            append_float_to_file(vehicle.FRSlipCoef);	
            
            append_float_to_file(api.EngineCurGear);

            file.Write("\n");

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


void append_float_to_file(float val) {
    file.Write(string("" + val) + ", ");
}

void append_bool_to_file(bool val) {
    if (val) {
        file.Write("1, ");
    } else {
        file.Write("0, ");
    }
}

// void append_int_to_file(IO::File file, int32 val) {
//     file.Write(string(float(val)) + ", ");
// }
