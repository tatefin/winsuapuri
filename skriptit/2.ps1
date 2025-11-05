Set-WinSystemLocale fi-FI
Set-WinUserLanguageList fi-FI -Force
Set-WinUILanguageOverride fi-FI
Set-WinCultureFromLanguageListOptOut $true
Set-Culture fi-FI
Set-WinHomeLocation -GeoId 244  # 244 = Suomi
Write-Host "alue ja kieli muutettu"