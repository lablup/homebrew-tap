class BsshKeygen < Formula
  desc      "SSH key generator utility for bssh (part of bssh project)"
  homepage  "https://github.com/lablup/bssh"
  version "2.4.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.3/bssh-keygen-macos-aarch64.zip"
      sha256 "cebe4ab75bf82f3f9e20038e3709fd204d6a5f7d17bea80bde79bc3e4aa0a537"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/lablup/bssh/releases/download/v2.4.3/bssh-keygen-linux-aarch64.tar.gz"
      sha256 "bdc0877d46517ff8ba080bb017addbb9f8df6c07f890ec29b2dda69af1c71d6c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lablup/bssh/releases/download/v2.4.3/bssh-keygen-linux-x86_64.tar.gz"
      sha256 "348da8054f0f5e3860b4b6dc891f1982678ffb6ff69bd043b74e4281dc3ad0e2"
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
