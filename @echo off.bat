@echo off
if exist %TEMP%\loggedin.tmp (-Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Already Logged in', 'Success', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\already.tmp)
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Do you have an Account?', 'Account', 'YesNoCancel', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\acc.tmp
set /p account=<%TEMP%\acc.tmp
if /i %account%== no (powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Would you like to Sign-Up?', 'Sign-Up', 'YesNoCancel', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\sup.tmp)
set /p signup=<%TEMP%\sup.tmp
if /i %signup%== yes (powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter Username:', 'Username')}" > %TEMP%\username.tmp)
set /p username=<%TEMP%\username.tmp
if /i %signup%== yes (powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter Password:', 'Password')}" > %TEMP%\password.tmp)
set /p password=<%TEMP%\password.tmp
if /i %signup% = yes (powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Restart and Login', 'Success', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\ok.tmp)
set /p ok=<%TEMP%\ok.tmp
if /i %account%== yes (powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter Username:', 'Username')}" > %TEMP%\loginu.tmp)
set /p Loginu=<%TEMP%\loginusername.tmp
if %Loginu%== %username% (powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter Password:', 'Password')}" > %TEMP%\Loginp.tmp) else (-Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('%loginu% was not found.', 'Wrong Credentials', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\wrong.tmp)
set /p Loginp=<%TEMP%\Loginp.tmp
if %Loginp%== %password% (-Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Login Success', 'Success', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\loggedin.tmp) else (-Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Login Invalid!', 'Wrong Password', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\error.tmp)
set /p loggedin=<%TEMP%\loggedin.tmp