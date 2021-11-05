function reload_alias { & $PROFILE }
Set-Alias -Name reload -Value reload_alias

Set-Alias -Name sync-now -Value C:\Users\$env:UserName\scripts\rsync-script.ps1

Set-Alias -Name sync-now-reverse -Value C:\Users\$env:UserName\scripts\rsync-script-reverse.ps1

Set-Alias -Name resize-handbrake -Value C:\Users\$env:UserName\scripts\VideoFileResizer.ps1

function wsaconnect([string]$Apk){
    WsaClient.exe /restart
    adb kill-server
    Start-Sleep -Seconds 5
    adb connect 127.0.0.1:58526
}

function wsladb([string]$arg){
    $busID = -split (usbipd wsl list | Select-String "ADB")
    if ($arg -eq "attach") {
        usbipd wsl attach --busid $busID[0]
    }
    elseif ($arg -eq "detach") {
        usbipd wsl detach --busid $busID[0]
    }
}

function killwsa(){
    adb -e reboot -p
}

function getranks([string]$State, [string]$Region)
{
    python C:\Users\$env:UserName\Desktop\scripts\RankGrabber.py "$State" "$Region"
}

function toaac([string]$Format, [string]$Bitrate){
    $Bitrate = $Bitrate + "k"
    Get-ChildItem -Path "$env:UserProfile\Music" -Recurse | Where-Object {$_.Extension -eq ".$Format"} | ForEach-Object {
        $FilePath = $_.FullName
        $OutputFile = $FilePath.Replace($Format, "m4a")
        & ffmpeg.exe -i "$FilePath" -c:a aac -c:v copy -b:a "$Bitrate" "$OutputFile"
        Remove-Item -Path "$FilePath" -Force
    }
}


Invoke-Expression (&starship init powershell)
