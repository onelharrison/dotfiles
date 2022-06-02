$TaskName = 'dotfiles_RunSyncthing'

# Remove task if it exists
$Task = Get-ScheduledTask -TaskName $TaskName -ErrorAction Ignore
if ($Task) {
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$False
}

# Recreate task with desired settings
$Action = New-ScheduledTaskAction -Execute 'syncthing.exe' -Argument '--no-console --no-browser'
$Trigger = New-ScheduledTaskTrigger -AtStartup
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit '00:00:00'
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
Register-ScheduledTask -TaskName 'dotfiles_RunSyncthing' -InputObject $Task