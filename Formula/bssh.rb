class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "2.1.2"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v2.1.2/bssh-macos-aarch64.zip"
      sha256 "882777abddd971421e915d89f4529097512f54d9f6fd113f982eb2e3d6aa0e69"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.2/bssh-linux-aarch64.tar.gz"
      sha256 "023e895db0998ad10fda1cfc61b018982e595faaf782c32e78d02f9ddb346f62"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v2.1.2/bssh-linux-x86_64.tar.gz"
      sha256 "d76c70816afb994287ff300ca0e1c6a173cadbc55f3a3f7163695135e9e7a9c9"
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
