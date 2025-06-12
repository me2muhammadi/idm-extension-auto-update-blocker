function Write-VerboseMsg($msg) {
    Write-Host $msg
}

function Unpack-Crx {
    param($crxPath, $unpackDir, $extractor)
    if (Test-Path $unpackDir) { Remove-Item $unpackDir -Recurse -Force }
    Write-VerboseMsg "Extracting $crxPath with 7-Zip..."
    & "$extractor" x $crxPath "-o$unpackDir" -y | Out-Null
}

function Remove-UpdateUrl-FromManifest {
    param($manifestPath)
    try {
        $manifest = Get-Content $manifestPath | ConvertFrom-Json
        if ($manifest.PSObject.Properties.Name -contains 'update_url') {
            $manifest.PSObject.Properties.Remove('update_url')
            Write-VerboseMsg "Removed update_url from manifest.json"
        } else {
            Write-VerboseMsg "manifest.json has no update_url (no action needed)"
        }
        $manifest | ConvertTo-Json -Depth 10 | Set-Content $manifestPath -Encoding UTF8
        Write-VerboseMsg "Saved manifest.json"
    } catch {
        Write-Host "ERROR: Failed to read or update manifest.json."
        exit 1
    }
}

function Wait-For-UnpackedExtensionId {
    param($extSettingsDir, $extensionAction)
    $idsBefore = @()
    if (Test-Path $extSettingsDir) {
        $idsBefore = @(Get-ChildItem $extSettingsDir -Directory | ForEach-Object { $_.Name })
    }
    Write-VerboseMsg "Waiting for you to load the unpacked extension in the browser..."
    $foundId = $null
    $tries = 0
    $maxTries = 100
    while (-not $foundId -and $tries -lt $maxTries) {
        Start-Sleep -Seconds 3
        $tries++
        if (Test-Path $extSettingsDir) {
            $idsNow = @(Get-ChildItem $extSettingsDir -Directory | ForEach-Object { $_.Name })
            $newIds = $idsNow | Where-Object { $idsBefore -notcontains $_ }
            if ($newIds.Count -eq 1) {
                $foundId = $newIds | Select-Object -First 1
                break
            } elseif ($newIds.Count -gt 1) {
                Write-Host "Warning: Multiple new extension directories detected, using the first: $($newIds[0])"
                $foundId = $newIds | Select-Object -First 1
                break
            }
        }
    }
    if (-not $foundId) {
        Write-Host "ERROR: Could not detect the extension ID. Make sure you load the unpacked extension."
        exit 1
    }
    Write-Host "Detected unpacked extension ID: $foundId"
    & $extensionAction $foundId
}

function Patch-IdmHostJson {
    param($hostKeys, $foundId, $originPrefix)
    $jsonPath = $null
    foreach ($key in $hostKeys) {
        try {
            $value = Get-ItemProperty -Path $key -ErrorAction Stop
            $jsonPath = $value.'(default)'
            break
        } catch {}
    }
    if (-not $jsonPath) {
        Write-Host "ERROR: Cannot find IDM Native Messaging Host registry entry. Make sure IDM is installed."
        exit 1
    }
    Write-VerboseMsg "IDM Native Messaging Host JSON: $jsonPath"
    $backupPath = $jsonPath + ".bak"
    Copy-Item $jsonPath $backupPath -Force
    Write-VerboseMsg "Backed up JSON to $backupPath"
    try {
        $jsonObj = Get-Content $jsonPath | ConvertFrom-Json
        if (-not $jsonObj.allowed_origins) { $jsonObj | Add-Member -MemberType NoteProperty -Name "allowed_origins" -Value @() }
        $newOrigin = "$originPrefix$foundId/"
        if (-not ($jsonObj.allowed_origins -contains $newOrigin)) {
            $jsonObj.allowed_origins += $newOrigin
            $jsonObj | ConvertTo-Json -Depth 10 | Set-Content $jsonPath -Encoding UTF8
            Write-Host "Added $newOrigin to allowed_origins in $jsonPath"
        } else {
            Write-Host "$newOrigin already present in $jsonPath"
        }
    } catch {
        Write-Host "ERROR: Failed to update JSON."
        exit 1
    }
}

function Restart-Browser {
    param($browserExe, $restartUrl)
    Write-Host "Restarting browser to finalize extension installation..."
    Start-Process $browserExe $restartUrl
}
