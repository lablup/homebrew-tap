class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "3.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.0/bssh-keygen-macos-aarch64.zip"
      sha256 "848ca01dd34d5926866b2590dc3bd2b380bbd352bc4ba9991882ba7303b9614e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.0/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "d2ef458421fd2e273f0e6d19b41945cb5a2e60df9a19ca6a89a21519fdd9649d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.1.0/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "2ecebee48136f589a3b135a39993445f1f985a247aeedfe8149b3aed62423e62"
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
