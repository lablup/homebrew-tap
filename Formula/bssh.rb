class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.7.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.7.0/bssh-macos-aarch64.zip"
      sha256 "90550f23ff16422b2118406671d45b1229c8d89bcfb7ba392ba29eaea96bf950"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.7.0/bssh-linux-aarch64.tar.gz"
      sha256 "8a837548ac4c453ad05a1a024a27428098d8583d7894512b7271e59e52677060"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.7.0/bssh-linux-x86_64.tar.gz"
      sha256 "46e463d54dafb2ef5c5aa995776cc7c6b9a0e5b3e4f3651d8a36d43493ff94da"
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
