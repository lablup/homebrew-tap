class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.3.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.3.0/bssh-server-macos-aarch64.zip"
      sha256 "e7455a422c8e5db126600422e905208367f0bceb4bb974cc4bb501f1f8e6063b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.3.0/bssh-server-linux-aarch64.tar.gz"
      sha256 "e4f1469158d0f0c8c2c6481721229934dfae16d0a834f1abfc4ba7d32762a390"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.3.0/bssh-server-linux-x86_64.tar.gz"
      sha256 "a34d88b53f9b31bd1dcddbb8204e476834a88e64dcb776e0b7da01485e605d91"
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
