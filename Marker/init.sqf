/*
	
	author: TF47  -SONIC-
	
	description:
		Handle all scripts init.
	parameter:
		nothing
	return
		nothing
	example
		na
		
*/
//[] execVM "Marker\mapMarkerInit.sqf";		// Fz Auflistung + Fz Tracker
[] execVM "Marker\Sql.sqf";					// SQL Tracker
//[] execVM "Marker\mapVehicleListe.sqf";		// Map Vehicle List (online/Offline)