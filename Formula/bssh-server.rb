class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.2.3"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.2.3/bssh-server-macos-aarch64.zip"
      sha256 "5f1d1198ea96745b451617c4248f864c760095250df4cffc5d1139f32ca68848"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.3/bssh-server-linux-aarch64.tar.gz"
      sha256 "2f1504a7fa28600365ba8c6e1c10f3d526a1c4bc59ebdca0164803bcd6c97f59"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.3/bssh-server-linux-x86_64.tar.gz"
      sha256 "1ab72e56c137a5d3201cec6b1b1a22ff38b948005601a665952bce2fa88d7688"
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
