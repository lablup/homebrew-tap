class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.0.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.0.0/bssh-macos-aarch64.zip"
      sha256 "d104ee6dc87e2313d22da2bb736a62fc345a685c5bca563934891b66e123a988"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.0.0/bssh-linux-aarch64.tar.gz"
      sha256 "565d7dbf070b799266c7805970e2c471e26fa19c08563a8efadaf760a8587eb0"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.0.0/bssh-linux-x86_64.tar.gz"
      sha256 "92f885e9a01b2cc8bef2f1c397d122b4962584eee7212afc87399752c9488a17"
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
