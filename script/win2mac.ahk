;windows system keymap simular macOS
; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

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

LCtrl & Space::Send ^{Esc}

; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1

; Show Web Developer Tools with cmd + alt + i
#!i::Send {F12}

LCtrl & Left::Send !{Left}
LCtrl & Right::Send !{Right}

#IfWinActive

;非Google Chrome下
;按下win + q等于按下alt + F4
#IfWinNotActive, ahk_class Chrome_WidgetWin_1
^q::
    send, {alt down}{f4}
    sleep 50
    send, {alt up}
return
#IfWinNotActive

;如果在git bash窗口下，
#IfWinActive, ahk_class mintty

;重定义复制、黏贴快捷键
^c::return

^c::^Ins

^v::^+ins

;新建窗口
^t::
    send, {alt down}{f2}
    sleep 50
    send, {alt up}
return

;终止程序键
!c::^c

#IfWinActive