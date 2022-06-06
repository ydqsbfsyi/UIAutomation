﻿#NoEnv
#SingleInstance force
SetTitleMatchMode, 2
#include <UIA_Interface>
#include <UIA_Browser>

F5::ExitApp
F1::
	browserExe := "chrome.exe"
	Run, %browserExe% -incognito
	WinWaitActive, ahk_exe %browserExe%
	cUIA := new UIA_Browser("ahk_exe " browserExe) ; Initialize UIA_Browser, which also initializes UIA_Interface
	cUIA.WaitPageLoad("New Tab", 3000) ; Wait the New Tab page to load with a timeout of 3 seconds
	Clipboard=
	Clipboard := cUIA.GetCurrentDocumentElement().DumpAll() ; Get the current document element (this excludes the URL bar, navigation buttons etc) and dump all the information about it in the clipboard. Use Ctrl+V to paste it somewhere, such as in Notepad.
	ClipWait, 1
	if Clipboard
		MsgBox, Page information successfully dumped. Use Ctrl+V to paste the info somewhere, such as in Notepad.
	else
		MsgBox, Something went wrong and nothing was dumped in the clipboard!
	return
