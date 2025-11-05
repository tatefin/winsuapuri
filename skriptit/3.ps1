Start-Service w32time
w32tm /config /manualpeerlist:"time.mikes.fi, time2.mikes.fi" /syncfromflags:manual /reliable:YES /update
w32tm /resync
Write-Host "Aikapalvelimet muutettu time1.mikes.fi ja varapalvelimeksi time2.mikes.fi"