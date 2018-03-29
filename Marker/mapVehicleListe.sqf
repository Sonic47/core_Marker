/*
	
	author: TF47 -SONIC-
	
	description:
		if Vehcle is on the Map it whil be but on the Map Legend.
	parameter:
		nothing
	return
		nothing
	example
		na
		
*/
TF47_core_map_marker_vehicles_marker_list_to_show =(vehicles - (allMissionObjects "WeaponHolderSimulated")-(allMissionObjects "StaticWeapon")-(allMissionObjects "Car"));
TF47_core_Marker_Vehicle_list_Pool = [];
//[
	{
		if (!(_x in TF47_core_Vehicle_no_Trackebale)) then {
			if (!(_x getVariable "TF47_core_Vehicle_Callsigne" isEqualTo"")) then {
				TF47_core_Marker_Vehicle_list_Pool pushBack _x; 
			};
		};
	}foreach TF47_core_map_marker_vehicles_marker_list_to_show;,
/*		5,
		[TF47_core_Marker_Vehicle_list_Pool]
] call CBA_fnc_addPerFrameHandler;
*/

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