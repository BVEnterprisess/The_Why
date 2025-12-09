# CI/CD Workflow Documentation

## Overview

This repository includes automated CI/CD workflows for continuous integration, synchronization, and deployment.

## Workflows

### 1. CI - Continuous Integration (`ci.yml`)
**Triggers:**
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop`

**Actions:**
- Validates required documentation files exist
- Checks file structure
- Validates markdown files (if markdownlint available)
- Checks repository sync status

### 2. Auto Sync (`sync.yml`)
**Triggers:**
- Scheduled: Every 6 hours
- Manual: Via workflow_dispatch

**Actions:**
- Fetches all branches from remote
- Checks for remote changes
- Pulls and merges remote changes automatically
- Pushes merged changes back

**Usage:**
```bash
# Manual trigger via GitHub UI or API
gh workflow run sync.yml
```

### 3. Deploy Documentation (`deploy.yml`)
**Triggers:**
- Push to `main` with changes to `.md`, `.txt`, or workflow files
- Manual: Via workflow_dispatch

**Actions:**
- Validates documentation files
- Creates documentation summary
- Uploads documentation as artifacts

### 4. Auto Merge (`auto-merge.yml`)
**Triggers:**
- Pull requests opened or updated

**Actions:**
- Automatically merges PRs from Dependabot
- Merges PRs with `auto-merge` label
- Uses squash merge method

### 5. Sync Local Changes (`sync-local.yml`)
**Triggers:**
- Manual: Via workflow_dispatch

**Actions:**
- Checks for uncommitted changes
- Commits and pushes changes with custom message

**Usage:**
```bash
# Via GitHub UI: Actions → Sync Local Changes → Run workflow
# Or via API/CLI
```

### 6. Branch Protection (`branch-protection.yml`)
**Triggers:**
- Push to `main` branch

**Actions:**
- Verifies commit message format (conventional commits)
- Checks for large files (>10MB)
- Enforces code quality standards

## Workflow Status

View workflow runs at: https://github.com/BVEnterprisess/The_Why/actions

## Manual Sync Process

If you need to manually sync local changes:

1. **Via GitHub Actions UI:**
   - Go to Actions tab
   - Select "Sync Local Changes"
   - Click "Run workflow"
   - Enter commit message
   - Run

2. **Via Command Line:**
   ```bash
   git add .
   git commit -m "your message"
   git push origin main
   ```

3. **Pull Remote Changes:**
   ```bash
   git fetch origin
   git pull origin main
   ```

## Branch Strategy

- **main**: Production branch (protected)
- **develop**: Development branch (if used)

## Commit Message Format

Follow conventional commits:
- `feat: add new feature`
- `fix: fix bug`
- `docs: update documentation`
- `chore: maintenance tasks`

## Automation Features

✅ Automatic sync every 6 hours
✅ Automatic validation on push
✅ Automatic merge for Dependabot PRs
✅ Documentation deployment
✅ Branch protection enforcement

## Troubleshooting

**Workflow fails:**
- Check Actions tab for error details
- Verify GitHub token permissions
- Check branch protection rules

**Sync issues:**
- Run manual sync workflow
- Check for merge conflicts
- Verify remote repository access

