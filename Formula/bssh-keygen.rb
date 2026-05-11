class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.1.4"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.1.4/bssh-keygen-macos-aarch64.zip"
      sha256 "6b1b45135ea73229d0fb9f42b1e7d809e1e3277dcac5e7654039a3204bc0f344"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.4/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "6ca0d4678a147a4b874f3dca68e0747d646a8c1e1a3c8d7edd145af75a3f7f66"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.4/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "cae460fdaf575ca0d6af6f3f3ab706a9aef1fcb6f29812fe2e7ec93436c6e129"
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
