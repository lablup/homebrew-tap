class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.5.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.5.1/bssh-macos-aarch64.zip"
      sha256 "f807186c2dc36c83f7b2ff3c2bdad552eb6ee1460ba93fc2a35e3164ce4e7748"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.5.1/bssh-linux-aarch64.tar.gz"
      sha256 "edc9789466211b1ad25a627044827efd2d19234f367a175291be7bfaeeb4d9b8"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.5.1/bssh-linux-x86_64.tar.gz"
      sha256 "43ea97ff0b845a5330c8e375cc0f01788986912e637263069b8cf5cb36aa896e"
    end
  end

  def install
    bin.install "bssh"
  end

  test do
    output = shell_output("#{bin}/bssh --version")
    assert_match(/bssh\s+#{version}/, output)
  end
end
