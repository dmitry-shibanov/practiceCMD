# You have a txt file with numerous “this” expressions. 
# Write a script that replaces “this” into “that” occurrences in txt file.

# first variant
$content = Get-Content -Path "./changeContent.txt"
$content.Replace("this", "that") | Out-File -FilePath "./changeContent.txt"

# second variant
( Get-Content -Path "./changeContent.txt" -Raw ) -replace '^this$', "that" | Out-File -Path "./changeContent1.txt"
if ("$content" -match '^this$'){
    Write-Host "matching..."
}