; Copyright (c) 2011 Joe White
;
; Permission is hereby granted, free of charge, to any person obtaining
; a copy of this software and associated documentation files (the
; "Software"), to deal in the Software without restriction, including
; without limitation the rights to use, copy, modify, merge, publish,
; distribute, sublicense, and/or sell copies of the Software, and to
; permit persons to whom the Software is furnished to do so, subject to
; the following conditions:
;
; The above copyright notice and this permission notice shall be
; included in all copies or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
; OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 1

;NumpadSub::
#c::
IfWinNotExist, Git Gui
  Run, git gui,, Hide
WinActivate, Git Gui
IfWinActive, Git Gui
{
  ControlGetPos, control_x, control_y,,, TkChild18, Git Gui
  CoordMode, Mouse, Screen
  MouseGetPos, mouse_x, mouse_y
  click_x := control_x + 5
  click_y := control_y + 5
  CoordMode, Mouse, Relative
  Click %click_x%, %click_y%
  CoordMode, Mouse, Screen
  MouseMove, %mouse_x%, %mouse_y%, 0

  Send, {F5}
}
return

;NumpadAdd::
#a::
IfWinNotExist, gitk
  Run, gitk
WinActivate, gitk
IfWinActive, gitk
  Send, {F5}
return