# Should create an xml from hashmap:
#   $map = @{
#       message = "Hello someone"
#       numbers = @(1,2,3,4,5)
#       person = @{
#           name = "Dmitry"
#           surname = "Ivanov"
#       }
#   }

function CreateXml(){
    param(
        [hashtable] $table
    )

    foreach($item in $table.Keys){
        if($table[$item].GetType().Name -eq "HashTable"){
            "<$item>" | Out-File "file.xml" -Append
            CreateXml -table $table[$item]
            "</$item>" | Out-File "file.xml" -Append
        } else {
            $value = $table[$item]
            if($table[$item].GetType().BaseType.Name -match "Array"){
                "<$item>" | Out-File "file.xml" -Append
                $table[$item] | Foreach {
                    "<value>$_</value>" | Out-File "file.xml" -Append
                }
                "</$item>" | Out-File "file.xml" -Append   
            } else {
                $table[$item] | Foreach {
                    "<$item>$_</$item>" | Out-File "file.xml" -Append
                }
            }
        }
    }
}

New-Item "file.xml" -Force
$map = @{
    message = "Hello someone"
    numbers = @(1,2,3,4,5)
    person = @{
        name = "Dmitry"
        surname = "Ivanov"
    }
}

"<head>" | Out-File "file.xml" -Append
CreateXml -table $map
"</head>" | Out-File "file.xml" -Append

$myObj = [PSCustomObject]$map
$myObj.GetType().Name
ConvertTo-Xml -InputObject $myObj