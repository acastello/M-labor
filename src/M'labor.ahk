;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

toggle1 = 1
getkeystate, state, ScrollLock, T

return

Esc::
if (state = "D")
	ControlSend,,{Esc}, - Arch
else
	sendplay {%A_ThisHotKey%}
return
f::
g::
h::
if (state = "D")
	ControlSend,,%A_ThisHotKey%, - Arch
else
	sendplay %A_ThisHotKey%
return

q::
w::
e::
a::
s::
d::
if (state = "D")
	ControlSend,,{%A_ThisHotKey% Down}, - Arch
else
	sendplay {%A_ThisHotKey% Down}
return

q Up::
w Up::
e Up::
a Up::
s Up::
d Up::
	StringLeft, ThisKey, A_ThisHotKey, 1
if (state = "D"){
	ControlSend,,{%ThisKey% Up}, - Arch
}
else
	sendplay {%ThisKey% Up}
return


F1::
if (state = "D"){
	toggle1 := !toggle1
		if(toggle1){
			traytip,,AntiAFK On
			ControlSend,,eq, - Arch	
			SetTimer, eq, 30000
		}
		else{
			traytip,,AntiAFK Off
			SetTimer, eq, Off
			}
}			
else
	sendplay {%A_ThisHotKey%}
return

F2::
if (state = "D"){
	toggle2 :=  !toggle2
		if(toggle2){
			traytip,,F On
			SetTimer,pF,500
		}
		else{
			traytip,,F Off
			SetTimer,pF,Off
		}
}		
else
	sendplay {%A_ThisHotKey%}
return

F3::
if (state = "D"){
	toggle3 :=  !toggle3
		if(toggle3){
			traytip,,AutoStealth On
			SetTimer,stealth,350
		}
		else{
			traytip,,AutoStealth Off
			SetTimer,stealth,Off
		}
}
else
	sendplay {%A_ThisHotKey%}
return

eq:
	if(toggle1){
		Random,rand,3000,5000
		sleep,%rand%
		ControlSend,,eq, - Arch	
		}
	return	
pF:
	ControlSend,,f, - Arch
	return
stealth:
	ControlSend,,-, - Arch
	return


~Scrolllock::
	sleep, 100
	getkeystate, state, ScrollLock, T
	if (state = "D"){
		TrayTip, State,Hotkeys enabled,0,1
		Hotkey, ScrollLock,, "D"
;		Suspend,off
		}
	else if (state = "U"){
		TrayTip, State, Hotkeys disabled,0,1
		Hotkey, ScrollLock,, "U"
;		Suspend,on
		}
return	

^!r::	Reload

~Alt::
if (A_PriorHotkey <> "~Alt" or A_TimeSincePriorHotkey > 400)
{
    ; Too much time between presses, so this isn't a double-press.
    KeyWait, Alt
    return
}
IfWinActive, - Arch 
	WinMinimize
Else{
	WinActivate, - Arch
}
return