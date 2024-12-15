# Garry's Mod RTX Shortcut Installer
# watbulb

Add-Type -AssemblyName System.Windows.Forms

# removed: -w 2560 -h 1440
$launchOptions = "-dxlevel 90 -nod3d9ex +mat_dxlevel 90 +mat_disable_d3d9ex 1 -noborder -windowed +sv_cheats 1 +r_3dsky 0 +r_WaterDrawReflection 0 +r_WaterDrawRefraction 0 +mat_softwareskin 0 +r_shadows 0 +r_frustumcullworld 0 +r_occlusion 0 +r_unloadlightmaps 1 +mat_specular 0 +mat_bumpmap 0 +mat_normalmap 0 +mat_parallaxmap 0 +r_staticprop_lod 0 +r_lod 0 +mat_forcedynamic 1"

# We don't ask for hl2 anymore, but should this change, just flip this
$askForHL2 = 0

if ($askForHL2) {
    # Ask for hl2.exe path
    [System.Windows.Forms.MessageBox]::Show('Please locate Half-Life 2 (hl2.exe)')
    $hl2Selection = [System.Windows.Forms.OpenFileDialog] @{  
        InitialDirectory = [Environment]::CurrentDirectory
        CheckFileExists = 1
        ValidateNames = 1
        Filter = "hl2.exe (hl2.exe)|hl2.exe"
    }
    $hl2Selection.ShowDialog()
    if ($hl2Selection.FileName -eq "") {
        exit
    }
}

# Ask for gmod.exe path
[System.Windows.Forms.MessageBox]::Show('Please locate Garrys Mod (gmod.exe)')
$gmodSelection = [System.Windows.Forms.OpenFileDialog] @{  
    InitialDirectory = [Environment]::CurrentDirectory
    CheckFileExists = 1
    ValidateNames = 1
    Filter = "gmod.exe (gmod.exe)|gmod.exe"
}
$gmodSelection.ShowDialog();
if ($gmodSelection.FileName -eq "") {
    exit
}

# Select paths
$gmodFolderPath = Split-Path -Parent $gmodSelection.FileName
$gmodRTXPath = Join-Path -Path $gmodFolderPath -ChildPath "gmod.rtx.exe.lnk"
$gmodICOPath = Join-Path -Path $gmodFolderPath -ChildPath "gmod.exe"

if ($askForHL2) {
    # Copy hl2.exe to GMod path
    Copy-Item -Path $hl2Selection.FileName -Destination $gmodFolderPath
}

# Create RTX laucher shortcut with arguments
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($gmodRTXPath)
$Shortcut.TargetPath = $gmodSelection.FileName
$Shortcut.IconLocation = $gmodICOPath
$Shortcut.WorkingDirectory = $gmodFolderPath
$Shortcut.Arguments = $launchOptions
$Shortcut.Save()
