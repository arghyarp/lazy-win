;OPTIMIZATIONS
#NoEnv
#KeyHistory 0
ListLines Off


;-----------------------------------------------------------------------------------------------------------------------------------------
;SPOTIFY CONTROLS

Spotify := new Spotify_Basic()

return ; End of auto-execute

^!Right::Spotify.Next()
^!Left::Spotify.Previous()
F12::Spotify.TogglePlay()

class Spotify_Basic {

    _actions := {Next:11, Pause:47, Play:46, Previous:12, TogglePlay:14}

    __Call(Action) {
        if (!this._actions.HasKey(Action))
            throw Exception("Invalid action." Action, -1)
        DetectHiddenWindows On
        SetTitleMatchMode RegEx
        if !(hWnd := WinExist("-|Spotify ahk_exe i)Spotify.exe"))
            return
        msg := this._actions[Action] << 16
        SendMessage 0x0319,, % msg,, % "ahk_id" hWnd
        hWnd := DllCall("User32\FindWindow", "Str","NativeHWNDHost", "Ptr",0)
        PostMessage 0xC028, 0x0C, 0xA0000,, % "ahk_id" hWnd
    }
}
Return
;Send ROG key to toggle ghelper
Sleep 10000
SendInput, {F4}
Return

; "CTRL + Alt + S" for Launching spotify / Activating the window / Minimizing the window
^!S::
Process Exist, Spotify.exe*
if !ErrorLevel
  run C:\Users\Arghya\AppData\Roaming\Spotify\Spotify.exe
return


;-------------------------------------------------------------------------------------------------------------------------------------
; HOTKEYS

!h::
SendInput, #{Left}
Return
!k::
SendInput, #{Up}
Return
!j::
SendInput, #{Down}
Return
!l::
SendInput, #{Right}
Return
;applications
!b::
Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
Return
!t::
Run, "wt.exe"
Return
!e::
SendInput, #e
Return
; End --> Ctrl+;
^;::
SendInput, {End}
Return
; quit(alt f4) shortcut
!q::
SendInput, !{F4}
Return
; ueli restart
^!U::
Process, Close, ueli.exe
run C:\Program Files\ueli\ueli.exe
return
; brightness slider
^!`::
    Run nircmd changebrightness -5
    Tooltip, Light <--
    SetTimer, RemoveTooltip, 1000
Return
^!1::
    Run nircmd changebrightness +5
    Tooltip, Light -->
    SetTimer, RemoveTooltip, 1000
Return
^`::
    Run nircmd changesysvolume -3500
    Tooltip, Volume <--
    SetTimer, RemoveTooltip, 1000
Return
^1::
    Run nircmd changesysvolume 3500
    ToolTip, Volume -->
    SetTimer, RemoveTooltip, 1000
Return
RemoveTooltip:
    SetTimer, RemoveTooltip, Off
    Tooltip
Return
;send hyphen
RAlt::-

------------------------------------------------------------------------------------------------------------------------------------------
; AUTO-COMPLETE

;personal
::;reg::21BCE11336
::;nm::Arghya Pal
::;vit::arghya.pal2021@vitbhopal.ac.in
::;main::arghyapal.arg@gmail.com
::;pmain::arghyapal.argp@proton.me
::;num::7077640171
; winget
::;winl::winget list
::;wins::winget search
::;wini::winget install
::;winu::winget upgrade
::;chl::wingee list
::;chs::choco search
::;chi::choco install
::;chu::choco upgrade
;scoop
::;scl::scoop list
::;scs::scoop search 
::;sci::scoop install
::;scu::scoop upgrade
; terminal
::;gurl::https://github.com/arghyarp/

; Date/Time

; Date only
; Ex: 9/1/2005
::]d::
FormatTime, CurrentDate,, M/d/yyyy  
SendInput %CurrentDate%
return

; Date Only
; Ex: 1 September 2005
::]dd::
FormatTime, CurrentDate,, d MMMM yyyy
SendInput %CurrentDate%
return

; Date/Time
; Ex: 9/1/2005 3:53 PM
::]dt::
FormatTime, CurrentDateTime,, M/d/yyyy h:mm:ss tt  
SendInput %CurrentDateTime%
return
; Time only (24-hr)
; Ex: 09:12
::]t::
FormatTime, Time,, HH:mm 
sendinput %Time%
return

; set process priority
;^#!]::
;WinGet, pri_act_name, PID, A
;process, priority, %pri_act_name%, H
;tooltip %pri_act_name% High   ;low-high
;sleep 1000
;tooltip
;return

