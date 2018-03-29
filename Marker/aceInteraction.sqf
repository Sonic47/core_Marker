/*
	
	author: TF47  SONIC
	
	description:
		Tracking Systeme in Ace Interaction.
	parameter:
		nothing
	return
		nothing
	example
		na
		
*/
private _veh = _this select 0;
private _number	=	getNumber (configFile >> "CfgVehicles" >> (typeOf _veh) >> "side");
private _sid = switch(_number)do{
	case(0):{east};
	case(1):{WEST};
	case(2):{Independent};
	case(3):{Civilian};
	default {Unknown};
};
			
if (side player == _sid) then {
	private _actionVehOn = ["TrOn", "Vehicle Tracker On", "", {params ["_target"]; _target setVariable ["TF47_core_Vehicle_Tracker",true];}, {!(_target getVariable ["TF47_core_Vehicle_Tracker",""]);}] call ace_interact_menu_fnc_createAction; 
	[_veh, 1, ["ACE_SelfActions"], _actionVehOn] call ace_interact_menu_fnc_addActionToObject; 
	private _actionVehOff = ["TrOff", "Vehicle Tracker Off", "", {params ["_target"]; _target setVariable ["TF47_core_Vehicle_Tracker",false];}, {_target getVariable ["TF47_core_Vehicle_Tracker",""];}] call ace_interact_menu_fnc_createAction; 
	[_veh, 1, ["ACE_SelfActions"], _actionVehOff] call ace_interact_menu_fnc_addActionToObject;	
};