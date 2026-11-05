class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "3.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.1/bssh-macos-aarch64.zip"
      sha256 "5be096b2a43f0feba7df9494345a2440a0710f0a22465f666c08a7845ca38cb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.1/bssh-linux-aarch64.tar.gz"
      sha256 "c2ac10fe6cae089ef77ef133931201e1a1076c6c227fadfd28716a4d74d41b76"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.1.1/bssh-linux-x86_64.tar.gz"
      sha256 "36a50661ef24b68178547991abe61476fd61d5fa1b2fde8c681b2eba50402be4"
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
