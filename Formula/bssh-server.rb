class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.2.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.2.1/bssh-server-macos-aarch64.zip"
      sha256 "8ffe40d935e6ecf4e735094b295b7d50f1581716fe950a0abfb82559244bd501"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.1/bssh-server-linux-aarch64.tar.gz"
      sha256 "c196af1e6ab0e95f833f01dee9ebbf7710972033f07296293000f33a647095b1"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.1/bssh-server-linux-x86_64.tar.gz"
      sha256 "8c53ae0af9f62a2696eb4d4e0f73ee65725431bf90f9d77cb6ba49dda2590518"
    end
  end

  def install
    bin.install "bssh-server"
    man8.install "bssh-server.8"
  end

  test do
    output = shell_output("#{bin}/bssh-server --version")
    assert_match(/bssh-server\s+#{version}/, output)
  end
end
