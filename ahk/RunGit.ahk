;SetTitleMatchMode RegEx
;return

;#c::
    RunGit()
;return


; Opens the command shell 'cmd' in the directory browsed in Explorer.
; Note: expecting to be run when the active window is Explorer.
;
RunGit()
{
    ;Run,  D:\Program Files\ConEmu\ConEmu64.exe "%full_path%" /Single ""D:\Git\bin\sh.exe" --login -i"
    ;Run, C:\Windows\SysWOW64\cmd.exe /c ""D:\Git\bin\sh.exe" --login -i"
    ;Sleep 500
    ;SendInput cd ../../%goto%+{Enter}

    Run,  D:\Program Files\ConEmu\ConEmu64.exe "%full_path%" /Single
    Sleep 500
    SendInput git push origin master
    Sleep 1000
    SendInput {Enter}
    Sleep 1000
    SendInput wanglei23
    SendInput {Enter}
    Sleep 1000
    SendInput wanglei223
    SendInput {Enter}
    Sleep 1000

    WinGet, active_id, ID, A
    WinClose, ahk_id %active_id%
}