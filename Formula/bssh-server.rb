class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.2.2"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.2.2/bssh-server-macos-aarch64.zip"
      sha256 "a98af6ff651cf6654ef2ab063465444f5269805b00912514001f88e57847c147"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.2/bssh-server-linux-aarch64.tar.gz"
      sha256 "4f450417c544cf0e059660f90ab9697880eed020d0493a4a4999fac6b166e53d"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.2/bssh-server-linux-x86_64.tar.gz"
      sha256 "861aff00fea6de10429f2dcbe57dccb98351854b311000ab6e1b2fef121d11fe"
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
