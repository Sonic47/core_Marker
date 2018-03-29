/*
	
	author: TF47 -SONIC-
	
	description:
		Aplly Frequenz on Btn click.
	parameter:
		nothing
	return
		nothing
	example
		na
		
*/

disableSerialization; 

params ["_ctrl"];

private _editIntern = (ctrlParent _ctrl) displayCtrl 1400;

private _textIntern = ctrlText _editIntern;

group player setVariable ["TF47_core_Marker_Sql_Freq_Intern",_textIntern];

closeDialog 0;