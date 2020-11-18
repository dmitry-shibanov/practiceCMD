# The script that does recursive file search using powershell

function FindFile1() {
    Param(
        [Parameter(Mandatory=$true)]
        [String]$Name,
        [String]$Path = "$HOME"
    )

    Get-ChildItem -Path $Path -Recurse -ErrorAction SilentlyContinue -Force | Where-Object { $_.Name -eq $Name }
}

function FindFile2() {
    Param(
        [Parameter(Mandatory=$true)]
        [String]$Name,
        [String]$Path = "$HOME"
    )

    Get-ChildItem -Path $Path -Filter $Name -Recurse -ErrorAction SilentlyContinue -Force
}

FindFile2 -Name "development"

