$Source = "path to source"
$Target = "path to target"

$Files = Get-ChildItem -Path $Source -Recurse

foreach ($File in $Files) {
    $FullDirectory = $Target + $File.Name
    if ((Test-Path -Path $FullDirectory) -eq $true) {
        $File.Name + ' Already exists on ' + $Target
        $Question = Read-Host 'Do you wish to overwrite it ? y/n'

        if($Question -eq 'y'){
            "Copying file " + $File.Name + ' to ' + $Target
            Copy-Item -Path $File.FullName -Destination $FullDirectory -Force
        } else {
            'ok not copying ' + $File.Name
        }
    }
    else {
        "Copying file " + $File.Name + ' to ' + $Target
        Copy-Item -Path $File.FullName -Destination $FullDirectory 
    }
}