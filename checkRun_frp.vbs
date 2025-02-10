Dim WshShell, objWMIService, colProcess, objProcess
Set WshShell = CreateObject("WScript.Shell")

' 检查是否已经有该进程在运行
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set colProcess = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'cmd.exe'")

Dim isRunning
isRunning = False

For Each objProcess In colProcess
    If InStr(objProcess.CommandLine, "start_frp.bat") > 0 Then
        isRunning = True
        Exit For
    End If
Next

' 如果没有找到正在运行的进程，则执行批处理文件
If Not isRunning Then
    WshShell.Run "D:\FRP\start_frp.bat", 0, False
End If

' 清理
Set WshShell = Nothing
Set objWMIService = Nothing
Set colProcess = Nothing
