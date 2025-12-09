# IDE Setup - DevOps Best Practices

## Overview

This workspace is configured with DevOps best practices for agent-based development using Cursor IDE.

## Configuration Files

### `.cursorrules`
- Defines coding standards and agent behavior
- Security-first approach
- Documentation requirements
- Testing guidelines

### `.vscode/settings.json`
- Auto-format on save
- Linting and error detection
- Git auto-fetch and sync
- Language-specific formatters

### `.vscode/extensions.json`
- Recommended extensions for the team
- Cursor will prompt to install missing extensions

### `.vscode/tasks.json`
- Pre-configured tasks for common operations
- Format, lint, test, and git operations

### `.vscode/launch.json`
- Debug configurations for Python and Node.js
- Test debugging support

### Code Quality Tools

- **Prettier** (`.prettierrc`) - Code formatting
- **ESLint** (`.eslintrc.json`) - JavaScript/TypeScript linting
- **Black** (`pyproject.toml`) - Python formatting
- **Markdownlint** (`.markdownlint.json`) - Markdown validation
- **EditorConfig** (`.editorconfig`) - Consistent editor settings

## Features Enabled

### Auto-Formatting
- Format on save
- Format on paste
- Language-specific formatters

### Git Integration
- Auto-fetch on open
- Smart commit (stage all, commit)
- Auto-sync on pull
- Prune on fetch

### Error Detection
- ErrorLens shows errors inline
- Real-time linting
- Problem panel for all issues

### Security
- Workspace trust enabled
- Secrets detection
- No hardcoded credentials

## Recommended Extensions

All extensions are listed in `.vscode/extensions.json`. Cursor will prompt to install them.

### Critical Extensions
1. **GitLens** - Enhanced Git capabilities
2. **ErrorLens** - Inline error display
3. **Prettier** - Code formatting
4. **ESLint** - JavaScript linting
5. **Docker** - Container management
6. **SonarLint** - Code quality and security

## Usage

### Format Code
- Automatic on save
- Manual: `Shift+Alt+F` (Windows) or `Shift+Option+F` (Mac)

### Run Tasks
- `Ctrl+Shift+P` → "Tasks: Run Task"
- Select: Format, Lint, Test, etc.

### Debug
- `F5` to start debugging
- Select configuration from dropdown

### Git Operations
- Auto-fetch runs in background
- Use GitLens for advanced features
- Smart commit stages all and commits

## Best Practices

1. **Always format before committing** (automatic)
2. **Fix linting errors** (shown inline)
3. **Use conventional commits** (enforced by CI/CD)
4. **Never commit secrets** (checked by git hooks)
5. **Run tests before pushing** (use tasks)

## Troubleshooting

**Extensions not installing:**
- Check Cursor extension marketplace
- Verify internet connection
- Restart Cursor

**Formatting not working:**
- Check file type is supported
- Verify formatter extension installed
- Check `.prettierrc` or language config

**Git not syncing:**
- Check git credentials
- Verify remote URL
- Check network connection

