/*
 * Author: Glowbal
 * Ask for the latest wound information.
 *
 * Arguments:
 * 0: The target <OBJECT>
 * 1: object belonging to the caller <OBJECT>
 *
 * ReturnValue:
 * None
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [ "_target", "_caller"];

if (local _target || GVAR(level) < 2) exitwith {}; // if the target is local, we already got the most update to date information
if (_target getvariable [QGVAR(isWoundSynced), false]) exitwith {};
_target setvariable [QGVAR(isWoundSynced), true];
["medical_woundUpdateRequest", [_target], [_target, _caller]] call EFUNC(common,targetEvent);
