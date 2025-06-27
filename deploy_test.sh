#!/bin/bash

# Continue Assistant Configuration Deployment Script
# This script safely deploys the custom Continue configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
CONTINUE_DIR="$HOME/continue-test"
CONFIG_FILE="$CONTINUE_DIR/config.yaml"
BACKUP_DIR="$CONTINUE_DIR/backups"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_CONFIG="$SCRIPT_DIR/config.yaml"

echo -e "${GREEN}Continue Configuration Deployment${NC}"
echo "=============================================="

# Check if Continue directory exists
if [ ! -d "$CONTINUE_DIR" ]; then
    echo -e "${RED}Error: Continue directory not found at $CONTINUE_DIR${NC}"
    echo "Please install Continue extension and run it at least once."
    exit 1
fi

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup existing config if it exists
if [ -f "$CONFIG_FILE" ]; then
    BACKUP_NAME="config.yaml.backup.$(date +%Y%m%d_%H%M%S)"
    BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"
    cp "$CONFIG_FILE" "$BACKUP_PATH"
    # echo -e "${YELLOW}Existing config backed up to: $BACKUP_PATH${NC}"
fi

# Check if source config exists
if [ ! -f "$SOURCE_CONFIG" ]; then
    echo -e "${RED}Error: Source config file not found at $SOURCE_CONFIG${NC}"
    exit 1
fi

# Deploy new config
cp "$SOURCE_CONFIG" "$CONFIG_FILE"


# Set appropriate permissions
chmod 644 "$CONFIG_FILE"

echo ""
echo "Deployment completed successfully!"
echo "Please restart your IDE to load the new configuration."
echo ""

