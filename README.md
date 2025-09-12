# Lablup Homebrew Tap

A collection of Homebrew formulae for Lablup software and tools, providing easy installation of high-performance computing and cluster management utilities.

## Available Formulae

### 🖥️ all-smi
**GPU monitoring tool for multiple platforms**
- Supports NVIDIA, Jetson, Apple Silicon, and Tenstorrent GPUs
- Provides real-time GPU utilization statistics
- Similar to `nvidia-smi` but works across different GPU vendors
- [Project Repository](https://github.com/inureyes/all-smi)

### 🔧 bssh
**Parallel SSH command execution tool**
- Execute commands across multiple servers simultaneously
- Designed for efficient cluster management
- Supports batch operations and parallel execution
- [Project Repository](https://github.com/lablup/bssh)

## Installation

### Quick Setup

```bash
# Add the Lablup tap to your Homebrew
brew tap lablup/tap

# Install individual formulae
brew install lablup/tap/all-smi
brew install lablup/tap/bssh
```

### Alternative Installation (without tap)

```bash
# Install directly using the full formula path
brew install lablup/tap/all-smi
brew install lablup/tap/bssh
```

## Usage Examples

### all-smi

```bash
# Display GPU information
all-smi

# Show version information
all-smi --version

# Continuous monitoring (if supported)
all-smi --loop
```

### bssh

```bash
# Execute a command on multiple hosts
bssh -h host1,host2,host3 "uptime"

# Run commands from a hosts file
bssh -f hosts.txt "df -h"

# Execute with custom SSH options
bssh -h server1,server2 -o "StrictHostKeyChecking=no" "ls -la"

# Show version
bssh --version
```

## Supported Platforms

All formulae support the following platforms and architectures:

| Platform | Architecture | Support |
|----------|--------------|---------|
| macOS    | Apple Silicon (arm64) | ✅ |
| Linux    | x86_64       | ✅ |
| Linux    | arm64        | ✅ |

## Development

### Testing a Formula Locally

```bash
# Install from source
brew install --build-from-source ./Formula/<formula>.rb

# Run tests
brew test <formula>

# Audit for style and best practices
brew audit --strict ./Formula/<formula>.rb
```

### Updating Formulae

When updating a formula to a new version:

1. Update the `version` field in the formula file
2. Update download URLs to point to the new release
3. Update SHA256 checksums:
   ```bash
   # Calculate SHA256 for a release file
   curl -L <download-url> | shasum -a 256
   ```
4. Test the installation locally
5. Submit a pull request with your changes

### Contributing

We welcome contributions! To add a new formula or update existing ones:

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/new-formula`)
3. Make your changes following Homebrew formula conventions
4. Test your formula thoroughly
5. Commit your changes (`git commit -m 'Add new formula: xyz'`)
6. Push to your branch (`git push origin feature/new-formula`)
7. Open a Pull Request

Please ensure your formulae:
- Follow [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook) guidelines
- Include proper tests in the `test do` block
- Support multiple platforms where applicable
- Have accurate descriptions and homepages

## Troubleshooting

### Common Issues

**Formula not found**
```bash
# Ensure the tap is properly installed
brew tap | grep lablup

# If not listed, add the tap
brew tap lablup/tap
```

**Installation fails on specific platform**
```bash
# Check your system architecture
uname -m

# Verify the formula supports your platform
brew info lablup/tap/<formula>
```

**SHA256 mismatch errors**
```bash
# Clear Homebrew cache
brew cleanup -s <formula>

# Retry installation
brew install lablup/tap/<formula>
```

## License

This tap repository is licensed under the Apache License 2.0. Individual software packages installed through these formulae may have their own licenses - please refer to each project's repository for specific licensing information.

## Support

For issues related to:
- **This tap**: [Open an issue here](https://github.com/lablup/homebrew-tap/issues)
- **all-smi**: [all-smi issues](https://github.com/inureyes/all-smi/issues)
- **bssh**: [bssh issues](https://github.com/lablup/bssh/issues)

## Related Links

- [Homebrew Documentation](https://docs.brew.sh)
- [Lablup Organization](https://github.com/lablup)
- [Creating Homebrew Taps](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
