Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

chocolatey feature enable -n allowGlobalConfirmation

# web browsers
choco install googlechrome

# video
choco install vlc
choco install quicktime

# text editors
choco install atom

# useful for production
choco install git
choco install visualstudio2017community
choco install meteor
choco install python --version 3.5.4
choco install pip

# useful for development
choco install nodejs
choco install arduino
choco install cmake
choco install kicad
choco install ffmpeg

# misc windows stuff
choco install autohotkey.portable
choco install 7zip
choco install filezilla
choco install teamviewer
choco install wireshark

refreshenv
