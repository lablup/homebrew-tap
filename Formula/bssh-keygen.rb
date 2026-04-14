class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.0.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.0.1/bssh-keygen-macos-aarch64.zip"
      sha256 "f02c5bcb89836d134d10df5ef54724d82ddab8454331d59a0c26a8d44ee5d714"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.1/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "d363ec06ab173c6a4fb1ae4aec5fe0ed0579630ccd87112de84f0b66be22824a"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.1/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "377a092fbf3405369c2059d5b18fb428fec95e56334c29fd4fe2d8d48bc55e0b"
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
