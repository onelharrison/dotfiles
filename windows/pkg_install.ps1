# Enable HyperV
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All  -NoRestart

# Enable WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart

# TODO: Download kernel package. See manually install wsl docs (for 64 bit arch)

# Install Ubuntu 20.04 LTS WSL distro
wsl --set-default-version 2
wsl --install -d Ubuntu-20.04
