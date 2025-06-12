#Requires -RunAsAdministrator
. "$PSScriptRoot\idm_extension_tools.ps1"

$crxPath = "ngpampappnmepgilojfohadhhmbhlaek-6.40.12.crx"
$unpackDir = "$PSScriptRoot\idm_unpacked"
$extractor = Join-Path $PSScriptRoot "7za.exe"
$manifestPath = Join-Path $unpackDir "manifest.json"
$extSettingsDir = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Local Extension Settings"
$idmHostRegKeys = @(
    "HKCU:\Software\Microsoft\Edge\NativeMessagingHosts\com.tonec.idm",
    "HKLM:\Software\Microsoft\Edge\NativeMessagingHosts\com.tonec.idm"
)
$originPrefix = "chrome-extension://"
$browserExe = "msedge.exe"
$restartUrl = "chrome://restart"

Unpack-Crx $crxPath $unpackDir $extractor
Remove-UpdateUrl-FromManifest $manifestPath

Write-Host "`nACTION REQUIRED:"
Write-Host "1. Open Edge."
Write-Host "2. Go to edge://extensions"
Write-Host "3. Enable 'Developer mode' (top right)."
Write-Host "4. Click 'Load unpacked' and select: $unpackDir"
Write-Host ""

Wait-For-UnpackedExtensionId $extSettingsDir { param($foundId)
    Patch-IdmHostJson $idmHostRegKeys $foundId $originPrefix
    Restart-Browser $browserExe $restartUrl
}
