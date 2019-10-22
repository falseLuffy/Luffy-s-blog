; Remap Ctrl + Tab to Alt + Tab. And
; Remap Ctrl + Shift + Tab to Alt +Shift + Tab.
LCtrl & Tab:: 
    AltTabMenu := true
    If GetKeyState("Shift","P")
        Send {Alt Down}{Shift Down}{Tab}
    else
        Send {Alt Down}{Tab}
return

#If (AltTabMenu)

    ~*LCtrl Up::
        Send {Shift Up}{Alt Up}
        AltTabMenu := false 
    return

#If

;非Google Chrome下
;按下win + w等于按下alt + F4
#IfWinNotActive, ahk_class Chrome_WidgetWin_1
^w::
    send, {alt down}{f4}
    sleep 50
    send, {alt up}
return
#IfWinNotActive

; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1

; Show Web Developer Tools with cmd + alt + i
#!i::Send {F12}

#IfWinActive