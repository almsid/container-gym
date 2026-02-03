# Container Gym

Interactive container orchestration exercises using gymctl.

## Quick Start

### Using VS Code Dev Container

1. Open this folder in VS Code
2. When prompted, click "Reopen in Container"
3. Wait for the container to build
4. Open terminal and run `gymctl list` to see available exercises

### Using Docker Compose

```bash
# Start the environment (automatically pulls image)
make up

# Connect to the gym
make shell

# Inside the container
gymctl list
gymctl start jerry-root-container
gymctl check
gymctl hint
```

### Using Make Commands

```bash
# Show available commands
make help

# Start environment (pulls image automatically)
make up

# Connect to container
make shell

# Check status
make status

# View logs
make logs

# Stop environment
make down

# Clean everything
make clean
```

## Exercise Tracks

### Docker Fundamentals

1. **jerry-root-container** - Fix container running as root
2. **jerry-fat-image** - Optimize bloated Docker image
3. **jerry-broken-layers** - Fix inefficient layer caching
4. **jerry-no-healthcheck** - Add health checks
5. **jerry-lost-connection** - Debug networking issues
6. **jerry-broken-syntax** - Fix Dockerfile syntax errors

### Kubernetes Basics

1. **jerry-forgot-resources** - Add resource limits
2. **jerry-broken-service** - Fix service configuration
3. **jerry-missing-configmap** - Add ConfigMap mounting
4. **jerry-probe-failures** - Fix liveness/readiness probes
5. **jerry-wrong-namespace** - Fix namespace issues

## Working with Exercises

### Start an Exercise

```bash
# List available exercises
gymctl list

# Start a specific exercise
gymctl start jerry-root-container

# Check your progress
gymctl check

# Get hints if stuck
gymctl hint

# Reset if needed
gymctl reset
```

### Exercise Workflow

1. **Start**: `gymctl start <exercise-name>`
2. **Work**: Fix the issues in the workspace
3. **Check**: `gymctl check` to validate your solution
4. **Hint**: `gymctl hint` if you need help
5. **Complete**: Move to the next exercise

## Docker-in-Docker Mode

For fully isolated Docker exercises:

```bash
# Start with Docker-in-Docker
make dind-up

# Connect with DinD enabled
make dind-shell
```

## Workspace Structure

```
workspace/
├── Dockerfile          # Current exercise Dockerfile
├── app/               # Application files
├── docker-compose.yml # If needed for exercise
└── k8s/              # Kubernetes manifests
```

## Progress Tracking

Your progress is automatically saved in a Docker volume. To check:

```bash
gymctl status
```

## Troubleshooting

### Devcontainer Fails to Create (GHCR Image)

If Codespaces/Dev Containers fails with an error like `docker inspect --type image ghcr.io/shart-cloud/gymctl:...`, Docker couldn't fetch the `gymctl` image.

- Verify the tag exists (this repo defaults to `ghcr.io/shart-cloud/gymctl:latest`).
- If the GHCR package is private, grant the Codespace/repository read access to the package (or make the package public), then rebuild the devcontainer.

### Permission Issues

If you encounter Docker socket permission errors:

```bash
sudo chmod 666 /var/run/docker.sock
```

### Reset Progress

To start fresh:

```bash
make clean
make up
```

### View Logs

```bash
make logs
```

## Requirements

- Docker 20.10+
- Docker Compose 2.0+
- Make (optional, for convenience commands)
- VS Code with Dev Containers extension (for devcontainer workflow)
