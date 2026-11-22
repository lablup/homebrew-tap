class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.3/bssh-server-macos-aarch64.zip"
      sha256 "85c36c440729b61839fd4710680950cb9cd4d51b99a34d8a3e4c5fc7a422d06c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.3/bssh-server-linux-aarch64.tar.gz"
      sha256 "ca84210b1a944028d43b66a97cd97a976986fd3ff5cac61a9026833c5d9eed6a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.1.3/bssh-server-linux-x86_64.tar.gz"
      sha256 "a36c2c48f8412ac46c411eef4a1dafd5c2367889ceb89e25cf9d1d26ff55804a"
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
