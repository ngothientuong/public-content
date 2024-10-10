# Check if extensions.txt exists
if (-not (Test-Path "extensions.txt")) {
    Write-Error "Error: extensions.txt file not found"
    exit 1
}

# Read extensions from file and install them
Get-Content "extensions.txt" | ForEach-Object {
    $extension = $_.Trim()
    if ($extension) {
        Write-Host "Installing extension: $extension"
        $process = Start-Process -FilePath "code" -ArgumentList "--install-extension", $extension, "--force" -NoNewWindow -PassThru -Wait
        
        if ($process.ExitCode -eq 0) {
            Write-Host "Successfully installed $extension" -ForegroundColor Green
        } else {
            Write-Host "Failed to install $extension" -ForegroundColor Red
        }
        
        Start-Sleep -Seconds 3
    }
}

Write-Host "Installation process completed" -ForegroundColor Cyan