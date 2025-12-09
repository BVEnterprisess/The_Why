# Script to sync local codebase with remote repository
# Usage: .\sync-with-remote.ps1 -RemoteUrl "https://github.com/username/repo.git"

param(
    [Parameter(Mandatory=$true)]
    [string]$RemoteUrl
)

Set-Location $PSScriptRoot

Write-Host "=== Syncing with Remote Repository ===" -ForegroundColor Cyan
Write-Host "Remote URL: $RemoteUrl" -ForegroundColor Yellow

# Check if remote already exists
$existingRemote = git remote get-url origin 2>$null
if ($existingRemote) {
    Write-Host "`nExisting remote found: $existingRemote" -ForegroundColor Yellow
    $update = Read-Host "Update to new URL? (y/n)"
    if ($update -eq 'y') {
        git remote set-url origin $RemoteUrl
        Write-Host "Remote URL updated" -ForegroundColor Green
    }
} else {
    Write-Host "`nAdding remote 'origin'..." -ForegroundColor Yellow
    git remote add origin $RemoteUrl
    Write-Host "Remote added" -ForegroundColor Green
}

# Fetch from remote
Write-Host "`nFetching from remote..." -ForegroundColor Yellow
git fetch origin

# Check current branch
$currentBranch = git branch --show-current
if (-not $currentBranch) {
    $currentBranch = "main"
    git checkout -b $currentBranch
}

# Check if remote branch exists
$remoteBranch = "origin/$currentBranch"
$remoteExists = git ls-remote --heads origin $currentBranch 2>$null

if ($remoteExists) {
    Write-Host "`nRemote branch '$currentBranch' exists" -ForegroundColor Green
    Write-Host "Checking for conflicts..." -ForegroundColor Yellow
    
    # Check if we're ahead/behind
    git fetch origin $currentBranch
    $status = git status -sb 2>&1
    
    if ($status -match "ahead") {
        Write-Host "Local is ahead of remote - will push" -ForegroundColor Yellow
    }
    if ($status -match "behind") {
        Write-Host "Local is behind remote - will pull" -ForegroundColor Yellow
        Write-Host "Pulling changes..." -ForegroundColor Yellow
        git pull origin $currentBranch --no-rebase
    }
    if ($status -match "diverged") {
        Write-Host "Branches have diverged - manual merge needed" -ForegroundColor Red
        Write-Host "Run: git pull origin $currentBranch --no-rebase" -ForegroundColor Yellow
        exit 1
    }
} else {
    Write-Host "`nRemote branch '$currentBranch' does not exist" -ForegroundColor Yellow
    Write-Host "Will push local branch to create remote branch" -ForegroundColor Yellow
}

# Push local changes
Write-Host "`nPushing local changes..." -ForegroundColor Yellow
git push -u origin $currentBranch

Write-Host "`n=== Sync Complete ===" -ForegroundColor Green
Write-Host "Repository is now synced with: $RemoteUrl" -ForegroundColor Green

