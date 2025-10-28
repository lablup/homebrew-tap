class Bssh < Formula
  desc      "Parallel SSH command execution tool for cluster management"
  homepage  "https://github.com/lablup/bssh"
  version "1.2.1"
  license   "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url     "https://github.com/lablup/bssh/releases/download/v1.2.1/bssh-macos-aarch64.zip"
      sha256 "555685f33b3f2a22c51dc0489e86e399de1c81e4c91c58ba7baa40f54feff51f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url      "https://github.com/lablup/bssh/releases/download/v1.2.1/bssh-linux-aarch64.tar.gz"
      sha256 "96461d4584b666ddc12aacac24701d46b661c70c66ca4f504128ebb2c746224c"
    end
    if Hardware::CPU.intel?
      url      "https://github.com/lablup/bssh/releases/download/v1.2.1/bssh-linux-x86_64.tar.gz"
      sha256 "f5c4e8c1aac196327ab04129383838364a24dd0d0ceeaf6705350a7908140e44"
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
