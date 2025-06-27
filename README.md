# Assistant Configuration

This repository contains a custom Continue assistant configuration.

## Features

- DeepSeek R1 Distil Qwen 32B model for chat, edit, apply, and autocomplete
- Jina Embeddings V2 Code for embeddings
- Comprehensive context providers (code, docs, diff, terminal, problems, folder, codebase)

## Installation

### Linux/Mac
```bash
./deploy.sh
```


## Manual Installation

1. Backup your existing config: `cp ~/.continue/config.yaml ~/.continue/config.yaml.backup`
2. Copy this config: `cp config.yaml ~/.continue/config.yaml`
3. Restart your IDE

## Configuration Details

- **Model**: DeepSeek R1 Distil Qwen 32B
- **API Base**: http://192.168.61.47:8000/v1
- **Embeddings**: Jina Embeddings V2 Code
- **Embedding API**: http://192.168.61.47:8002

## Requirements

- Continue extension installed in VS Code
- Access to the configured API endpoints