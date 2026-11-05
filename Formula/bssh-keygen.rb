class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "3.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.1/bssh-keygen-macos-aarch64.zip"
      sha256 "5ba4aba65c2034d62622f102f5e476d0da03f19baa8475053029b6deb16e59d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v3.1.1/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "4ae993759e5527ef7d4fd26d38ce8d135bafe81f4799ff27dc16d2357c350801"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v3.1.1/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "432240caec4d90454340e0e25692f9e59461b320aef02ebe7dc3d9dd21f3e0d3"
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
