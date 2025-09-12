class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.8.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.8.0/bssh-macos-aarch64.zip"
      sha256 "9f40bcf308b3579feb6196713e0fa62357cb927db79077aa406f6ea3581a8048"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.8.0/bssh-linux-aarch64.tar.gz"
      sha256 "5ebcbf409732eff2a9ec2e5b8305ca3c1a26477b9dd58aa39849d1190e6fd89b"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.8.0/bssh-linux-x86_64.tar.gz"
      sha256 "aa42d5948c8d20811b99f7c5a6f534503ac9f659499ae8cfe3f20d64cc671192"
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
