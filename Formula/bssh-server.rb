class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "3.0.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.0.1/bssh-server-macos-aarch64.zip"
      sha256 "6a7a140600e38c6ff5d3ae4a3c00e5e1a91857cdcb8de38e079bb81eb65b4eca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.0.1/bssh-server-linux-aarch64.tar.gz"
      sha256 "0e17b58b107e00462b9c6aa9e3e925ede20b86c8803d7dd833cd44f865699fe9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.0.1/bssh-server-linux-x86_64.tar.gz"
      sha256 "a2ee159a63609726cd748e041db275c5f6b6378022f722d491bca0ff8646aa2e"
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
