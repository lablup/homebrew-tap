# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Homebrew tap repository containing formulae for Lablup software packages. The tap provides easy installation of Lablup tools via Homebrew on macOS and Linux.

## Available Formulae

- **all-smi**: GPU monitoring tool for NVIDIA/Jetson/Apple Silicon/Tenstorrent
- **bssh**: Parallel SSH command execution tool for cluster management

## Common Development Tasks

### Testing a Formula Locally
```bash
# Test formula installation
brew install --build-from-source ./Formula/<formula-name>.rb

# Run formula tests
brew test <formula-name>

# Audit formula for style and best practices
brew audit --strict ./Formula/<formula-name>.rb
```

### Updating Formula Versions
Every formula and cask here is rewritten by a release workflow in its source repository (lablup/backend.ai-go, lablup/bssh, lablup/all-smi, lablup/mlxcel). A change made only in this tap is reverted at the next release, so make it in the generator as well.

When updating a formula to a new version:
1. Update all download URLs to point to the new version. Formulae carry no `version` stanza: Homebrew reads the version from the url, and `brew audit` rejects a `version` that repeats it. Add one only when the release tag is one Homebrew misreads, such as `v0.9.0-beta.1`. Casks keep their `version` stanza.
2. Keep every release url in a formula on the same tag; CI rejects a formula whose urls name different releases.
3. Update SHA256 checksums for each platform:
   ```bash
   # Get SHA256 for a release file
   curl -L <download-url> | shasum -a 256
   ```
4. Test the formula installation and run tests

### Repository Structure

- `Formula/`: Contains Homebrew formula Ruby files
  - Each formula defines package metadata, download URLs per platform/architecture, and installation instructions
  - Formulae support multiple platforms (macOS/Linux) and architectures (arm64/x86_64)

### Formula Structure Pattern

Each formula follows this structure:
- Class definition extending `Formula`
- Package metadata (desc, homepage, version, license)
- Platform-specific download URLs and SHA256 checksums
- `install` method to define installation steps
- `test` block to verify installation

### Key Homebrew Commands for Development

```bash
# Install the tap locally
brew tap lablup/tap .

# Reinstall a formula after changes
brew reinstall <formula-name>

# Check formula syntax
brew style ./Formula/<formula-name>.rb

# Uninstall formula
brew uninstall <formula-name>
```