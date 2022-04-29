choco install 7zip -y
choco install brave -y
choco install chocolateygui -y
choco install calibre --version=4.23.0 -y
choco install cryptomator -y
choco install drawio -y
choco install docker-desktop -y
choco install f.lux -y
choco install firefox -y
choco install foxitreader --version=11.1.0.52543 -y
choco install gimp -y
choco install gh -y # GitHub CLI
choco install git -y
choco install joplin -y
choco install keepassxc -y
choco install libreoffice-fresh -y
choco install microsoft-windows-terminal -y
choco install obs-studio -y
choco install powershell-core -y
choco install protonvpn -y
choco install rancher-desktop -y
choco install shotcut -y
choco install signal -y
choco install slack -y
choco install steam-client -y
choco install vagrant -y
choco install vcxsrv -y
choco install virtualbox --version=6.1.26 -y
choco install vscodium -y
choco install zoom -y

# Enable HyperV
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All  -NoRestart

# Enable WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart

# TODO: Download kernel package. See manually install wsl docs (for 64 bit arch)

# Install Ubuntu 20.04 LTS WSL distro
wsl --set-default-version 2
wsl --install -d Ubuntu-20.04
