# Continue Assistant Configuration Deployment Script


$ErrorActionPreference = "Stop"

# Configuration
$ContinueDir = "$env:USERPROFILE\.continue"
$ConfigFile = "$ContinueDir\config.yaml"
$BackupDir = "$ContinueDir\backups"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SourceConfig = "$ScriptDir\config.yaml"

Write-Host "Continue Configuration Deployment" -ForegroundColor Green
Write-Host "=============================================="

# Check if Continue directory exists
if (-not (Test-Path $ContinueDir)) {
    Write-Host "Error: Continue directory not found at $ContinueDir" -ForegroundColor Red
    Write-Host "Please install Continue extension and run it at least once."
    exit 1
}

# Create backup directory if it doesn't exist
if (-not (Test-Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
}

# Backup existing config if it exists
if (Test-Path $ConfigFile) {
    $BackupName = "config.yaml.backup.$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    $BackupPath = "$BackupDir\$BackupName"
    Copy-Item $ConfigFile $BackupPath
}

# Check if source config exists
if (-not (Test-Path $SourceConfig)) {
    Write-Host "Error: Source config file not found at $SourceConfig" -ForegroundColor Red
    exit 1
}

# Deploy new config
Copy-Item $SourceConfig $ConfigFile -Force

Write-Host ""
Write-Host "Deployment completed successfully!"
Write-Host "Please restart your IDE to load the new configuration."
Write-Host ""