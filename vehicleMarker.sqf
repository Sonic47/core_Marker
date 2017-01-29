/*
Parameter
#0: Unit
#1: marker text
#2: marker Icon


example:[this,"mil_dot","ColorBlue","Fuck",West] execVM "Marker\markerupdate.sqf";

*/
sleep 20;

// Parameters
_veh = _this select 0;
_txt = "";
_typ = "mil_dot";

if(_veh getVariable ["TF47_core_Vehicle_Callsigne",""] isEqualTo "")then{ 
	_veh setVariable ["TF47_core_Vehicle_Callsigne",""]; 
}; 

_txt = _veh getVariable ["TF47_core_Vehicle_Callsigne",""];

//read config entry for empty vehicles and Difine color
private _number	=	getNumber (configFile >> "CfgVehicles" >> (typeOf _veh) >> "side");
private _sid = switch(_number)do{
	case(0):{east};
	case(1):{WEST};
	case(2):{Independent};
	case(3):{Civilian};
	default {Unknown};
};
// set Marker Color
_col= switch (_sid) do{
	case (East):{"ColorEAST"};
	case (West):{"ColorWEST"};
	case (Independent):{"ColorGUER"};
	case (Civilian):{"ColorCIV"};
};

private _pre	=	switch(_sid)do{
		case(WEST):{"b_"};
		case(EAST):{"o_"};
		case(INDEPENDENT):{"n_"};
		default{"c_"};
	};
private _main = "unknown";

if (_veh isKindOf "tank") 		then { _main	="armor" };
if (_veh isKindOf "ship" ) 		then { _main	="naval" };
if (_veh isKindOf "Helicopter") then { _main	="air" };
if (_veh isKindOf "Plane") 		then { _main	="plane" };


// Marker Name
_str = format ["mrk%1%2%3", _txt, _sid, floor(random 1000000)];

// Creat Marker 
_mrk = createMarkerLocal [_str, getPos _veh];
_mrk setMarkerShapeLocal "ICON";
_mrk setMarkerTypeLocal (_pre + _main);
_mrk setMarkerTextLocal _txt;
_mrk setMarkerColorLocal _col;

if (_veh isKindOf "car") then {
	_mrk setMarkerTypeLocal ("mil_dot");
};

// Loop 

while {(alive _veh)} do 
{
	_vhepos = getPos _veh;
	_mrk setMarkerPosLocal _vhepos;
	If (side player == _sid) then {
		// Tracking On/Off
		if (_veh getVariable ["TF47_core_Vehicle_Tracker",""]) then 
		{
			// can only be viewed inside a vehicle
			if (!(isNull objectParent player)) then {
				_mrk setMarkerAlphaLocal 1;
			} else {
				_mrk setMarkerAlphaLocal 0;
			};
		} else {
			_mrk setMarkerAlphaLocal 0;
		};
	}else{
		_mrk setMarkerAlphaLocal 0;
	};
	sleep 5;
};

	_mrk setMarkerAlphaLocal 0.3;


//Delete marker after 20 min
sleep 10;
_veh setVariable ["TF47_core_Vehicle_Tracker",false];
deleteMarker _mrk;
