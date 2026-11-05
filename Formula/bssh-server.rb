class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "3.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.1/bssh-server-macos-aarch64.zip"
      sha256 "8d5b43e0d97d669b92e5151608f8772154ba8620ef96512ec38be9469020dae5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.1/bssh-server-linux-aarch64.tar.gz"
      sha256 "4c969920c6159b81512c4aa2a956f8116ab1f74bd415fc3f596a9f8a8f9aa000"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.1.1/bssh-server-linux-x86_64.tar.gz"
      sha256 "e85e0cd8f36bec757991cb77205aa866375645dba1e173589b1850fd895c9237"
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
