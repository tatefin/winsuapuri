# laitetaan adminina powershellin kautta kielipaketti ja alueasetukset suomeks,
# esim. lifegear ei toimi käytännössä ollenkaan ilman.
# lisäksi tykkään laittaa aikapalvelimeksi time1.mikes.fi, koska itsellä toiminut parhaiten ja luotettavimmin.
# laitetaan myös tehtäväpalkki vasemmalle puolelle ja käynnistetään explorer.exe uusiksi. just in case.
# ajetaan myös komento joka läppärin kannen kiinni laittaessa muuttaa windowsissa käytännöksi "älä tee mitään", tämä telakkaa käyttäviä varten (siirtää kuvan näyttöön)
#scripta haukkuu idiootiksi jos ei aja sitä oikein. oma moka.

try {
Write-Host "kielipaketti asennetaan"
Add-WindowsCapability -Online -Name "Language.Basic~~~fi-FI~0.0.1.0" -ErrorAction SilentlyContinue

Write-Host "lokalisointi ja alue kuntoon next"
Set-WinSystemLocale fi-FI
Set-WinUserLanguageList fi-FI -Force
Set-WinUILanguageOverride fi-FI
Set-WinCultureFromLanguageListOptOut $true
Set-Culture fi-FI
Set-WinHomeLocation -GeoId 244  # 244 = Suomi

Write-Host "sitten vielä aikapalvelin ja varapalvelin mikes.fi"
Start-Service w32time
w32tm /config /manualpeerlist:"time.mikes.fi, time2.mikes.fi" /syncfromflags:manual /reliable:YES /update
w32tm /resync

Write-Host "laitetaan tehtäväpalkki vasemmalle puolelle"
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarAlignment' -Value 'Left'
Stop-Process -Name explorer -Force
Start-Process explorer

Write-Host "laitetaan kannen sulkemisen asetukset oikein"
powercfg /change monitor-timeout-ac 0
powercfg /change monitor-timeout-dc 0
powercfg /setacvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 0
powercfg /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 0

Write-Host "päivitetään ryhmäkäytännöt ja käynnistetään explorer.exe uusiksi"
gpupdate /force
Stop-Process -Name explorer -Force
Start-Process explorer

} catch {
Write-Host "T2-admin tunnuksilla!!! powershelli-adminina!" -ForegroundColor Green
}

# finito. aina tarpeen mukaan lisätään osioita, 
# write-host toimii itselle hyvinä "kommentteina" skriptassa ja yläosan kommentit toimi
# hyvänä "todo-listana" kun aloin selvittää komentoj