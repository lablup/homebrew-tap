class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.1.3"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.1.3/bssh-server-macos-aarch64.zip"
      sha256 "da927a5b640a9e44a2335169da3e045dd930630d7f1e8a3e12ae5f4cf50626fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.3/bssh-server-linux-aarch64.tar.gz"
      sha256 "4010173360f4e19d8d4070ad2d2503c78e53366e93c05a6734e22dd8cba9bf0e"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.3/bssh-server-linux-x86_64.tar.gz"
      sha256 "ec34f755009204c13cc5b1c6c7487e593e4149145e4dfb8b03e63ab51e20ec6f"
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
