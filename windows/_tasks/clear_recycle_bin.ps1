$TaskName = 'dotfiles_ClearRecycleBin'

# Remove task if it exists
$Task = Get-ScheduledTask -TaskName $TaskName -ErrorAction Ignore
if ($Task) {
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$False
}

# Recreate task with desired settings
$Action = New-ScheduledTaskAction -Execute 'pwsh.exe' -Argument '-NonInteractive -NoLogo -NoProfile -WindowStyle Hidden -Command "Clear-RecycleBin -Force"'
$Trigger = New-ScheduledTaskTrigger -Daily -DaysInterval 30 -At 10pm
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit '00:00:00'
$Principal = New-ScheduledTaskPrincipal -UserId $env:UserName
Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Settings $Settings -Principal $Principal