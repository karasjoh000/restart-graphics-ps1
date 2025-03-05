$thunderboltDevices = Get-PnpDevice -Class "System" | Where-Object {
    $_.FriendlyName -match "Thunderbolt" -or 
    $_.Description -match "USB4 Host Router" -or
    $_.Service -match "USB4XHC"
}

if ($thunderboltDevices) {
    Write-Host "Resetting Thunderbolt/USB4 hardware..."
    $thunderboltDevices | Disable-PnpDevice -Confirm:$false
    Start-Sleep -Seconds 2
    $thunderboltDevices | Enable-PnpDevice -Confirm:$false
    Start-Sleep -Seconds 5  # Crucial for TB reinitialization
}

# 2. Reset DisplayPort Alt Mode (Critical for Thunderbolt displays)
$usbControllers = Get-PnpDevice -Class "USB" | Where-Object {
    $_.FriendlyName -match "USB Root Hub|USB4"
}

$usbControllers | ForEach-Object {
    Write-Host "Resetting USB controller $($_.FriendlyName)..."
    Disable-PnpDevice -InstanceId $_.InstanceId -Confirm:$false
    Start-Sleep -Milliseconds 500
    Enable-PnpDevice -InstanceId $_.InstanceId -Confirm:$false
}

Start-Sleep -Seconds 3

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


