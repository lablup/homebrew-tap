class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "3.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.0/bssh-server-macos-aarch64.zip"
      sha256 "a89e26d71c761adbbc4001667552d567a63f3cd8531860da04c5d6ccca900a73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.0/bssh-server-linux-aarch64.tar.gz"
      sha256 "dcfa04c324c01b8a28b1513e817aff3c88fec7484f186b7eb0004722df5b15a1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.1.0/bssh-server-linux-x86_64.tar.gz"
      sha256 "04003cfd9c762eebd9257859e4d77202a130b1805b050ee964203000bc08d1c9"
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
