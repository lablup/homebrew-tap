class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.0.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.0.1/bssh-server-macos-aarch64.zip"
      sha256 "3412460ef9f0ab037f778c28bd5ff9272c1c58310a59c00bc9f754a2e57a1260"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.1/bssh-server-linux-aarch64.tar.gz"
      sha256 "ae26164750b0a18b9ef8fd1d9953114071776d6532f0001e5211c455def36453"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.1/bssh-server-linux-x86_64.tar.gz"
      sha256 "3623e270f0939683b2945d89175b5208227df5d124438ce9951259e6623c11c4"
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
