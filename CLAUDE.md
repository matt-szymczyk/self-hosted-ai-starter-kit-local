# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

The Self-hosted AI Starter Kit is an open-source Docker Compose template designed to quickly set up a comprehensive local AI and low-code development environment. It includes several key components:

- **n8n**: Low-code platform with extensive AI capabilities and 400+ integrations
- **Ollama**: Local LLM platform for running models locally
- **Qdrant**: Vector database for embedding storage and retrieval
- **PostgreSQL**: Database for persistent storage

The project is primarily configured through Docker Compose and provides pre-configured workflows for AI applications.

## Common Commands

### Starting the Environment

The environment can be started in different modes depending on your hardware:

**For Nvidia GPU users:**
```bash
docker compose --profile gpu-nvidia up
```

**For AMD GPU users on Linux:**
```bash
docker compose --profile gpu-amd up
```

**For Mac / Apple Silicon users:**
```bash
# For Mac M1/M2 users, run without profile for local Ollama or with CPU profile
docker compose up
# OR
docker compose --profile cpu up
```

**For CPU-only setups:**
```bash
docker compose --profile cpu up
```

### Upgrading the Environment

**For Nvidia GPU setups:**
```bash
docker compose --profile gpu-nvidia pull
docker compose create && docker compose --profile gpu-nvidia up
```

**For Mac / Apple Silicon users:**
```bash
docker compose pull
docker compose create && docker compose up
```

**For CPU-only setups:**
```bash
docker compose --profile cpu pull
docker compose create && docker compose --profile cpu up
```

## Architecture

### Docker Compose Structure

The environment consists of several Docker containers that work together:

1. **n8n**: The main automation platform, accessible at http://localhost:5678/
2. **Ollama**: Local LLM service, available in different configurations for CPU/GPU
3. **Qdrant**: Vector database for AI embedding storage
4. **PostgreSQL**: Database for n8n persistent storage

### Key Configuration Points

- The services communicate over a Docker network named 'demo'
- Persistent storage is managed through Docker volumes
- The shared directory at `./shared` is mounted to `/data/shared` within the n8n container
- Demo workflow and credentials are automatically imported on startup

### Workflow Structure

The included demo workflow is a simple example showing:
1. A Chat Trigger node to initiate conversations
2. A Basic LLM Chain node for processing
3. An Ollama Chat Model node using the llama3.2 model

## Working with the Codebase

### File Structure

- `docker-compose.yml`: Core configuration for all services
- `n8n/demo-data/`: Contains pre-configured workflows and credentials
- `shared/`: Mounted within the n8n container for file access
- `test-shared/`: Directory for testing file access

### Important Notes

- When accessing files from within n8n workflows, use the path `/data/shared`
- The pre-configured workflows show examples of using Ollama for local AI inference
- For Mac users running Ollama locally, the Ollama host should be set to `host.docker.internal:11434`