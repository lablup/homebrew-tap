class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.4.2"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.4.2/bssh-macos-aarch64.zip"
      sha256 "2d7cc836654002feaa1565f810ce150180a92d55241aac516a67dbff3e270ec5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.4.2/bssh-linux-aarch64.tar.gz"
      sha256 "1617396f1b154f5b3f239a3965ed19af5f7acf3d2077e1184f967fef61d27645"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.4.2/bssh-linux-x86_64.tar.gz"
      sha256 "6dc35b68f0ad9133da8e7118de2f308ca371f6b756215f86b5085a2f3dcff1de"
    end
  end

  def install
    bin.install "bssh"
    man1.install "bssh.1"
  end

  test do
    output = shell_output("#{bin}/bssh --version")
    assert_match(/bssh\s+#{version}/, output)
  end
end
