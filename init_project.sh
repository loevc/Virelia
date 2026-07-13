#!/usr/bin/env bash

set -e

PROJECT_NAME="Virelia"

echo "======================================"
echo " Initialize ${PROJECT_NAME}"
echo "======================================"

# 创建目录并添加 git 占位文件
create_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
    fi

    if [ ! -f "$1/.gitkeep" ]; then
        touch "$1/.gitkeep"
    fi
}


# 创建文件
create_file() {
    mkdir -p "$(dirname "$1")"

    if [ ! -f "$1" ]; then
        touch "$1"
    fi
}


########################################
# Documentation
########################################

create_file "docs/architecture.md"
create_file "docs/roadmap.md"
create_file "docs/development.md"

create_dir "docs/design"
create_dir "docs/decisions"


########################################
# Backend
########################################

create_file "backend/README.md"

create_dir "backend/gateway"
create_dir "backend/agent-service"
create_dir "backend/model-service"
create_dir "backend/memory-service"


########################################
# Frontend
########################################

create_file "frontend/README.md"


########################################
# Agent System
########################################

create_file "agents/README.md"

create_dir "agents/planner"
create_dir "agents/coder"
create_dir "agents/researcher"
create_dir "agents/tools"


########################################
# Model Management
########################################

create_file "models/README.md"

create_dir "models/checkpoints"
create_dir "models/configs"


########################################
# Infrastructure
########################################

create_file "infra/README.md"

create_dir "infra/docker"
create_dir "infra/compose"
create_dir "infra/kubernetes"
create_dir "infra/nginx"


########################################
# Runtime Data
########################################

create_dir "data/postgres"
create_dir "data/redis"
create_dir "data/vector"
create_dir "data/minio"


########################################
# Scripts
########################################

create_file "scripts/setup.sh"
create_file "scripts/start.sh"
create_file "scripts/stop.sh"


########################################
# Configuration
########################################

create_file "configs/.env.example"


########################################
# Test
########################################

create_dir "tests"


########################################
# Github
########################################

create_dir ".github/workflows"

create_file ".github/workflows/ci.yml"


########################################
# Root Files
########################################

create_file "Makefile"
create_file "docker-compose.yml"
create_file "CONTRIBUTING.md"
create_file "CHANGELOG.md"


########################################
# Git attributes
########################################

create_file ".gitignore"


########################################
# Output
########################################

echo ""
echo "======================================"
echo " Initialization Finished"
echo "======================================"

echo ""
echo "Git tracked files:"
echo ""

git status --short
