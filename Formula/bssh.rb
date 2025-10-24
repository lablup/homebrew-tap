class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.0.0"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.0.0/bssh-macos-aarch64.zip"
      sha256 "d723a8e7d3c96361b86570e4a4c528c4bc69e44909066b5cdf950ad9c5680e69"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.0.0/bssh-linux-aarch64.tar.gz"
      sha256 "2e86e6d1f16bbd09ebe6d40be28dbea71a34a7d2e22a2ae0904c7295f85c38ea"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.0.0/bssh-linux-x86_64.tar.gz"
      sha256 "e0a280d5cffcaeadc378437fcb45f2d5f2360e3d2ca1cb7ef5fad3676366adec"
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
