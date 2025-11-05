Add-WindowsCapability -Online -Name "Language.Basic~~~fi-FI~0.0.1.0" -ErrorAction SilentlyContinue

Set-WinSystemLocale fi-FI
Set-WinUserLanguageList fi-FI -Force
Set-WinUILanguageOverride fi-FI
Set-WinCultureFromLanguageListOptOut $true
Set-Culture fi-FI
Set-WinHomeLocation -GeoId 244  # 244 = Suomi

Start-Service w32time
w32tm /config /manualpeerlist:"time.mikes.fi, time2.mikes.fi" /syncfromflags:manual /reliable:YES /update
w32tm /resync

Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarAlignment' -Value 'Left'

powercfg /change monitor-timeout-ac 0
powercfg /change monitor-timeout-dc 0
powercfg /setacvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 0
powercfg /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 0

gpupdate /force
Stop-Process -Name explorer -Force
Start-Process explorer

Write-Host "kaikki valmista!"