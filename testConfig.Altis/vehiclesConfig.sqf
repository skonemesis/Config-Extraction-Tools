/*
	Class Name Extraction Tool
	By GhostriderDbD
	For Arma 3
	
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/		
*/

_vehiclesBase = [];
#include "vehiclesBase.sqf"
_veh = (configfile >> "CfgVehicles") call BIS_fnc_getCfgSubClasses;
//_veh sort true;
systemChat format[" _veh contains %1 entries",count _veh];
_index = 0;
_cars = [];
_boats = [];
_air = [];
_exile = 0;
_clipboard = "";
{
	if (_x isKindOf "Car" && !(_x in _vehiclesBase)) then
	{
		_cars pushback _x;
		//diag_log format["%1",_x];
		//_clipboard = _clipboard + format['"%1",%2',_x,endl];
	};
	if (_x isKindOf "Air" && !(_x in _vehiclesBase)) then
	{
		_cars pushback _x;
		//diag_log format["%1",_x];
		//_clipboard = _clipboard + format['"%1",%2',_x,endl];
	};
	if (_x isKindOf "Boat" && !(_x in _vehiclesBase)) then
	{
		_air pushback _x;
		//diag_log format["%1",_x];
		//_clipboard = _clipboard + format['"%1",%2',_x,endl];
	};	
}forEach _veh;

_clipboard = _clipboard + format["// Cars%1%2",endl,endl,endl];
{
	_clipBoard = _clipBoard + format['"%1%",%2',_x,endl]
}forEach _cars;
_clipboard = _clipboard + format["%1// Boats%2%3",endl,endl,endl];
{
	_clipBoard = _clipBoard + format['"%1%",%2',_x,endl]
}forEach _boats;
_clipboard = _clipboard + format["%1// Air%2%3",endl,endl,endl];
{
	_clipBoard = _clipBoard + format['"%1%",%2',_x,endl]
}forEach _Air;
copyToClipboard _clipboard;
