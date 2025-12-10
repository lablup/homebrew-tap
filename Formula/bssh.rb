class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.3.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.3.0/bssh-macos-aarch64.zip"
      sha256 "f297edaf9ff1384355f5515b16117e8a9e927f1418ea4e01406aeebaf5074707"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.3.0/bssh-linux-aarch64.tar.gz"
      sha256 "32ebb90cd658f61f8b7305afb8948110c56b3aac65b81a2d6639643c7f54bde7"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.3.0/bssh-linux-x86_64.tar.gz"
      sha256 "1448622a3b2d3e3fb3342abbe702cfca0da752efd5e49c518e7536918949ba46"
    end
  end

  def install
    bin.install "bssh"
    man1.install "bssh.1"
  end

  test do
    output = shell_output("#{bin}/bssh --version")
    assert_match(/bssh\s+#{version}/, output)
  end
end
