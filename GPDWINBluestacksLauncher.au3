Func stopService($name)
   RunWait(@ComSpec & " /c " & 'net stop ' & $name, "", @SW_HIDE)
EndFunc

$bsReg = "HKEY_LOCAL_MACHINE\SOFTWARE\BlueStacks"
$bsFrameBufferReg = $bsReg & "\Guests\Android\FrameBuffer\0"
$bsDir = RegRead($bsReg, "InstallDir")

RegWrite($bsFrameBufferReg, "GuestWidth", "REG_DWORD", 720)
RegWrite($bsFrameBufferReg, "GuestHeight", "REG_DWORD", 1280)
RegWrite($bsFrameBufferReg, "WindowWidth", "REG_DWORD", 720)
RegWrite($bsFrameBufferReg, "WindowHeight", "REG_DWORD", 1280)

RunWait($bsDir & "Bluestacks.exe")

Sleep(3000)

ProcessClose("HD-Agent.exe")
ProcessClose("HD-Adb.exe")
ProcessClose("BstkSVC.exe")
stopService("BstHdLogRotatorSvc")
stopService("BstHdPlusAndroidSvc")