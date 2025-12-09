# The Why - File System Architecture & Infrastructure Backbone

## Overview

This repository contains the file system architecture, Docker stack specifications, and infrastructure documentation for the SRAS/MetaMCP swarm system.

## Repository Structure

```
.
├── .github/
│   └── workflows/          # CI/CD automation
├── .vscode/                 # IDE configuration
├── Architecture.txt         # System architecture
├── CursorIDE.txt            # Cursor IDE setup
├── Docker.txt               # Docker stack specification
├── FileSystemScaffold.txt   # Original file system scaffold
├── FileSystemArchitecture.md # Final architecture implementation
├── PRD.txt                  # Product requirements
└── README.md               # This file
```

## Quick Start

1. **Clone the repository:**
   ```bash
   git clone https://github.com/BVEnterprisess/The_Why.git
   cd The_Why
   ```

2. **Open in Cursor IDE:**
   - Cursor will automatically load workspace settings
   - Install recommended extensions when prompted

3. **Review documentation:**
   - `FileSystemArchitecture.md` - Current architecture
   - `Docker.txt` - Docker stack specification
   - `IDE_SETUP.md` - IDE configuration guide

## CI/CD Automation

This repository includes automated workflows:

- **Full Sync** - Pulls, merges, commits, and pushes automatically
- **Auto Commit** - Commits changes every 30 minutes
- **Publish** - Creates releases on main branch updates
- **Validation** - Validates files on every push

View workflows: https://github.com/BVEnterprisess/The_Why/actions

## File System Architecture

The system follows XDG Base Directory Specification:

- **Projects**: `D:\code\projects\`
- **Configs**: `D:\dotfiles\config\` (version controlled)
- **Service Data**: `D:\data\services\`
- **User Data**: `D:\local\share\`
- **Logs**: `D:\local\state\logs\`

See `FileSystemArchitecture.md` for complete documentation.

## Docker Stack

18 containers organized into 5 categories:
1. Orchestration & voice layer
2. Data & vector layer
3. Observability & metrics
4. Security & edge
5. MetaMCP + embedded MCP servers

See `Docker.txt` for complete specification.

## Contributing

1. Make changes
2. Files auto-format on save
3. Commit with conventional format: `feat:`, `fix:`, `docs:`, etc.
4. Push to trigger CI/CD

## License

[Add license information]

