powercfg /change monitor-timeout-ac 0
powercfg /change monitor-timeout-dc 0
powercfg /setacvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 0
powercfg /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS LIDACTION 0
Write-Host "kansi laittaessa kiinni, ei tee mittee enää."