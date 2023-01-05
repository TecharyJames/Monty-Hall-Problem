# Monty Hall problem

[System.Collections.ArrayList]$DoorList = @(1,2,3)

function print-door {

    write-output  `
   "     __________
    |     $doorNumber    |
    |  __  __  |
    | |  ||  | |
    | |  ||  | |
    | |__||__| |
    |  __  __()|
    | |  ||  | |
    | |  ||  | |
    | |  ||  | |
    | |  ||  | |
    | |__||__| |
    |__________|"


}

$PrizeDoor = Get-Random -Minimum 1 -Maximum 4

$doorlist.remove($PrizeDoor)

while ($doorNumber -ne 3)
    {
        $doorNumber++

        print-door

    }

do
    {
        print-door
        [int32]$FirstChoiceDoor = read-host "Pick a door"

    }
until ($FirstChoiceDoor -lt 4)

if ($FirstChoiceDoor -eq $PrizeDoor)
    {

        $CorrectInitialChoice = $true
        $DoorToReveal = (($doorlist | get-random))
        $DoorList.remove($DoorToReveal)

    }
elseif ($FirstChoiceDoor -ne $PrizeDoor)
    {

        $CorrectInitialChoice = $false
        $DoorToReveal = $DoorList
        $DoorList.remove($DoorToReveal)

    }

$ChangeChoice = read-host "I reveal to you that door number $DoorToReveal is empty! Do you want to change your choice? Y/N"

if ($CorrectInitialChoice -eq $true -and $ChangeChoice -eq "Y") 
    {

        Write-Output "The odds weren't in your favour this time. The correct door was your first choice, $prizedoor! If only you stuck to your original answer..."
        
    }
elseif ($CorrectInitialChoice -eq $true -and $ChangeChoice -eq "N") 
    {

        write-output "Well done! You beat the system and guessed door number $prizedoor correctly on your first attempt!"
    
    }
elseif ($CorrectInitialChoice -eq $false -and $ChangeChoice -eq "Y") 
    {
        write-output "Well done, you performed exactly as expect! You chose the wrong door intially, but switched to door number $prizedoor to guess correctly when it mattered!"
    }
elseif ($CorrectInitialChoice -eq $false -and $ChangeChoice -eq "N") 
    {
        write-output "Thank you for proving the maths! You incorrectly chose the wrong door, and stuck with your incorrect decision. The correct door was $prizedoor"
    }

pause
