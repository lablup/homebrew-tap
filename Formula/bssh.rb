class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.4.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.4.1/bssh-macos-aarch64.zip"
      sha256 "00fb7ffcae905b308af2c7c597458ee808f55681020dd4603cb873ef28765fea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.4.1/bssh-linux-aarch64.tar.gz"
      sha256 "797866d360def93536da0cadb3272036777fce14ecc91ebc99016a50010c030b"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.4.1/bssh-linux-x86_64.tar.gz"
      sha256 "b3cc1fa7b5ca9e33c79b70d2ff6de87563e7537f22d83407be41fa7bc95a77b3"
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
