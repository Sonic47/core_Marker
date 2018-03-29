/*
	
	author: TF47 -SONIC-
	
	description:
		Frequenz Dialod.
	parameter:
		nothing
	return
		nothing
	example
		na
		
*/

class tf47_core_marker_sql_set_freq
{
	idd = -1;
	movingEnable = 0;
	onLoad = "_this execVM 'Marker\Dialog\onLoadDialog.sqf';";
	onUnLoad = "";
	class ControlsBackground
	{
		class Main_Background: TF47_core_Marker_RscText
		{
			idc = 1000;

			x = 0.4175 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.1584 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class Title_Background: TF47_core_Marker_RscText
		{
			idc = 1001;

			text = "Frequenz Menu"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,0.4,0.8};
		};
		class Txt_intern: TF47_core_Marker_RscText
		{
			idc = 1003;

			text = "Interne"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
	class Controls
	{
		class Txt_grp_freq: TF47_core_Marker_RscText
		{
			idc = 1405;

			text = "Frequenz der Gruppe"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Edit_Intern_freq_grp: TF47_core_Marker_RscEdit
		{
			idc = 1400;

			text = "Intern Freq"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Btn_close: TF47_core_Marker_RscButton
		{
			idc = 1601;
			action = "closeDialog 0;";

			text = "Close"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.4692 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,0.4,0.8};
		};
		class Btn_apply: TF47_core_Marker_RscButton
		{
			idc = 1600;
			onButtonClick = "_this execVM 'Marker\Dialog\Apply.sqf';";

			text = "Apply"; //--- ToDo: Localize;
			x = 0.497937 * safezoneW + safezoneX;
			y = 0.4692 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,0.4,0.8};
		};
	};
};

