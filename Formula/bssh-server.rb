class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.2.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.2.0/bssh-server-macos-aarch64.zip"
      sha256 "84242404f2b67292010f0c6de11fe214778bf8e2d65769dca2f936ca801e4d06"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.0/bssh-server-linux-aarch64.tar.gz"
      sha256 "0331d8aaca974dad6282523800664b4288ef2f96fc52bf730a8e5785474416d3"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.0/bssh-server-linux-x86_64.tar.gz"
      sha256 "26c512be1b9896c2925889f83a5eb0d31c8ebaabc76c93a4a38ddb0ada608649"
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
