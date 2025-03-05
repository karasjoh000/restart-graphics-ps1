# 3. Force GPU driver reset
$gpuAdapters = Get-PnpDevice -Class "Display" | Where-Object {
    $_.FriendlyName -match "NVIDIA|AMD|Intel"
}

if ($gpuAdapters) {
    Write-Host "Resetting GPU drivers..."
    $gpuAdapters | Disable-PnpDevice -Confirm:$false
    Start-Sleep -Seconds 2
    $gpuAdapters | Enable-PnpDevice -Confirm:$false
    Start-Sleep -Seconds 3
}
