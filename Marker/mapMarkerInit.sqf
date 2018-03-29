/*
	
	author: TF47  -SONIC-
	
	description:
		Core Script where it define verius stuff and initialise the tracking system where it update the legend ect.
	parameter:
		nothing
	return
		nothing
	example
		na
		
*/

TF47_core_map_marker_vehicles_to_track	=	vehicles - (allMissionObjects "WeaponHolderSimulated")-(allMissionObjects "StaticWeapon");


if !(isServer) then {
	TF47_core_map_marker_vehicles_to_track	=	vehicles - (allMissionObjects "WeaponHolderSimulated")-(allMissionObjects "StaticWeapon");
	publicVariable "TF47_core_map_marker_vehicles_to_track";
}else{
	waitUntil{!isnil "TF47_core_map_marker_vehicles_to_track"};
	{   
		private _veh = _x; 
		private _number	=	getNumber (configFile >> "CfgVehicles" >> (typeOf _veh) >> "side");
		private _sid = switch(_number)do{
			case(0):{east};
			case(1):{WEST};
			case(2):{Independent};
			case(3):{Civilian};
			default {Unknown};
		};

		TF47_core_Vehicle_no_Trackebale = ["B_Boat_Transport_01_F"];

		if (!(typeOf _veh in TF47_core_Vehicle_no_Trackebale)) then {  				// do not execut for exeptionel Vehicle
			if(_veh getVariable ["TF47_core_Vehicle_Tracker",""] isEqualTo "")then{ 
				_veh setVariable ["TF47_core_Vehicle_Tracker",false]; 
			}; 
			if (alive _veh) then {		
				if (side player == _sid) then {
					private _actionVehOn = ["TrOn", "Vehicle Tracker On", "", {params ["_target"]; _target setVariable ["TF47_core_Vehicle_Tracker",true];}, {!(_target getVariable ["TF47_core_Vehicle_Tracker",""]);}] call ace_interact_menu_fnc_createAction; 
					[_veh, 1, ["ACE_SelfActions"], _actionVehOn] call ace_interact_menu_fnc_addActionToObject; 
					private _actionVehOff = ["TrOff", "Vehicle Tracker Off", "", {params ["_target"]; _target setVariable ["TF47_core_Vehicle_Tracker",false];}, {_target getVariable ["TF47_core_Vehicle_Tracker",""];}] call ace_interact_menu_fnc_createAction; 
					[_veh, 1, ["ACE_SelfActions"], _actionVehOff] call ace_interact_menu_fnc_addActionToObject;	
				};
			};
			
			[_veh] execVM "Marker\vehicleMarker.sqf";		//  BFT Marker on vehicle 
			
			if (side player == _sid) then {	
				if !(_veh isKindOf "car") then{
					private _randomNumber	=	floor(random 30);
					private _name = vehicleVarName _veh;
					private _mkrcall = format ["tf47_core_map_marker_%1_%2",_name,_randomNumber];
					private _driverName = "N/A";
					private _callsigne = vehicleVarName _veh; //format["%1-%2",_callname, _callNumber];
					private _callSign = "default";

					//////// Air
					private _raven = ["RHS_UH60M_d","RHS_UH60M","B_Heli_Transport_01_F"];
					private _firefly = ["RHS_MELB_AH6M_H","RHS_MELB_AH6M_L","RHS_MELB_AH6M_M","B_Heli_Light_01_armed_F"];
					private _buterfly = ["RHS_MELB_MH6M","RHS_MELB_H6M"];
					private _manticore = ["RHS_AH1Z_wd"];
					private _griffin = ["RHS_UH1Y_UNARMED","RHS_UH1Y"];
					private _seagull = ["rhsusf_CH53E_USMC"];
					private _thunderbird = ["RHS_A10"];
					private _raptor = ["rhsusf_f22"];

					//////// Tank
					private _Rihno = ["B_MBT_01_cannon_F","rhsusf_m1a2sep1wd_usarmy"];
					private _lion = ["RHS_M2A3_BUSKI_wd"];

					//////// Boat
					private _shark = ["rhsusf_mkvsoc"];
					private _sumac = ["B_Boat_Armed_01_minigun_F"];
					private _number	= getNumber (configFile >> "CfgVehicles" >> (typeOf _veh) >> "side");

					private _sid = switch(_number)do{
						case(0):{east};
						case(1):{WEST};
						case(2):{Independent};
						case(3):{Civilian};
						default {Unknown};
					};
					// set Marker Color
					private _col_aktiv= switch (_sid) do{
						case (East):{"ColorEAST"};
						case (West):{"ColorWEST"};
						case (Independent):{"ColorGUER"};
						case (Civilian):{"ColorCIV"};
					};
										
					_callname = vehicleVarName _veh;
					_callNumber = (floor(random 9));
					_col_aktiv = "ColorWEST";
					
					if (typeOf _veh in _raven) then {
						_callname = "Raven";
						_callNumber = (floor(random 9))+20;
						_col_aktiv = "ColorWEST";
					};
					
					if (typeOf _veh in _firefly) then {
						_callname = "Firefly";
						_callNumber = (floor(random 9))+20;
						_col_aktiv = "ColorWEST";
					};
					if (typeOf _veh in _buterfly) then {
						_callname = "Butterfly";
						_callNumber = (floor(random 9))+20;
						_col_aktiv = "ColorWEST";
					};
					if (typeOf _veh in _manticore) then {
						_callname = "Manticore";
						_callNumber = (floor(random 9))+20;
						_col_aktiv = "ColorWEST";
					};
					if (typeOf _veh in _griffin) then {
						_callname = "Griffin";
						_callNumber = (floor(random 9))+20;
						_col_aktiv = "ColorWEST";
					};
					if (typeOf _veh in _seagull) then {
						_callname = "Seagull";
						_callNumber = (floor(random 9))+20;
						_col_aktiv = "ColorWEST";
					};
					if (typeOf _veh in _thunderbird) then {
						_callname = "Thunderbird";
						_callNumber = (floor(random 9))+30;
						_col_aktiv = "ColorWEST";
					};
					if (typeOf _veh in _raptor) then {
						_callname = "Raptor";
						_callNumber = (floor(random 9))+30;
						_col_aktiv = "ColorWEST";
					};
					if (typeOf _veh in _Rihno) then {	
						_callname = "Rihno";
						_callNumber = (floor(random 9)) + 10;
						_col_aktiv = "ColorYellow";
					};
					if (typeOf _veh in _lion) then {	
						_callname = "Lion";
						_callNumber = (floor(random 9)) + 10;
						_col_aktiv = "ColorYellow";
					};
					if (typeOf _veh in _shark) then {	
						_callname = "Shark";
						_callNumber = (floor(random 9)) + 10;
						_col_aktiv = "ColorKhaki";
					};
					if (typeOf _veh in _sumac) then {	
						_callname = "Sumac";
						_callNumber = (floor(random 9)) + 10;
						_col_aktiv = "ColorKhaki";
					};
					_callsigne = format["%1-%2",_callname, _callNumber];
					
					_veh setVariable ["TF47_core_Vehicle_Callsigne",_callsigne]; 
					_veh setVariable ["TF47_core_Vehicle_Callsigne_Color",_col_aktiv]; 
				};
			};
		};
	} foreach TF47_core_map_marker_vehicles_to_track;
	TF47_core_map_marker_vehicles_marker_list_to_show =(vehicles - (allMissionObjects "WeaponHolderSimulated")-(allMissionObjects "StaticWeapon")-(allMissionObjects "Car"));
	TF47_core_Marker_Vehicle_list_Pool = [];
	{
		if (!(_x in TF47_core_Vehicle_no_Trackebale)) then {
			if (!(_x getVariable "TF47_core_Vehicle_Callsigne" isEqualTo"")) then {
				TF47_core_Marker_Vehicle_list_Pool pushBack _x; 
			};
		};
	}foreach TF47_core_map_marker_vehicles_marker_list_to_show;

	private _map_x = (getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition") select 0) * 2;
	private _map_y = (getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition") select 1) * 2;

	TF47_core_Marker_Init_Vehicle_Marker_Pos = [(_map_x-500),(_map_y-500),0];

	_markerName = format ["TF47_core_Marker_init_Veh_map_marker"];

	_marker = createMarkerLocal [_markerName,[TF47_core_Marker_Init_Vehicle_Marker_Pos select 0,TF47_core_Marker_Init_Vehicle_Marker_Pos select 1]];
	_marker setMarkerShapeLocal "ICON";  
	_marker setMarkerTypeLocal "mil_triangle";
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTextLocal "Vehicle List";

	sleep 2;
	{		
		private _veh = _x;
		private _callsigne = _x getVariable "TF47_core_Vehicle_Callsigne";
		private _col_aktiv = _x getVariable "TF47_core_Vehicle_Callsigne_Color";
		private _randomNumber	=	floor(random 9999);
		private _str = format ["TF47_core_Marker_Vehicle_map_list_%1_%2",_callsigne,_randomNumber];

		_mkrName = createMarkerLocal [_str,[0,0]];
		_mkrName setMarkerShapelocal "ICON";
		_mkrName setMarkerTypelocal "mil_dot";			
		_mkrName setMarkerColorlocal _col_aktiv;
		_mkrName setMarkerTextlocal format[" %1", _veh];
		private _yoffset = ((((TF47_core_Marker_Vehicle_list_Pool find (_x))+1)*150));
		_mkrName setMarkerPosLocal [TF47_core_Marker_Init_Vehicle_Marker_Pos select 0, (TF47_core_Marker_Init_Vehicle_Marker_Pos select 1) - _yoffset];
		[{
			(_this select 0) params ["_mkrName", "_callsigne", "_veh", "_col_aktiv"];
			if (_veh getVariable ["TF47_core_Vehicle_Tracker",""]) then {
				if (!((name Driver _veh) isEqualTo "Error: No vehicle")) then {
					_mkrName setMarkerAlphalocal 1;
					_mkrName setMarkerColorLocal _col_aktiv;
					_mkrName setMarkerTextlocal format["%1: %2", _callsigne, name Driver _veh];
				}else{
					_mkrName setMarkerAlphalocal 1;
					_mkrName setMarkerColorLocal _col_aktiv;
					_mkrName setMarkerTextlocal format["%1: %2", _callsigne, "No Pilot"];
				};
			}else {	
				_mkrName setMarkerAlphalocal 0.3;
				_mkrName setMarkerColorLocal "ColorBlack";
				_mkrName setMarkerTextlocal format["%1: %2", _callsigne, "Offline"];
			};
		},
		5,
		[_mkrName,_callsigne,_veh,_col_aktiv]
		] call CBA_fnc_addPerFrameHandler;	
	}foreach TF47_core_Marker_Vehicle_list_Pool;
};
