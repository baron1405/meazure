; Inno Setup Script for Meazure
;
; Copyright 2001 C Thing Software

[Setup]
AppId=Meazure
AppName=Meazure
AppVerName=Meazure 3.0
AppVersion=3.0
AppMutex=MeazureInstallerMutex
OutputDir=..\..\dist
OutputBaseFilename=meazr30x64
AppPublisher=C Thing Software
AppPublisherURL=https://www.cthing.com
AppSupportURL=https://www.cthing.com
AppUpdatesURL=https://www.cthing.com
AppCopyright=Copyright 2001 C Thing Software
DefaultDirName={commonpf}\Meazure
DefaultGroupName=Meazure
LicenseFile=..\..\LICENSE
PrivilegesRequired=admin
UsedUserAreasWarning=no
ArchitecturesInstallIn64BitMode=x64

[Tasks]
Name: "desktopicon";     Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; MinVersion: 4,4

[Types]
Name: "complete"; Description: "Complete installation"
Name: "compact";  Description: "Compact installation"
Name: "custom";   Description: "Custom installation"; Flags: iscustom

[Components]
Name: "core";     Description: "Program Files";   Types: complete compact custom; Flags: fixed
Name: "help";     Description: "Help Files";      Types: complete custom
Name: "profiles"; Description: "Sample Profiles"; Types: complete custom

[Dirs]
Name: "{app}\Profiles"; Components: core

[Files]
; Visual C++ and MFC redistributable system files
Source: "..\..\build-nmake\Release\mfc*.dll";             DestDir: "{app}"; Components: core; Flags: ignoreversion
Source: "..\..\build-nmake\Release\msvc*.dll";            DestDir: "{app}"; Components: core; Flags: ignoreversion
Source: "..\..\build-nmake\Release\vcruntime*.dll";       DestDir: "{app}"; Components: core; Flags: ignoreversion
Source: "..\..\build-nmake\Release\Microsoft.*.manifest"; DestDir: "{app}"; Components: core; Flags: ignoreversion skipifsourcedoesntexist
; HTML Help support
Source: "..\redist\hhupd.exe"; DestDir: "{tmp}"; Components: core; Check: Runhhupd
; Core files
Source: "..\..\build-nmake\Release\Meazure.exe";  DestDir: "{app}"; Components: core; Flags: ignoreversion
Source: "..\..\build-nmake\Release\Meazure.chm";  DestDir: "{app}"; Components: help; Flags: ignoreversion
Source: "..\..\build-nmake\Release\Hooks.dll";    DestDir: "{app}"; Components: core; Flags: ignoreversion
Source: "..\..\build-nmake\Release\libexpat.dll"; DestDir: "{app}"; Components: core; Flags: ignoreversion
Source: "..\..\LICENSE";                          DestDir: "{app}"; DestName: "LICENSE.txt"; Components: core; Flags: ignoreversion
Source: "..\..\README.md";                        DestDir: "{app}"; DestName: "README.txt"; Components: core; Flags: ignoreversion
; DTD files
Source: "..\dtd\PositionLog1.dtd";   DestDir: "{app}\dtd"; Components: core; Flags: ignoreversion
; Sample profiles
Source: "..\profiles\1920x1080.mea"; DestDir: "{app}\Profiles"; Components: profiles; Flags: ignoreversion overwritereadonly uninsremovereadonly; Attribs: readonly
Source: "..\profiles\1024x768.mea";  DestDir: "{app}\Profiles"; Components: profiles; Flags: ignoreversion overwritereadonly uninsremovereadonly; Attribs: readonly
Source: "..\profiles\1280x1024.mea"; DestDir: "{app}\Profiles"; Components: profiles; Flags: ignoreversion overwritereadonly uninsremovereadonly; Attribs: readonly
Source: "..\profiles\640x480.mea";   DestDir: "{app}\Profiles"; Components: profiles; Flags: ignoreversion overwritereadonly uninsremovereadonly; Attribs: readonly
Source: "..\profiles\800x600.mea";   DestDir: "{app}\Profiles"; Components: profiles; Flags: ignoreversion overwritereadonly uninsremovereadonly; Attribs: readonly
Source: "..\profiles\NTSC.mea";      DestDir: "{app}\Profiles"; Components: profiles; Flags: ignoreversion overwritereadonly uninsremovereadonly; Attribs: readonly
Source: "..\profiles\PAL.mea";       DestDir: "{app}\Profiles"; Components: profiles; Flags: ignoreversion overwritereadonly uninsremovereadonly; Attribs: readonly
Source: "..\profiles\SVGA.mea";      DestDir: "{app}\Profiles"; Components: profiles; Flags: ignoreversion overwritereadonly uninsremovereadonly; Attribs: readonly
Source: "..\profiles\SXGA.mea";      DestDir: "{app}\Profiles"; Components: profiles; Flags: ignoreversion overwritereadonly uninsremovereadonly; Attribs: readonly
Source: "..\profiles\VGA.mea";       DestDir: "{app}\Profiles"; Components: profiles; Flags: ignoreversion overwritereadonly uninsremovereadonly; Attribs: readonly
Source: "..\profiles\XGA.mea";       DestDir: "{app}\Profiles"; Components: profiles; Flags: ignoreversion overwritereadonly uninsremovereadonly; Attribs: readonly

