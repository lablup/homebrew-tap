class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.0.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-macos-aarch64.zip"
      sha256 "2cffebceb1c9cfa4c1b90a2d2716d2e7499faaf7d8bdfaaba50a932728ef707f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-linux-aarch64.tar.gz"
      sha256 "cb60bb352d28f1353bec45858e2bda81bb3e97c4333084f87482a3f77f156414"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-linux-x86_64.tar.gz"
      sha256 "6121b6090265b664a8248e579ad3fb06f351e337ddc6cc7747748cf130fc8572"
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
