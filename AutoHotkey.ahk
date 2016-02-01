SetTimer,UPDATEDSCRIPT,1000

UPDATEDSCRIPT:
FileGetAttrib,attribs,%A_ScriptFullPath%
IfInString,attribs,A
{
  FileSetAttrib,-A,%A_ScriptFullPath%
  SplashTextOn,,,Updated script,
  Sleep,500
  SplashTextOff
  Reload
}
Return
;ENDOFSCRIPT

;Capslock::Ctrl
;LControl::return
#PgUp::AppsKey

#a::
Run, Explorer C:\Users\Administrator\Downloads
Return

#c::
Run, Explorer C:\
Return

#z::
WinMinimize, A
Return

; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.

; Mouse Wheel Tab Scroll 4 Chrome
; -------------------------------
; Scroll though Chrome tabs with your mouse wheel when hovering over the tab bar.
; If the Chrome window is inactive when starting to scroll, it will be activated.

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn   ; Enable warnings to assist with detecting common errors.
#SingleInstance force   ; Determines whether a script is allowed to run again when it is already running.
#UseHook Off    ; Using the keyboard hook is usually preferred for hotkeys - but here we only need the mouse hook.
#InstallMouseHook
#MaxHotkeysPerInterval 1000 ; Avoids warning messages for high speed wheel users.

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;Menu, Tray, Tip, Mousewheel tab scroll for Chrome (1.0.3)

WheelUp::
WheelDown::
MouseGetPos,, ypos, id
WinGetClass, class, ahk_id %id%
If (ypos < 45 and InStr(class,"Chrome_WidgetWin"))
{
IfWinNotActive ahk_id %id%
WinActivate ahk_id %id%
If A_ThisHotkey = WheelUp
Send ^{PgUp}
Else
Send ^{PgDn}
}
Else
{
If A_ThisHotkey = WheelUp
Send {WheelUp}
Else
Send {WheelDown}
}
Return