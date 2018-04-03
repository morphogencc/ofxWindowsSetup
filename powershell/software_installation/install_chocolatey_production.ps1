Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

chocolatey feature enable -n allowGlobalConfirmation

# web browsers
choco install googlechrome

# video
choco install vlc
choco install quicktime

# text editors
choco install atom

# for cloning repos
choco install git

# for running C++ executables
choco install vcredist2017

# for running python scripts / downloading requirements
choco install python --version 3.5.4
python -m ensurepip

# for running node programs
choco install nodejs

# deployment tools
choco install docker-for-windows

# misc windows stuff
choco install autohotkey.portable
choco install 7zip
choco install filezilla
choco install teamviewer
choco install wireshark

refreshenv
