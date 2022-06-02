$TaskName = 'dotfiles_UpgradeAllChocolateyPackages'

# Remove task if it exists
$Task = Get-ScheduledTask -TaskName $TaskName -ErrorAction Ignore
if ($Task) {
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$False
}

# Recreate task with desired settings
$Action = New-ScheduledTaskAction -Execute 'choco.exe' -Argument 'upgrade all --yes'
$Trigger = New-ScheduledTaskTrigger -Weekly -WeeksInterval 1 -DaysOfWeek Monday -At 10am
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit '00:00:00'
$Principal = New-ScheduledTaskPrincipal -UserId $env:UserName -LogonType S4U -RunLevel Highest
Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Settings $Settings -Principal $Principal