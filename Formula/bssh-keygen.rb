class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "3.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.3/bssh-keygen-macos-aarch64.zip"
      sha256 "22bfa0be24f413c84012170e7de7712e835adc3d6f4cb9df01a775b40e05083b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.3/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "c847abf1daed1d5861f47c2540cc8da318ece4995071f088fc7a89233635aa15"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.1.3/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "f96dc5c86b502a37b51ac603d4d7b2a11e983c34da4731c1705ca4f8613a0fa7"
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
