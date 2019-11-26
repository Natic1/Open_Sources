/*
  Author: Simon "Natic" Maddahi
  Date: 26.11.2019
  
  ### System is not finished ###
*/
params [
        ["_control"],
        ["_pin","",[""]],
        ["_wire","",[""]],
        ["_time","",[""]]
];
private ["_position"];

createDialog "NC_plantBomb";
_control = findDisplay 100;
_pin = _control ctrl 101;
_wire = _control ctrl 102;
_time = _control ctrl 103;
_position = getPos player;

if (_pin isEqualTo "") exitWith {hint "You need too enter a PIN";};
if (_wire isEqualTo "") exitWith {hint "You need too choose a Wire";};
if (_time isEqualTo "") exitWith {hint "You need too enter a time";};
if (_time < 5) exitWith {hint "the minimum time is 5 Minutes";};
if (playerside == civilian) then {
    _time = "5"; //Minimum Timer 5 Minutes 
};
if (playerside == independent) exitWith {hint "You cant plant a Bomb!";};

//toDo: Create Timer GUI
[1, "A Bomb was planted on the following Cords: %1", _position] remoteExec ["life_fnc_Broadcast", 2];

[_pin, _wire, _time] remoteExec ["life_fnc_defuseBomb", 1];
