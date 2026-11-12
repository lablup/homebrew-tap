class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "3.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.2/bssh-keygen-macos-aarch64.zip"
      sha256 "8756e94ecc0e5b322cd2201c782f5270c6a2e2d02021384395b20d9c269b777e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.2/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "e84383dfe0a0600d84ac11cc329e93770df7ecaaf623734e7cdef8bfa062cb23"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.1.2/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "bf782dda3ff2cc01e47d55df0297f1a32b582edc61bb84725c894ba7eed2a8a8"
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
