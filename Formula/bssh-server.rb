class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.1.2"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.1.2/bssh-server-macos-aarch64.zip"
      sha256 "e922efaf909bb38714342305360888de6f7a26617c021665fe7031fcea1d3153"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.2/bssh-server-linux-aarch64.tar.gz"
      sha256 "2b8aec518beff3864080337504affe6ceea60c667fa225fe43149079b7a8c83d"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.2/bssh-server-linux-x86_64.tar.gz"
      sha256 "e3e37a0d16ad02329d68e2865ef5b501165a40cc335d111ff0f61bdfc53327fe"
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
