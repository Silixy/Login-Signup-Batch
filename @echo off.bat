@echo off
if exist %TEMP%\loggedin.tmp (powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Already Logged in', 'Success', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\already.tmp)
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Do you have an Account?', 'Account', 'YesNoCancel', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\acc.tmp
set /p account=<%TEMP%\acc.tmp
if /i %account%== no (powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Would you like to Sign-Up?', 'Sign-Up', 'YesNoCancel', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\sup.tmp)
set /p signup=<%TEMP%\sup.tmp
if /i %signup%== yes (powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter Username:', 'Username')}" > %TEMP%\username.tmp)
set /p username=<%TEMP%\username.tmp
if /i %signup%== yes (powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter Password:', 'Password')}" > %TEMP%\password.tmp)
set /p password=<%TEMP%\password.tmp
if /i %account%== yes (powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter Username:', 'Username')}" > %TEMP%\loginu.tmp)
set /p loginu=<%TEMP%\loginu.tmp
if %loginu%== %username% (powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter Password:', 'Password')}" > %TEMP%\loginp.tmp)
set /p Loginp=<%TEMP%\Loginp.tmp
if NOT %loginp%== %password% (powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Login Invalid', 'Invalid', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\wrong.tmp)
set /p wrong=<%TEMP%\wrong.tmp
if %loginp%== %password% (powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Login Success', 'Success', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\loggedin.tmp)
set /p loggedin=<%TEMP%\loggedin.tmp
