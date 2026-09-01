class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "3.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.0.0/bssh-server-macos-aarch64.zip"
      sha256 "ac6ddf26458aceae0e13d51f21eec42ec0d9de0021f1e7f331d0b2c925476a1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.0.0/bssh-server-linux-aarch64.tar.gz"
      sha256 "66a3822a96ec8a42a29d2b2b23193b5ea0c89205996970dff4d21df336443348"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.0.0/bssh-server-linux-x86_64.tar.gz"
      sha256 "ade69aebc80690c0b2a70f31c6aaf4483e64749d3f3f2950cdf449732854e89c"
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
