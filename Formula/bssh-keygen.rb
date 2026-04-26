class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.1.2"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.1.2/bssh-keygen-macos-aarch64.zip"
      sha256 "a4bc542195be3cf8b2ae55f54cb17fcb7821bce4c44ec1e5f65deb490b39f07d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.2/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "477bf5669f36c2b7a8c25ed06d3c67f5f00a0dccace84e753a54e8902eb40291"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.2/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "fdf0306faeb8abaa4f8ea901455202f7db7b0cd6df03feb5f7b3f339771e4495"
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
