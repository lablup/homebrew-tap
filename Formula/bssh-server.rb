class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.1/bssh-server-macos-aarch64.zip"
      sha256 "efb74f5d36b8b61878e38258b6ae89d387d2edf9212c961383c4371cefbb4f7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.1/bssh-server-linux-aarch64.tar.gz"
      sha256 "e8a26cb9c1ef91059a7cbc329d9da3e20c4ebdc1229cc98ec0dd3198a5e62bcb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v2.4.1/bssh-server-linux-x86_64.tar.gz"
      sha256 "938b8e973aba5287425580053cfe90e30e71b22a48fb3abb7d280ab8c0e81d03"
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
