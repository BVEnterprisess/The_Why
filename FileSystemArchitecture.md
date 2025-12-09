# File System Architecture - Final Implementation

This document describes the implemented file system architecture following XDG Base Directory Specification.

See `D:\dotfiles\ARCHITECTURE.md` for complete documentation.

## Quick Reference

- **Projects**: `D:\code\projects\`
- **Configs**: `D:\dotfiles\config\` (version controlled)
- **Service Data**: `D:\data\services\`
- **User Data**: `D:\local\share\`
- **Logs**: `D:\local\state\logs\`
- **Cache**: `D:\cache\` (ephemeral, safe to delete)
- **Runtimes**: `D:\runtimes\` (installations only)

## Environment Variables

Set via bootstrap script or manually:
- `DOTFILES` = `D:\dotfiles`
- `XDG_CONFIG_HOME` = `D:\dotfiles\config`
- `XDG_DATA_HOME` = `D:\local\share`
- `XDG_CACHE_HOME` = `D:\cache`
- `XDG_STATE_HOME` = `D:\local\state`

## Bootstrap

Run `D:\dotfiles\scripts\bootstrap.ps1` (Windows) or `bootstrap.sh` (Linux/WSL) to set up environment and symlinks.

