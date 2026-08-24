class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.4.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.3/bssh-server-macos-aarch64.zip"
      sha256 "d0ac596a7c104bcf94fd512f59b0208c128b23b511ea56cccd5bf55e54e1a5a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.3/bssh-server-linux-aarch64.tar.gz"
      sha256 "07b04e87c636147fe5296326b5cedc68d3e2240397ae47368b47bfd0d6eec132"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v2.4.3/bssh-server-linux-x86_64.tar.gz"
      sha256 "21f680d3a4f0bbab71896b5369557d367da6836578326e28715da78b76394a74"
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
