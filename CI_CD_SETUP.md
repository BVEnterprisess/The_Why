# CI/CD Setup - Complete Automation Guide

## Overview

This repository now has **full CI/CD automation** that handles:
- ✅ **Pulling** changes from remote
- ✅ **Merging** remote changes automatically
- ✅ **Committing** local changes
- ✅ **Pushing** to GitHub
- ✅ **Publishing** releases
- ✅ **Auto-syncing** every hour

## Workflows

### 1. Full Sync (`full-sync.yml`)
**Purpose**: Complete bidirectional sync between local and remote

**Triggers**:
- Every hour (scheduled)
- On push to main
- Manual trigger with custom commit message

**What it does**:
1. Fetches all branches and tags
2. Checks for remote changes and pulls/merges them
3. Checks for local changes and commits them
4. Pushes everything to remote
5. Handles conflicts gracefully

**Usage**:
```bash
# Manual trigger via GitHub UI or API
gh workflow run full-sync.yml
```

### 2. Auto Commit (`auto-commit.yml`)
**Purpose**: Automatically commit any uncommitted changes

**Triggers**:
- Every 30 minutes (scheduled)
- Manual trigger

**What it does**:
1. Checks for uncommitted changes
2. Stages all changes
3. Commits with message: `chore: Auto-commit workflow changes [skip ci]`
4. Pushes to main

**Note**: Uses `[skip ci]` to prevent infinite loops

### 3. Publish (`publish.yml`)
**Purpose**: Create releases when main branch is updated

**Triggers**:
- Push to main branch
- Manual trigger with optional version tag

**What it does**:
1. Creates version tag (auto or custom)
2. Builds release archive
3. Creates GitHub release with artifacts

**Usage**:
```bash
# Manual trigger with version
gh workflow run publish.yml -f version=v1.0.0
```

### 4. Sync (`sync.yml`)
**Purpose**: Pull and merge remote changes (simpler than full-sync)

**Triggers**:
- Every hour (scheduled)
- On push to main
- Manual trigger

**What it does**:
1. Fetches remote changes
2. Pulls and merges if remote is ahead
3. Pushes merged changes

### 5. CI (`ci.yml`)
**Purpose**: Validate code on every push/PR

**Triggers**:
- Push to main/develop
- Pull requests

**What it does**:
- Validates required files exist
- Checks file structure
- Verifies repository sync status

### 6. Deploy (`deploy.yml`)
**Purpose**: Deploy documentation changes

**Triggers**:
- Changes to `.md` or `.txt` files

**What it does**:
- Validates documentation
- Creates summary artifacts
- Uploads documentation

### 7. Auto Merge (`auto-merge.yml`)
**Purpose**: Auto-merge Dependabot PRs

**Triggers**:
- Pull requests with `auto-merge` label

### 8. Branch Protection (`branch-protection.yml`)
**Purpose**: Enforce branch protection rules

**Triggers**:
- Push to protected branches

## How It Works

### Automatic Sync Flow

```
┌─────────────────┐
│  Local Changes  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Auto Commit     │ ← Every 30 min
│  (commits)      │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Full Sync      │ ← Every hour
│  (push)         │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  GitHub         │
│  Repository     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Sync           │ ← Every hour
│  (pull/merge)   │
└─────────────────┘
```

### Manual Operations

**Pull latest changes**:
```bash
git pull origin main
```

**Push local changes**:
```bash
git add .
git commit -m "your message"
git push origin main
```

**Trigger full sync manually**:
- Go to: https://github.com/BVEnterprisess/The_Why/actions
- Click "Full Sync - Pull, Merge, Commit, Push"
- Click "Run workflow"

## Configuration

### Required Secrets

All workflows use `GITHUB_TOKEN` which is automatically provided by GitHub Actions. No additional secrets needed.

### Schedule Times

- **Full Sync**: Every hour at :00
- **Auto Commit**: Every 30 minutes
- **Sync**: Every hour at :00

To change schedules, edit the `cron` expressions in each workflow file.

## Monitoring

View all workflow runs:
https://github.com/BVEnterprisess/The_Why/actions

Each workflow run shows:
- ✅ Success/failure status
- ⏱️ Execution time
- 📋 Detailed logs
- 📊 Summary of changes

## Troubleshooting

### Workflow fails with merge conflict
- **Solution**: Manually resolve conflict in GitHub UI or locally
- The workflow will retry on next scheduled run

### Changes not syncing
- **Check**: Workflow run logs in Actions tab
- **Verify**: Remote repository exists and is accessible
- **Manual**: Run `git pull` and `git push` locally

### Auto-commit not working
- **Check**: Files are actually changed (not just whitespace)
- **Verify**: Workflow has permission to write to repository
- **Note**: Uses `[skip ci]` to prevent loops

## Best Practices

1. **Always commit with meaningful messages**
   - Use conventional commits: `feat:`, `fix:`, `docs:`, etc.

2. **Let automation handle routine sync**
   - Don't manually push/pull unless urgent
   - Workflows handle it automatically

3. **Monitor workflow runs**
   - Check Actions tab regularly
   - Fix failures promptly

4. **Use manual triggers for releases**
   - Publish workflow for versioned releases
   - Full sync for urgent syncs

## Status

✅ All workflows are active and configured
✅ Repository is synced with GitHub
✅ Automation is running on schedule

**Last sync**: Check GitHub Actions tab for latest run time

