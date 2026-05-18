class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.2.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.2.1/bssh-keygen-macos-aarch64.zip"
      sha256 "8187597485ed7ebd157a648312c8fb1b166edc07e7213bf872027c99a3faa4aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.1/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "9db287c7a0ba0844c7be164ffb72ce8b63071df7f1163845c1d0fe0e089a1789"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.2.1/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "29c853be1a1c8396025e15c94d876d69989ef9772276f91eb7cb0b4a048450ea"
    end
  end

  def install
    bin.install "bssh-keygen"
    man1.install "bssh-keygen.1"
  end

  test do
    output = shell_output("#{bin}/bssh-keygen --version")
    assert_match(/bssh-keygen\s+#{version}/, output)
  end
end
