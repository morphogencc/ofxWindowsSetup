$signature = @"
[DllImport("user32.dll")] 
public static extern IntPtr FindWindow(string lpClassName, string lpWindowName); 
[DllImport("user32.dll")] 
public static extern bool ShowWindow(IntPtr hWnd,int nCmdShow);
"@

$icons = Add-Type -MemberDefinition $signature -Name Win32Window `
         -Namespace ScriptFanatic.WinAPI -passThru

$hWnd=$icons::FindWindow("Progman","Program Manager")

function Hide-DesktopIcons() {
	$null = $icons::ShowWindow($hWnd,0) 
}

function Show-DesktopIcons() {
	$null = $icons::ShowWindow($hWnd,5)
} 

function Set-WallPaper($Value) {
 Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
 rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

. ./settings/config.ps1

Set-Wallpaper -value $CONFIG_wallpaper_path

Hide-DesktopIcons()