class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.1.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.1.0/bssh-macos-aarch64.zip"
      sha256 "1819c15c2bf82e3c1d1cd66aa064115e5f65b10aa475702c1fc73b5371d74898"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.1.0/bssh-linux-aarch64.tar.gz"
      sha256 "a110dc2428028f5c4506856559502ed1a4bbd2fddfe1c53cea59a3f8a88a0d5f"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.1.0/bssh-linux-x86_64.tar.gz"
      sha256 "d868c8cd5301cf3bdf1986fdfc7ef7f0eb25f3b6e8fac65b17f6453d4c3f39ca"
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
