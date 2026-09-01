class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "3.0.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.0.1/bssh-keygen-macos-aarch64.zip"
      sha256 "c50a189a0225a31580fd9702b2ddb161ebb5d9b61a8d88156320565ae3590281"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.0.1/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "eabcc5e9790ae8d2449a5b633eb06a828547dabb21871342cb0e613bb44d848b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.0.1/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "1ece141a184a15e5aa5eae9d0e58846a560ef0f16e9b2071d7b943712147806d"
    end
  end

  def install
    bin.install "bssh-keygen"
    man1.install "bssh-keygen.1"
  end

  test do
    output = shell_output("#{bin}/bssh-keygen --version")
    assert_match(/bssh-keygen\s+#{version}/, output)
  end
end
