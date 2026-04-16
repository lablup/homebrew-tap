class BsshServer < Formula
  desc      "Lightweight SSH server for containers (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.1.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.1.1/bssh-server-macos-aarch64.zip"
      sha256 "88cb473688fd235a3d2671fa3c1ade431a31176dd20048c0b344b883392a4835"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.1/bssh-server-linux-aarch64.tar.gz"
      sha256 "a52fa3d12abdb148b12c2f8354a9dd916856e4ba60b0f78b2d80d7f2f2bb49d0"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.1/bssh-server-linux-x86_64.tar.gz"
      sha256 "25a44e4d7dd704f932c8191901a977cf044776141397f31ef6c84c7b6cf3c15f"
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
