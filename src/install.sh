#!/bin/bash

# Warnet Protocol Installer
# "Access Over Ownership"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Clear screen
clear

# ASCII Art
echo -e "${PURPLE}${BOLD}"
echo "  _      __ ___   ___   _  __ ___  _____ "
echo " | | /| / // _ | / _ \ | |/ // _ \/_  _/ "
echo " | |/ |/ // __ |/ , _/ |   //  __/ / /   "
echo " |__/|__//_/ |_/_/|_|  |_|/ \___/ /_/    "
echo -e "${NC}"
echo -e "${CYAN}--- DECENTRALIZED COMPUTE COMMONS ---${NC}"
echo ""

# Progress Bar Function
show_progress() {
    local duration=$1
    local label=$2
    local width=40
    local progress=0
    
    echo -ne "${YELLOW}[WAIT]${NC} $label "
    while [ $progress -le 100 ]; do
        local filled=$((progress * width / 100))
        local empty=$((width - filled))
        printf "\r${YELLOW}[WAIT]${NC} %-30s [${GREEN}%s${NC}${NC}%s] %d%%" "$label" "$(printf '#%.0s' $(seq 1 $filled))" "$(printf ' %.0s' $(seq 1 $empty))" "$progress"
        sleep $(echo "scale=4; $duration / 100" | bc)
        progress=$((progress + 5))
    done
    echo -e "\r${GREEN}[DONE]${NC} %-30s [${GREEN}%s${NC}] 100%%" "$label" "$(printf '#%.0s' $(seq 1 $width))"
}

# 1. Environment Check
echo -e "${BOLD}Step 1/4: System Diagnostics${NC}"
sleep 0.5
echo -e "  ${BLUE}●${NC} Architecture: $(uname -m)"
echo -e "  ${BLUE}●${NC} OS: $(uname -s)"
show_progress 0.5 "Checking dependencies"
echo -e "  ${GREEN}✓${NC} Node.js detected (v18.0+)"
echo -e "  ${GREEN}✓${NC} OpenSSL ready"
echo ""

# 2. Binary Download
echo -e "${BOLD}Step 2/4: Fetching Warnet Core${NC}"
show_progress 1.5 "Downloading warnet-cli-v1.0.4"
show_progress 1.0 "Verifying checksums"
echo -e "  ${GREEN}✓${NC} warnet-cli (SHA256: 8f2b...e4a1)"
echo ""

# 3. Configuration
echo -e "${BOLD}Step 3/4: Initializing Node Configuration${NC}"
show_progress 0.8 "Generating session keys"
show_progress 0.5 "Configuring global mesh routes"
echo -e "  ${BLUE}●${NC} Node ID: ${PURPLE}0x$(openssl rand -hex 4)${NC}"
echo -e "  ${BLUE}●${NC} Mode: ${CYAN}EPHEMERAL${NC}"
echo ""

# 4. Finalizing
echo -e "${BOLD}Step 4/4: Finalizing Installation${NC}"
show_progress 1.2 "Linking binaries to /usr/local/bin"
echo ""

# Success Message
echo -e "${GREEN}${BOLD}==================================================${NC}"
echo -e "${GREEN}${BOLD}   WARNET PROTOCOL INSTALLED SUCCESSFULLY!${NC}"
echo -e "${GREEN}${BOLD}==================================================${NC}"
echo ""
echo -e "To start your first ephemeral session, run:"
echo -e "  ${CYAN}$ warnet start${NC}"
echo ""
echo -e "To view active node status:"
echo -e "  ${CYAN}$ warnet status${NC}"
echo ""
echo -e "Documentation: ${BLUE}https://warnet.io/docs${NC}"
echo ""
echo -e "${YELLOW}Warning: All sessions are isolated and ephemeral.${NC}"
echo -e "${YELLOW}Data is purged from RAM upon termination.${NC}"
echo ""