[InstallDelete]
Type: files; Name: "{app}\xmlparse.dll"
Type: files; Name: "{app}\xmltok.dll"

[Icons]
Name: "{group}\Meazure";           Filename: "{app}\Meazure.exe"; Components: core
Name: "{group}\Meazure Help";      Filename: "{app}\Meazure.chm"; Components: help
Name: "{group}\Meazure Readme";    Filename: "{app}\README.txt";  Components: core
Name: "{group}\Meazure License";   Filename: "{app}\LICENSE.txt"; Components: core
Name: "{userdesktop}\Meazure";     Filename: "{app}\Meazure.exe"; MinVersion: 4,4; Tasks: desktopicon

[Registry]
; Profile file type
Root: HKCR; Subkey: ".mea"; ValueType: string; ValueData: "Meazure.Profile"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCR; Subkey: "Meazure.Profile"; ValueType: string; ValueData: "Meazure Profile File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Meazure.Profile\DefaultIcon"; ValueType: string; ValueData: "{app}\Meazure.exe,0"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Meazure.Profile\shell\open"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Meazure.Profile\shell\open\command"; ValueType: string; ValueData: """{app}\Meazure.exe"" ""%1"""; Flags: uninsdeletekey
; Position log file type
Root: HKCR; Subkey: ".mpl"; ValueType: string; ValueData: "Meazure.Positions"; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCR; Subkey: "Meazure.Positions"; ValueType: string; ValueData: "Meazure Position Log File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Meazure.Positions\DefaultIcon"; ValueType: string; ValueData: "{app}\Meazure.exe,1"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Meazure.Positions\shell\open"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Meazure.Positions\shell\open\command"; ValueType: string; ValueData: """{app}\Meazure.exe"" ""%1"""; Flags: uninsdeletekey

[Run]
Filename: "{tmp}\hhupd.exe /q:a /r:n"; Check: Runhhupd
Filename: "{app}\Meazure.exe"; Description: "Launch Meazure"; Flags: nowait postinstall skipifsilent

[Code]
program Setup;

const
  DELAY_MILLIS = 250;
  MAX_DELAY_MILLIS = 90000;

  
function Runhhupd(): Boolean;
var
  chm: string;
begin
  RegQueryStringValue(HKCR, '.chm', '', chm);
  Result := (chm = '');
end;


function GetUninstallString32: string;
var
  uninstallString: string;
begin
  uninstallString := '';
  RegQueryStringValue(HKLM32, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\Meazure_is1', 'UninstallString', uninstallString);
  Result := uninstallString;
end;


function IsUpgrade32: Boolean;
begin
  Result := (GetUninstallString32() <> '');
end;


function UninstallApplication32(): Boolean;
var
  resultCode: Integer;
  uninstallStr: string;
  delayCounter: Integer;
begin
  // Uninstall the application
  Log('Uninstall of 32-bit version');
  uninstallStr := RemoveQuotes(GetUninstallString32());
  Result := Exec(uninstallStr, '/SILENT /NORESTART /SUPPRESSMSGBOXES /LOG', '', SW_HIDE, ewWaitUntilTerminated, resultCode) and (resultCode = 0);
  if not Result then
  begin
    Log('Uninstall of 32-bit version failed!');
    Exit
  end;
  Log('32-bit version uninstalled!');

  // Unfortunately, the uninstaller will return before the uninstall is complete. Poll until
  // the uninstaller is deleted. A more robust but unnecessarily complex solution would be to
  // poll the process table for the uninstaller.
  Log('Waiting for uninstaller to complete');
  delayCounter := 0;
  repeat
    Sleep(DELAY_MILLIS);
    delayCounter := delayCounter + DELAY_MILLIS;
  until not FileExists(uninstallStr) or (delayCounter >= MAX_DELAY_MILLIS);
  if (delayCounter >= MAX_DELAY_MILLIS) then
    Log('32-bit version uninstall timeout exceeded');
  Log('Waited ' + IntToStr(delayCounter) + ' ms for 32-bit version uninstall');
end;


procedure CurStepChanged(CurStep: TSetupStep);
begin
  if (CurStep = ssInstall) then
  begin
    if (IsUpgrade32()) then
    begin
      UninstallApplication32();
    end;
  end;
end;


begin
end.

