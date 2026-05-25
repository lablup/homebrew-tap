class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.2.2"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.2.2/bssh-keygen-macos-aarch64.zip"
      sha256 "bd5e4e56d5533f6d980e4ed137a29fcee2abe0fb9db793a13101e3fbed5ae512"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.2/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "8a6c8700bf141c133584066bf422906b928640d3bc1776df8c629a78559ef3fc"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.2/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "109303f84cf39ba537767984ad93ba2d38ce45be33b75c2c4b328c4c44f3fdc8"
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
