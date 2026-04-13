class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.0.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-macos-aarch64.zip"
      sha256 "0e3b25de7ea0ab5523f5076e377b7c64f1a165b93be4a2dcd70b66a3f1889a0f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-linux-aarch64.tar.gz"
      sha256 "932134a8856ba5ab1fac2125f2b745eae4584cf830c8bd091162484bdbae00d4"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.0.0/bssh-linux-x86_64.tar.gz"
      sha256 "9b31749cf4de9ffe33d32b6b56087f773f7cb3952032942a42087fc41d7f4ee5"
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
