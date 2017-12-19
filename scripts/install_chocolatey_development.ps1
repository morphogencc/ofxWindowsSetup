Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

chocolatey feature enable -n allowGlobalConfirmation

# web browsers
choco install googlechrome

# video
choco install vlc
choco install quicktime

# text editors
choco install atom

# developer tools
choco install git
choco install visualstudio2017community
choco install python --version 3.5.4
python -m ensurepip
choco install nodejs
choco install meteor
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
choco install dropbox

refreshenv
