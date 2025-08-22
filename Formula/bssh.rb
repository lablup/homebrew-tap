class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "0.5.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v0.5.0/bssh-macos-aarch64.zip"
      sha256 "425d51a6de70ff27d71fb5f59b1f6a75c4fb82039609c8ccab4687015eb4549e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v0.5.0/bssh-linux-aarch64.tar.gz"
      sha256 "7b2cf7e78a2d44c906a8138310539912aab8c42d09cc3cc13a4470f70c81a3e4"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v0.5.0/bssh-linux-x86_64.tar.gz"
      sha256 "6c10c6b6a1f9ceb47535060313db99f2b21d972def352b3e1d46473bc7ac9156"
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
