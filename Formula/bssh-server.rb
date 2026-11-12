class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "3.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.2/bssh-server-macos-aarch64.zip"
      sha256 "ec5eeecca527dc65558b3ed2c1e8865ead96ce95773c1cd5f72343cb28aa3f09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.2/bssh-server-linux-aarch64.tar.gz"
      sha256 "657dee972215defb508f4a14c42b51fead0332e010906e6fab3044f077a0f112"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.1.2/bssh-server-linux-x86_64.tar.gz"
      sha256 "10bf0c7feb49394cc9b07bb4189d58b2ed06842d75681d25cc52b12edd4a5b6b"
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
