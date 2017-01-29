/*
Parameter
#0: Unit
#1: marker text
#2: marker Icon


example:[this,"mil_dot","ColorBlue","Fuck",West] execVM "Marker\markerupdate.sqf";

*/

private _unit_map_marker_x = ((getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition") select 0) * 2)-250;
private _unit_map_marker_y = 150;
[{
	{
		if(_x getVariable ["TF47_core_Marker_Group_Mrkname",""] isEqualTo "")then{ 
			_x setVariable ["TF47_core_Marker_Group_Mrkname","false"]; 
		}; 

		if((_x getVariable "TF47_core_Marker_Group_Mrkname" == "false"))then{
			private _randomNumber	=	floor(random 9999);
			private _str = format ["tf47_core_map_marker_grp_%1_%2",_x,_randomNumber];
			private _mkrName = createMarkerLocal [_str,[0,0]];
			_x setVariable ["TF47_core_Marker_Group_Mrkname",_mkrName]; 
		};

	} forEach (["GetAllGroupsOfSide", [side player]] call BIS_fnc_dynamicGroups);
/*	
	{
		if (!(_x in (["GetAllGroups"] call BIS_fnc_dynamicGroups))) then {
			_x setVariable ["TF47_core_Marker_Group_Mrkname","false"];
		};
	} forEach allGroups;
*/
},
2,
[]
] call CBA_fnc_addPerFrameHandler;

[{
	{
			private _mkrName = _x getVariable "TF47_core_Marker_Group_Mrkname";
			private _grp = _x;
			private _leader = leader _x;
			private _sid = side _leader;
			
			private _col= switch (_sid) do{
				case (East):{"ColorEAST"};
				case (West):{"ColorWEST"};
				case (Independent):{"ColorGUER"};
				case (Civilian):{"ColorCIV"};
			};

			_mkrName setMarkerShapelocal "ICON";
			_mkrName setMarkerTypelocal ("mil_triangle");			
			_mkrName setMarkerColorlocal _col;
			_mkrName setMarkerTextlocal format[" %1", (groupId _grp)];
			_mkrName setMarkerPosLocal getPos _leader;
			
			if ("ItemGPS" in assigneditems player) then {
				_mkrName setMarkerAlphalocal 0.5;
			} else {
				_mkrName setMarkerAlphalocal 0;
			};

	} forEach (["GetAllGroupsOfSide", [side player]] call BIS_fnc_dynamicGroups);
	
	{
		if(!(_x getVariable "TF47_core_Marker_Group_Mrkname" == "false"))then{
			private _mkrName = _x getVariable "TF47_core_Marker_Group_Mrkname";
			deleteMarkerLocal _mkrName;
			_x setVariable ["TF47_core_Marker_Group_Mrkname","false"]; 
		};
	} forEach (allGroups - (["GetAllGroups"] call BIS_fnc_dynamicGroups));

},
5,
[]
] call CBA_fnc_addPerFrameHandler;




//////// Create Sql Liste Marker 



private _map_x = (getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition") select 0) * 2;
private _map_y = (getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition") select 1);

TF47_core_Marker_Init_Group_Marker_Pos = [(_map_x-500),_map_y,0];


_var = ["GetAllGroupsOfSide", [side player]] call BIS_fnc_dynamicGroups;

_markerName = format ["TF47_core_Marker_init_Sql_map_marker"];

_marker = createMarkerLocal [_markerName,[TF47_core_Marker_Init_Group_Marker_Pos select 0,((TF47_core_Marker_Init_Group_Marker_Pos select 1))]];
_marker setMarkerShapeLocal "ICON";  
_marker setMarkerTypeLocal "mil_triangle";
_marker setMarkerColorLocal "ColorBlue";
_marker setMarkerTextLocal "Callsigne | Leader | Freq";

[{
{
	if(_x getVariable ["TF47_core_Marker_Sql_map_list_markername",""] isEqualTo "")then{ 
		_x setVariable ["TF47_core_Marker_Sql_map_list_markername","false"]; 
	}; 

	if((_x getVariable "TF47_core_Marker_Sql_map_list_markername" == "false"))then{
		private _randomNumber	=	floor(random 9999);
		private _str = format ["TF47_core_Marker_Sql_map_list_%1_%2",_x,_randomNumber];
		private _mkrName = createMarkerLocal [_str,[0,0]];
		_x setVariable ["TF47_core_Marker_Sql_map_list_markername",_mkrName]; 
	};

} forEach (["GetAllGroupsOfSide", [side player]] call BIS_fnc_dynamicGroups);
},
2,
[]
] call CBA_fnc_addPerFrameHandler;

[{
	{
			private _mkrName = _x getVariable "TF47_core_Marker_Sql_map_list_markername";
			private _grp = _x;
			private _leader = leader _x;
			private _sid = side _leader;
			private _yoffset = ((((["GetAllGroupsOfSide", [side player]] call BIS_fnc_dynamicGroups) find (_x))+1)*150);
			
			private _col= switch (_sid) do{
				case (East):{"ColorEAST"};
				case (West):{"ColorWEST"};
				case (Independent):{"ColorGUER"};
				case (Civilian):{"ColorCIV"};
			};

			_mkrName setMarkerShapelocal "ICON";
			_mkrName setMarkerTypelocal ("mil_triangle");			
			_mkrName setMarkerColorlocal _col;
			_mkrName setMarkerTextlocal format[" %1 | %2", (groupId _grp), _leader];
			_mkrName setMarkerPosLocal [TF47_core_Marker_Init_Group_Marker_Pos select 0, (TF47_core_Marker_Init_Group_Marker_Pos select 1) - _yoffset];
			
			if ("ItemGPS" in assigneditems player) then {
				_mkrName setMarkerAlphalocal 0.5;
			} else {
				_mkrName setMarkerAlphalocal 0;
			};

	} forEach (["GetAllGroupsOfSide", [side player]] call BIS_fnc_dynamicGroups);

	{
		if(!(_x getVariable "TF47_core_Marker_Sql_map_list_markername" == "false"))then{
			private _mkrName = _x getVariable "TF47_core_Marker_Sql_map_list_markername";
			deleteMarkerLocal _mkrName;
			_x setVariable ["TF47_core_Marker_Sql_map_list_markername","false"]; 
		};
	} forEach (allGroups - (["GetAllGroups"] call BIS_fnc_dynamicGroups));
},
5,
[]
] call CBA_fnc_addPerFrameHandler;
