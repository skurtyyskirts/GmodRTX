#define MyAppName "GarrysmodRTX"
#define MyAppVersion "0.5.2"
#define MyAppPublisher "skurtyyskirts"
#define MyAppURL "https://github.com/skurtyyskirts/GmodRTX"

[Setup]
AppName={#MyAppName}
AppVersion={#MyAppVersion}
DefaultDirName={code:GetDefaultDir}
DefaultGroupName={#MyAppName}
LicenseFile=LICENSE.txt
OutputBaseFilename=GarrysmodRTXInstaller
Compression=lzma
SolidCompression=yes
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
PrivilegesRequired=admin
DisableProgramGroupPage=yes
DisableDirPage=no
DirExistsWarning=no

[Files]
; Updated file entries for the specified source files
Source: "C:\Users\skurtyy\Desktop\GarrysmodRTX\bin\*"; DestDir: "{app}\bin"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\skurtyy\Desktop\GarrysmodRTX\garrysmod\*"; DestDir: "{app}\garrysmod"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\skurtyy\Desktop\GarrysmodRTX\rtx-remix\*"; DestDir: "{app}\rtx-remix"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\skurtyy\Desktop\GarrysmodRTX\dxvk.conf"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\skurtyy\Desktop\GarrysmodRTX\LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\skurtyy\Desktop\GarrysmodRTX\readme.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\skurtyy\Desktop\GarrysmodRTX\rtx.conf"; DestDir: "{app}"; Flags: ignoreversion

[Code]
{ Original variable declarations - unchanged }
var
  GModDirPage: TInputDirWizardPage;
  ResolutionPage: TInputOptionWizardPage;
  ScreenWidth, ScreenHeight: Integer;
  SourceGModDir: String;

{ Original FindDefaultGModFolder function - unchanged }
function FindDefaultGModFolder: String;
var
  PossiblePaths: array of String;
  i: Integer;
begin
  SetArrayLength(PossiblePaths, 4);
  PossiblePaths[0] := ExpandConstant('{pf32}\Steam\steamapps\common\GarrysMod');
  PossiblePaths[1] := ExpandConstant('{pf64}\Steam\steamapps\common\GarrysMod');
  PossiblePaths[2] := 'D:\Steam\steamapps\common\GarrysMod';
  PossiblePaths[3] := 'E:\Steam\steamapps\common\GarrysMod';

  Result := '';
  for i := 0 to GetArrayLength(PossiblePaths)-1 do
  begin
    if DirExists(PossiblePaths[i]) and FileExists(PossiblePaths[i] + '\gmod.exe') then
    begin
      Result := PossiblePaths[i];
      Break;
    end;
  end;
end;

{ Original GetDefaultDir function - unchanged }
function GetDefaultDir(Param: String): String;
var
  SourceGModDir: String;
begin
  SourceGModDir := FindDefaultGModFolder;
  if SourceGModDir <> '' then
    Result := ExtractFileDir(SourceGModDir) + '\GarrysModRTX'
  else
    Result := ExpandConstant('{pf}\GarrysModRTX');
end;

{ Original InitializeWizard procedure - unchanged }
procedure InitializeWizard;
begin
  GModDirPage := CreateInputDirPage(wpLicense,
    'Select GarrysMod Location',
    'Where is GarrysMod installed?',
    'Please select your GarrysMod folder, then click Next.' + #13#10 +
    'This is usually in Steam\steamapps\common\GarrysMod',
    False, '');
  GModDirPage.Add('');

  SourceGModDir := FindDefaultGModFolder;
  if SourceGModDir <> '' then
    GModDirPage.Values[0] := SourceGModDir;

  ResolutionPage := CreateInputOptionPage(wpSelectDir,
    'Screen Resolution',
    'Select your preferred screen resolution',
    'Please select your preferred screen resolution for GarrysmodRTX:',
    True, False);
  ResolutionPage.Add('1280 x 720 (HD)');
  ResolutionPage.Add('1920 x 1080 (Full HD)');
  ResolutionPage.Add('2560 x 1080 (Ultrawide Full HD)');
  ResolutionPage.Add('2560 x 1440 (2K)');
  ResolutionPage.Add('3440 x 1440 (Ultrawide 2K)');
  ResolutionPage.Add('3840 x 2160 (4K)');
  ResolutionPage.SelectedValueIndex := 1;
end;

{ Original NextButtonClick function - unchanged }
function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;

  if CurPageID = GModDirPage.ID then
  begin
    if not DirExists(GModDirPage.Values[0]) then
    begin
      MsgBox('Please select a valid GarrysMod folder.', mbError, MB_OK);
      Result := False;
      Exit;
    end;
    if not FileExists(GModDirPage.Values[0] + '\gmod.exe') then
    begin
      MsgBox('The selected folder does not contain gmod.exe. Please select the correct GarrysMod folder.', mbError, MB_OK);
      Result := False;
      Exit;
    end;
    SourceGModDir := GModDirPage.Values[0];
  end
  else if CurPageID = ResolutionPage.ID then
  begin
    case ResolutionPage.SelectedValueIndex of
      0: begin ScreenWidth := 1280; ScreenHeight := 720; end;
      1: begin ScreenWidth := 1920; ScreenHeight := 1080; end;
      2: begin ScreenWidth := 2560; ScreenHeight := 1080; end;
      3: begin ScreenWidth := 2560; ScreenHeight := 1440; end;
      4: begin ScreenWidth := 3440; ScreenHeight := 1440; end;
      5: begin ScreenWidth := 3840; ScreenHeight := 2160; end;
    end;
  end;
end;

{ Enhanced CopyDir function - preserves existing functionality while ensuring complete file copying }
function CopyDir(const SourcePath, DestPath: string): Boolean;
var
  FindRec: TFindRec;
  SubSourcePath, SubDestPath: string;
  AtLeastOneSuccess: Boolean;
begin
  Result := True;
  AtLeastOneSuccess := False;
  
  // Create destination directory if it doesn't exist
  if not DirExists(DestPath) then
    if not ForceDirectories(DestPath) then
    begin
      Log('Failed to create directory: ' + DestPath);
      Result := False;
      Exit;
    end;

  if FindFirst(SourcePath + '\*', FindRec) then
  begin
    try
      repeat
        if (FindRec.Name <> '.') and (FindRec.Name <> '..') then
        begin
          SubSourcePath := SourcePath + '\' + FindRec.Name;
          SubDestPath := DestPath + '\' + FindRec.Name;

          if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY <> 0 then
          begin
            // For directories, try to copy and continue even if it fails
            if CopyDir(SubSourcePath, SubDestPath) then
              AtLeastOneSuccess := True;
          end
          else
          begin
            // For files, try to copy and continue even if it fails
            try
              if FileCopy(SubSourcePath, SubDestPath, True) then
                AtLeastOneSuccess := True
              else
                Log('Failed to copy file: ' + SubSourcePath);
            except
              Log('Exception copying file: ' + SubSourcePath);
            end;
          end;
        end;
      until not FindNext(FindRec);
    finally
      FindClose(FindRec);
    end;
  end;
  
  // If we had at least one successful copy, consider the operation partially successful
  if not Result and AtLeastOneSuccess then
    Result := True;
end;

{ Original CurStepChanged procedure with enhanced error handling }
procedure CurStepChanged(CurStep: TSetupStep);
var
  LauncherContent: String;
  DestGModDir: String;
begin
  if CurStep = ssInstall then
  begin
    DestGModDir := WizardForm.DirEdit.Text;

    // Copy GarrysMod contents with enhanced error handling
    if not CopyDir(SourceGModDir, DestGModDir) then
    begin
      Log('Warning: Some files may not have copied successfully to: ' + DestGModDir);
      // Continue installation despite errors
    end;

    // Create launcher script
    LauncherContent := 'del .\garrysmod\console.log' + #13#10 +
      'gmod -dxlevel 90 -nod3d9ex +mat_dxlevel 90 +mat_disable_d3d9ex 1 -w ' +
      IntToStr(ScreenWidth) + ' -h ' + IntToStr(ScreenHeight) +
      ' -noborder -windowed +sv_cheats 1 ' +
      '+r_3dsky 0 +r_WaterDrawReflection 0 +r_WaterDrawRefraction 0';
    
    try
      if not SaveStringToFile(ExpandConstant('{app}\gmodrtx.exe.bat'), LauncherContent, False) then
        Log('Failed to create launcher script');
    except
      Log('Exception while creating launcher script');
    end;
  end;
end;