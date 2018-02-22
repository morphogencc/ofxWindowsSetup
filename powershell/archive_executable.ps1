param (
[system.io.fileinfo]$file = $null
)

. ./settings/config.ps1

if($CONFIG_exe_name) {
	$file = $CONFIG_exe_name
}

if($file -eq $null) {
	Write-Host "No filename given; please use the -file parameter to provide a target executable to archive.\n"
	exit
}
  
$extension = [IO.Path]::GetExtension($file)

if ($extension -ne ".exe") {
	Write-Host "Filename provided not an executable!  Please provide a .exe file as the target.\n"
	exit
}

$dir_name = "$CONFIG_exe_path\$((Get-Date).ToString('yyyy-MM-dd'))"

if(Test-Path $CONFIG_exe_path\$dir_name) {
}
else {
	New-Item -ItemType Directory -Path $dir_name
}

if(Test-Path ..\..\CHANGELOG.md) {
	Copy-Item ..\..\CHANGELOG.md $CONFIG_exe_path\$dir_name
}

if(Test-Path $CONFIG_exe_path\$dir_name\$file) {
	Write-Host "File $file already exists in $dir_name!  Overwrite?"

	$title = "Overwrite file?"
	
	$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", `
    "Overwrite file $CONFIG_exe_path\$dir_name\$file.\n"

	$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", `
    "Retain previously archived file.\n"

	$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)

	$result = $host.ui.PromptForChoice($title, $message, $options, 0) 

	switch ($result)
    {
        0 {
		}
        1 {
		exit
		}
    }	
}

Copy-Item $CONFIG_exe_path\$file $CONFIG_exe_path\$dir_name\$file -force