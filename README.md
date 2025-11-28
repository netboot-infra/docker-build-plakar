# Plakar Docker Image

Plakar does not currently provide an official Docker image, so this repository offers a lightweight, community-maintained image to simplify installation and usage.

## 🚀 Features

- Minimal Docker image for running Plakar
- Easy configuration through environment variables
- Ready-to-use commands for backup, restore, and repository management
- Suitable for local use or deployment on servers

## 📦 Getting Started

### 1. Clone the repository

```bash
git https://github.com/netboot-infra/docker-build-plakar.git
cd docker-build-plakar
```

### 2. Build the Docker image

```bash
docker build -t plakar .
```

### 3. Run Plakar

```bash
docker run --rm \
  -v $(pwd)/repository:/data \
  plakar <your-plakar-command>
```

## 🤝 Contributing

Contributions are welcome!
Feel free to open issues or submit pull requests to improve the image or the documentation.