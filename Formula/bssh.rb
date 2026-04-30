class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.1.3"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.1.3/bssh-macos-aarch64.zip"
      sha256 "a4bb61e7d47600ac9a1a6d9c4c9773f7dc05e2efe249348672f959d7d728d383"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.3/bssh-linux-aarch64.tar.gz"
      sha256 "a25cfae8a85907c3df33dfd1b929d5a9f592e78f0600ee69ea807c21664a5982"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.3/bssh-linux-x86_64.tar.gz"
      sha256 "e144187d8fda6ef44d8624872d9f3c7714d777376e01af58703909ca188f3274"
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
