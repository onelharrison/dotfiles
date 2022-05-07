# Download and Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install chocolatey packages
choco install ./chocolatey/packages.config --yes
# Pin chocolatey packages
pwsh ./chocolatey/pins.ps1


# Configure WindowsOptionalFeatures
# =================================

# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All  -NoRestart

# Enable Windows Subsystem for Linux
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart

# Enable Virtual Machine Platform
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All -NoRestart

# TODO: To be ran after restart
#
# Configure Windows Subsystem for Linux
# =====================================

# TODO: Download and run the Linux kernel update package (for x64 arch)
# https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

# Set WSL default version to v2
# wsl --set-default-version 2

# Install Ubuntu 20.04 LTS WSL distro
# wsl --install -d Ubuntu-20.04

# Configure Services
# ==================

# Start the ssh-agent service manually when the ssh-agent command is invoked
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
