/*
	
	author: TF47 -SONIC-
	
	description:
		load when Frequenz Dialog is open.
	parameter:
		nothing
	return
		nothing
	example
		na
		
*/

disableSerialization; 

params ["_display"];

private _editIntern = (_display displayCtrl 1400);

_freqIntern = "Intern Frequenz";

if (!(group player getVariable "TF47_core_Marker_Sql_Freq_Intern" isEqualTo "")) then{
	_freqIntern = group player getVariable "TF47_core_Marker_Sql_Freq_Intern";
};

_editIntern ctrlSetText format ["%1",_freqIntern];

private _editTitle = (_display displayCtrl 1405);

_txt = format ["Frequenz von %1",groupId group player];

_editTitle ctrlSetText format ["%1",_txt];
