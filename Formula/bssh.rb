class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.1/bssh-macos-aarch64.zip"
      sha256 "d2a4c3c331e288bfbfd8e07e91f807860a8920abfc21fd5290bd7d701c8d9ed4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.1/bssh-linux-aarch64.tar.gz"
      sha256 "6766e51042a8b167c5a3c03807d3134f544e92204e8175a91c55f52de7adcbb9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v2.4.1/bssh-linux-x86_64.tar.gz"
      sha256 "57109065d2ca50079b105b4511980e9d58dada70e4d370d020c00c38eb6dea42"
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
