#ladataan kirjastot
Add-Type -AssemblyName 'System.Drawing'
Add-Type -AssemblyName 'System.Windows.Forms'

# vauvan eka formi ja sille title ja koko
$form = New-Object System.Windows.Forms.Form
$form.Text = 'esiasennus-apuri'
$form.Size = New-Object System.Drawing.Size(320, 420)

# funktio skriptalle
function Run-Script($scriptName) {
    $scriptPath = Join-Path -Path (Get-Location) -ChildPath "skriptit\$scriptName"
    if (Test-Path $scriptPath) {
        Write-Host " $scriptName"
        & $scriptPath
    } else {
        Write-Host "Skriptiä ei löytynyt: $scriptPath"
    }
}

# napit millä ajetaan sit 1-x.ps1
$button1 = New-Object System.Windows.Forms.Button
$button1.Text = 'Asenna fin kielipaketti'
$button1.Size = New-Object System.Drawing.Size(260, 40)
$button1.Location = New-Object System.Drawing.Point(20, 20)
$button1.Add_Click({ Run-Script "1.ps1" })

$button2 = New-Object System.Windows.Forms.Button
$button2.Text = 'Alue ja kieli suomeksi '
$button2.Size = New-Object System.Drawing.Size(260, 40)
$button2.Location = New-Object System.Drawing.Point(20, 70)
$button2.Add_Click({ Run-Script "2.ps1" })

$button3 = New-Object System.Windows.Forms.Button
$button3.Text = 'Aikapalvelimeksi mikes'
$button3.Size = New-Object System.Drawing.Size(260, 40)
$button3.Location = New-Object System.Drawing.Point(20, 120)
$button3.Add_Click({ Run-Script "3.ps1" })

$button4 = New-Object System.Windows.Forms.Button
$button4.Text = 'Tehtäväpalkki vasuriin'
$button4.Size = New-Object System.Drawing.Size(260, 40)
$button4.Location = New-Object System.Drawing.Point(20, 170)
$button4.Add_Click({ Run-Script "4.ps1" })

$button5 = New-Object System.Windows.Forms.Button
$button5.Text = 'Kannen asetukset (ei tee mitään sulkiessa)'
$button5.Size = New-Object System.Drawing.Size(260, 40)
$button5.Location = New-Object System.Drawing.Point(20, 220)
$button5.Add_Click({ Run-Script "5.ps1" })

$button6 = New-Object System.Windows.Forms.Button
$button6.Text = 'gpupdate force'
$button6.Size = New-Object System.Drawing.Size(260, 40)
$button6.Location = New-Object System.Drawing.Point(20, 270)
$button6.Add_Click({ Run-Script "6.ps1" })

$button7 = New-Object System.Windows.Forms.Button
$button7.Text = 'T E E  K A I K K I'
$button7.Size = New-Object System.Drawing.Size(260, 40)
$button7.Location = New-Object System.Drawing.Point(20, 320)
$button7.Add_Click({ Run-Script "7.ps1" })

# napit
$form.Controls.Add($button1)
$form.Controls.Add($button2)
$form.Controls.Add($button3)
$form.Controls.Add($button4)
$form.Controls.Add($button5)
$form.Controls.Add($button6)
$form.Controls.Add($button7)

# formi itessään
$form.ShowDialog()
